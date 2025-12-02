// lib/backend/fantasy_team/fantasy_team_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_provider.dart';
import 'fantasy_team_model.dart';
import 'fantasy_team_service.dart';

final fantasyTeamsProvider =
    AsyncNotifierProvider<FantasyTeamsNotifier, List<FantasyTeam>>(
  FantasyTeamsNotifier.new,
);

class FantasyTeamsNotifier extends AsyncNotifier<List<FantasyTeam>> {
  late final FantasyTeamService _service;

  @override
  Future<List<FantasyTeam>> build() async {
    _service = FantasyTeamService();

    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) {
      return [];
    }

    try {
      return await _service.getAllUsersTeams();
    } catch (e, st) {
      // ignore: avoid_print
      print("Error loading user fantasy teams: $e\n$st");
      throw e;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }

  /// Get ALL fantasy teams in a league
  Future<List<FantasyTeam>> getTeamsInLeague(String leagueId) async {
    return _service.getTeamsInLeague(leagueId);
  }

  /// Get THIS USER'S fantasy team in a given league
  Future<FantasyTeam?> getTeamForLeague(String leagueId) async {
    final auth = await ref.watch(authProviderProvider.future);
    final userId = auth?.userId;
    if (userId == null || userId.isEmpty) return null;

    return _service.getTeamForLeague(leagueId);
  }
}

// ------------------------------------------------------------
// 🔹 Helper Provider 1: All fantasy teams in a league
// ------------------------------------------------------------
final leagueTeamsProvider =
    FutureProvider.family<List<FantasyTeam>, String>((ref, leagueId) {
  return ref.read(fantasyTeamsProvider.notifier)
      .getTeamsInLeague(leagueId);
});

// ------------------------------------------------------------
// 🔹 Helper Provider 2: This user's fantasy team in a league
// ------------------------------------------------------------
final userTeamInLeagueProvider =
    FutureProvider.family<FantasyTeam?, String>((ref, leagueId) {
  return ref.read(fantasyTeamsProvider.notifier)
      .getTeamForLeague(leagueId);
});