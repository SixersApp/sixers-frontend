import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../fantasy_team/fantasy_team_provider.dart';
import 'fantasy_team_instance_model.dart';
import 'fantasy_team_instance_service.dart';

final fantasyTeamInstanceProvider = AsyncNotifierProvider<FantasyTeamInstanceNotifier, FantasyTeamInstance?>(
  FantasyTeamInstanceNotifier.new,
);

class FantasyTeamInstanceNotifier extends AsyncNotifier<FantasyTeamInstance?> {
  late final FantasyTeamInstanceService _service;

  @override
  Future<FantasyTeamInstance?> build() async {
    // default state is null
    _service = FantasyTeamInstanceService();
    return null;
  }

  // ============================================================
  // 🔹 FUNCTION 1: Direct lookup by fantasyTeamId + matchNum
  // ============================================================
  Future<FantasyTeamInstance?> getInstance({required String fantasy_team_id, required int match_num}) async {
    final instance = await _service.getInstance(fantasy_team_id: fantasy_team_id, match_num: match_num);
    state = AsyncData(instance);
    return instance;
  }

  // ============================================================
  // 🔹 FUNCTION 2: Lookup instance using leagueId + matchNum
  //    → Automatically finds the user's fantasy team
  // ============================================================
  Future<FantasyTeamInstance?> getInstanceForLeague({required String leagueId, required int match_num}) async {
    final userTeam = await ref.read(fantasyTeamsProvider.notifier).getTeamForLeague(leagueId);

    if (userTeam == null) {
      state = const AsyncData(null);
      return null;
    }

    final instance = await _service.getInstance(fantasy_team_id: userTeam.id, match_num: match_num);

    state = AsyncData(instance);
    return instance;
  }

  // ============================================================
  // 🔹 FUNCTION 3: Refresh last-loaded instance
  // ============================================================
  Future<void> refresh() async {
    final previous = state.value;

    if (previous == null) return;

    await getInstance(fantasy_team_id: previous.fantasy_team_id, match_num: previous.match_num);
  }
}
