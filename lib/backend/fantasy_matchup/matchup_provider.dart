// lib/backend/fantasy_matchup/matchup_provider.dart

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../auth/auth_provider.dart';
import 'matchup_model.dart';
import 'matchup_service.dart';

part 'matchup_provider.g.dart';

@riverpod
class UserMatchups extends _$UserMatchups {
  @override
  Future<List<Matchup>> build(int matchNum) async {
    final timer = Timer.periodic(const Duration(seconds: 5), (_) {
      refresh();
    });
    ref.onDispose(() => timer.cancel());

    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];

    return MatchupService().getMatchups(matchNum: matchNum);
  }

  Future<void> refresh() async {
    final previous = state;

    final newState = await AsyncValue.guard(() async {
      final auth = await ref.watch(authProviderProvider.future);
      if (auth == null) return <Matchup>[];
      return MatchupService().getMatchups(matchNum: matchNum);
    });

    state = newState.copyWithPrevious(previous);
  }
}
