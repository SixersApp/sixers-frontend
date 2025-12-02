import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'match_service.dart';
import 'match_model.dart';

part 'match_provider.g.dart';

@riverpod
class MatchFeed extends _$MatchFeed {
  late final MatchService _service;

  @override
  Future<List<MatchModel>> build({String? matchId}) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.idToken == null) return [];

    _service = MatchService();

    // --- AUTO REFRESH EVERY 5 SECONDS ---
    final timer = Timer.periodic(const Duration(seconds: 5), (_) {
      // If matchId is null = feed mode, else fetch specific match
      if (matchId == null) {
        refreshFeed();
      } else {
        refreshMatch(matchId);
      }
    });
    ref.onDispose(() => timer.cancel());

    // --- INITIAL LOAD ---
    if (matchId == null) {
      return await _service.fetchHomeFeed();
    }

    final match = await _service.fetchMatchById(matchId);
    return [match];
  }

  // -------------------------------------------------------------
  // Smooth feed refresh (NO loading state, NO flicker)
  // -------------------------------------------------------------
  Future<void> refreshFeed() async {
    final previous = state;

    final nextState = await AsyncValue.guard(() async {
      return await _service.fetchHomeFeed();
    });

    state = nextState.copyWithPrevious(previous);
  }

  // -------------------------------------------------------------
  // Smooth single-match refresh (same behavior)
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