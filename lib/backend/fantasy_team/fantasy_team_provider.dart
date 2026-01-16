import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/utils/logger.dart';
import '../auth/auth_provider.dart';
import 'fantasy_team_model.dart';
import 'fantasy_team_service.dart';

part 'fantasy_team_provider.g.dart';

@riverpod
class FantasyTeams extends _$FantasyTeams {
  late final FantasyTeamService _service;

  @override
  Future<List<FantasyTeam>> build() async {
    _service = FantasyTeamService();

    // Wait for auth to load
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) return [];

    try {
      return await _service.getAllUsersTeams();
    } catch (e, st) {
      logError("❌ Error loading fantasy teams: $e\n$st");
      rethrow;
    }
  }

  // ------------------------------------------------------------------
  // 🔹 Refresh (same behavior as your Matchups.refresh method)
  // ------------------------------------------------------------------
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }

  // ------------------------------------------------------------------
  // 🔹 Get all fantasy teams inside a league
  // ------------------------------------------------------------------
  Future<List<FantasyTeam>> getTeamsInLeague(String leagueId) async {
    return _service.getTeamsInLeague(leagueId);
  }

  // ------------------------------------------------------------------
  // 🔹 Get THIS USER’S fantasy team for a specific league
  // ------------------------------------------------------------------
  Future<FantasyTeam?> getTeamForLeague(String leagueId) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) return null;

    return _service.getTeamForLeague(leagueId);
  }
}

//
// -------------------- Helper Providers (unchanged) --------------------
//
@riverpod
Future<List<FantasyTeam>> leagueTeams(WidgetRef ref, String leagueId) {
  return ref.watch(fantasyTeamsProvider.notifier).getTeamsInLeague(leagueId);
}

@riverpod
Future<FantasyTeam?> userTeamInLeague(WidgetRef ref, String leagueId) {
  return ref.watch(fantasyTeamsProvider.notifier).getTeamForLeague(leagueId);
}