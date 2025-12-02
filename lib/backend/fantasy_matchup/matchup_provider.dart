// lib/backend/fantasy_matchup/matchup_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../auth/auth_provider.dart';
import 'matchup_model.dart';
import 'matchup_service.dart';

part 'matchup_provider.g.dart';

@riverpod
class UserMatchups extends _$UserMatchups {
  @override
  Future<List<Matchup>> build(int matchNum) async {
    // Wait for authentication to finish loading
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];

    final service = MatchupService();

    try {
      return await service.getMatchups(matchNum: matchNum);
    } catch (e, st) {
      print("❌ Error loading matchups for matchNum=$matchNum: $e\n$st");
      rethrow;
    }
  }

  /// Allows manual refreshing
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(matchNum));
  }
}