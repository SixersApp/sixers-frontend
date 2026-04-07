import 'dart:async';
import 'dart:convert';

import 'package:sixers/utils/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Manages a WebSocket connection to the AppSync Events API using
/// subprotocol-based Cognito authorization.
///
/// Protocol reference:
/// https://docs.aws.amazon.com/appsync/latest/eventapi/event-api-websocket-protocol.html
class AppSyncEventsService {
  static const _httpDomain =
      'f3qdpuylf5bmhlf4kfvu4vulhu.appsync-api.us-west-2.amazonaws.com';
  static const _realtimeDomain =
      'f3qdpuylf5bmhlf4kfvu4vulhu.appsync-realtime-api.us-west-2.amazonaws.com';

  WebSocketChannel? _channel;
  StreamSubscription? _socketSub;
  Timer? _keepAliveTimeoutTimer;
  final _eventController = StreamController<Map<String, dynamic>>.broadcast();
  final Set<String> _subscribedChannels = {};
  bool _disposed = false;
  bool _isAcked = false;
  String? _idToken;
  int _connectionTimeoutMs = 300000;
  final _uuid = const Uuid();

  /// Stream of decoded event payloads from all subscribed channels.
  Stream<Map<String, dynamic>> get events => _eventController.stream;

  /// Whether the WebSocket is currently connected.
  bool get isConnected => _channel != null;

  /// Connect to the AppSync Events real-time endpoint.
  ///
  /// [idToken] is the Cognito ID token for authorization.
  Future<void> connect(String idToken) async {
    if (_disposed) return;
    _idToken = idToken;

    // Encode Cognito auth header into the subprotocol
    final headerJson = jsonEncode({
      'Authorization': idToken,
      'host': _httpDomain,
    });
    var header = base64.encode(utf8.encode(headerJson));
    header = header.replaceAll('+', '-');
    header = header.replaceAll('/', '_');
    header = header.replaceAll('=', '');

    final wsUri = Uri(
      scheme: 'wss',
      host: _realtimeDomain,
      path: '/event/realtime',
    );

    // logInfo('AppSync Events: connecting to $wsUri');

    try {
      _channel = WebSocketChannel.connect(
        wsUri,
        protocols: ['aws-appsync-event-ws', 'header-$header'],
      );
      await _channel!.ready;
      // logInfo('AppSync Events: WebSocket connected');

      _socketSub = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );

      // Step 1: Client must send connection_init to start the handshake
      _channel!.sink.add(jsonEncode({'type': 'connection_init'}));
    } catch (e) {
      logError('AppSync Events: connection failed: $e');
      _channel = null;
      _scheduleReconnect();
    }
  }

  /// Subscribe to a channel (e.g. `/default/tournaments/{tournamentId}`).
  void subscribe(String channel) {
    _subscribedChannels.add(channel);
    if (_channel == null || !_isAcked) return;
    _sendSubscribe(channel);
  }

  /// Unsubscribe from a channel.
  void unsubscribe(String channel) {
    _subscribedChannels.remove(channel);
    if (_channel == null || !_isAcked) return;

    final msg = jsonEncode({
      'type': 'unsubscribe',
      'id': channel,
    });
    _channel!.sink.add(msg);
  }

  /// Disconnect and clean up all resources.
  void dispose() {
    _disposed = true;
    _keepAliveTimeoutTimer?.cancel();
    _keepAliveTimeoutTimer = null;
    _subscribedChannels.clear();
    _socketSub?.cancel();
    _socketSub = null;
    _channel?.sink.close();
    _channel = null;
    _isAcked = false;
    _eventController.close();
  }

  // ---------------------------------------------------------------------------
  // Internal
  // ---------------------------------------------------------------------------

  Map<String, String> get _authorization => {
        'Authorization': _idToken!,
        'host': _httpDomain,
      };

  void _sendSubscribe(String channel) {
    final msg = jsonEncode({
      'type': 'subscribe',
      'id': _uuid.v4(),
      'channel': channel,
      'authorization': _authorization,
    });
    _channel!.sink.add(msg);
    // logInfo('AppSync Events: subscribed to $channel');
  }

  void _onMessage(dynamic raw) {
    final msg = jsonDecode(raw as String) as Map<String, dynamic>;
    final type = msg['type'] as String?;

    switch (type) {
      // Step 2: Server acknowledges connection with timeout config
      case 'connection_ack':
        // logInfo('AppSync Events: connection acknowledged');
        _isAcked = true;
        _connectionTimeoutMs = msg['connectionTimeoutMs'] as int? ?? 300000;
        _resetKeepAliveTimeout();
        // Re-subscribe to all channels after (re)connect
        for (final ch in _subscribedChannels) {
          _sendSubscribe(ch);
        }

      // Step 3: Server sends ka periodically (~60s). Client must NOT reply.
      // If no ka arrives within connectionTimeoutMs, reconnect.
      case 'ka':
        _resetKeepAliveTimeout();

      case 'subscribe_success':
        // logInfo('AppSync Events: subscribe_success for ${msg['id']}');

      // Step 5: Server pushes event data
      case 'data':
        final eventStr = msg['event'];
        if (eventStr is String) {
          final event = jsonDecode(eventStr) as Map<String, dynamic>;
          _eventController.add(event);
        } else if (eventStr is Map) {
          _eventController.add(Map<String, dynamic>.from(eventStr));
        }

      case 'unsubscribe_success':
        // logInfo('AppSync Events: unsubscribe_success for ${msg['id']}');

      case 'subscribe_error':
        logError('AppSync Events: subscribe_error: $msg');

      case 'unsubscribe_error':
        logError('AppSync Events: unsubscribe_error: $msg');

      case 'connection_error':
        logError('AppSync Events: connection_error: $msg');
        _scheduleReconnect();

      default:
        logWarning('AppSync Events: unhandled message type: $type');
    }
  }

  void _onError(Object error) {
    logError('AppSync Events: WebSocket error: $error');
    _isAcked = false;
    _scheduleReconnect();
  }

  void _onDone() {
    logWarning('AppSync Events: WebSocket closed');
    _keepAliveTimeoutTimer?.cancel();
    _keepAliveTimeoutTimer = null;
    _socketSub?.cancel();
    _socketSub = null;
    _channel = null;
    _isAcked = false;
    _scheduleReconnect();
  }

  /// Reset the keep-alive timeout. If no `ka` message arrives from the server
  /// within [_connectionTimeoutMs], the connection is considered dead and we
  /// reconnect.
  void _resetKeepAliveTimeout() {
    _keepAliveTimeoutTimer?.cancel();
    _keepAliveTimeoutTimer = Timer(
      Duration(milliseconds: _connectionTimeoutMs),
      () {
        logWarning(
            'AppSync Events: no ka received within ${_connectionTimeoutMs}ms, reconnecting');
        _channel?.sink.close();
        _channel = null;
        _isAcked = false;
        _scheduleReconnect();
      },
    );
  }

  void _scheduleReconnect() {
    if (_disposed || _idToken == null) return;
    // logInfo('AppSync Events: scheduling reconnect in 3s');
    Future.delayed(const Duration(seconds: 3), () {
      if (_disposed) return;
      connect(_idToken!);
    });
  }
}
