import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'fantasy_team_model.dart';
import 'fantasy_team_service.dart';
import '../auth/auth_provider.dart';

final fantasyTeamsProvider =
    AsyncNotifierProvider<FantasyTeamsNotifier, List<FantasyTeam>>(
  FantasyTeamsNotifier.new,
);

class FantasyTeamsNotifier extends AsyncNotifier<List<FantasyTeam>> {
  late final FantasyTeamService _service;

  @override
  Future<List<FantasyTeam>> build() async {
    _service = FantasyTeamService();

    final auth = ref.watch(authProviderProvider);

    return auth.when(
      loading: () => [],
      error: (_, __) => [],
      data: (session) async {
        final userId = session?.userId;
        if (userId == null || userId.isEmpty) return [];
        return await _service.getAllTeams(userId);
      },
    );
  }

  // ============================================================
  // 🔹 FUNCTION 1: Refresh user’s fantasy teams
  // ============================================================
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncValue.data(await build());
  }

  // ============================================================
  // 🔹 FUNCTION 2: Get fantasy teams in a league
  // ============================================================
  Future<List<FantasyTeam>> getTeamsInLeague(String leagueId) async {
    return await _service.getTeamsInLeague(leagueId);
  }

  // ============================================================
  // 🔹 FUNCTION 3: Get THIS USER'S fantasy team in a league
  // ============================================================
  Future<FantasyTeam?> getTeamForLeague(String leagueId) async {
    final auth = ref.read(authProviderProvider);

    final userId = auth.value?.userId;
    if (userId == null) return null;

    return await _service.getTeamForLeague(
      userId: userId,
      leagueId: leagueId,
    );
  }
}