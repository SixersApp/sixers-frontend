import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'match_service.dart';
import 'match_model.dart';

part 'match_provider.g.dart';

@riverpod
class MatchFeed extends _$MatchFeed {
  final MatchService _service = MatchService();
  Timer? _timer;
  bool _pollingStarted = false;

  @override
  Future<List<MatchModel>> build({String? matchId}) async {
    // Cleanup
    ref.onDispose(() {
      _timer?.cancel();
      _timer = null;
      _pollingStarted = false;
    });

    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.idToken == null) {
      return [];
    }

    // Start polling AFTER first successful build
    if (!_pollingStarted) {
      _pollingStarted = true;
      _startPolling(matchId);
    }

    // Initial fetch
    if (matchId == null) {
      return _service.fetchHomeFeed();
    }

    final match = await _service.fetchMatchById(matchId);
    return [match];
  }

  // -------------------------------------------------------------
  // Polling
  // -------------------------------------------------------------
  void _startPolling(String? matchId) {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (matchId == null) {
        refreshFeed();
      } else {
        refreshMatch(matchId);
      }
    });
  }

  // -------------------------------------------------------------
  // Smooth feed refresh
  // -------------------------------------------------------------
  Future<void> refreshFeed() async {
    final previous = state;

    final nextState = await AsyncValue.guard(() async {
      return _service.fetchHomeFeed();
    });

    state = nextState.copyWithPrevious(previous);
  }

  // -------------------------------------------------------------
  // Smooth single match refresh
  // -------------------------------------------------------------
  Future<void> refreshMatch(String matchId) async {
    final previous = state;

    final nextState = await AsyncValue.guard(() async {
      final match = await _service.fetchMatchById(matchId);
      return [match];
    });

    state = nextState.copyWithPrevious(previous);
  }
}