import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/match/feed_group_model.dart';
import 'match_service.dart';

part 'match_provider.g.dart';

@riverpod
class MatchFeed extends _$MatchFeed {
  final MatchService _service = MatchService();
  Timer? _timer;
  bool _pollingStarted = false;
  bool _mounted = true;

  @override
  Future<List<FeedGroupModel>> build() async {
    // Cleanup
    _mounted = true;
    ref.onDispose(() {
      _mounted = false;
      _timer?.cancel();
      _timer = null;
      _pollingStarted = false;
    });

    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) {
      return [];
    }

    // Start polling AFTER first successful build
    if (!_pollingStarted) {
      _pollingStarted = true;
      _startPolling();
    }

    // Initial fetch
    return _service.fetchHomeFeed();
  }

  // -------------------------------------------------------------
  // Polling
  // -------------------------------------------------------------
  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_mounted) return;

      refreshFeed();
    });
  }

  // -------------------------------------------------------------
  // Smooth feed refresh
  // -------------------------------------------------------------
  Future<void> refreshFeed() async {
    final nextState = await AsyncValue.guard(() async {
      return _service.fetchHomeFeed();
    });
    if (!_mounted) return;

    state = nextState;
  }
}
