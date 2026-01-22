import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../fantasy_team/fantasy_team_provider.dart';
import 'fantasy_team_instance_model.dart';
import 'fantasy_team_instance_service.dart';

final fantasyTeamInstancesProvider = AsyncNotifierProvider<FantasyTeamInstancesNotifier, List<FantasyTeamInstance>>(
  FantasyTeamInstancesNotifier.new,
);

class FantasyTeamInstancesNotifier extends AsyncNotifier<List<FantasyTeamInstance>> {
  late final FantasyTeamInstanceService _service;
  String? _currentTeamId;

  @override
  Future<List<FantasyTeamInstance>> build() async {
    // default state is empty list
    _service = FantasyTeamInstanceService();
    return [];
  }

  // ============================================================
  // 🔹 FUNCTION 1: Load all instances for a fantasy team
  // ============================================================
  Future<List<FantasyTeamInstance>> loadAllInstances({required String fantasy_team_id}) async {
    state = const AsyncLoading();
    _currentTeamId = fantasy_team_id;
    final instances = await _service.getAllInstances(fantasy_team_id: fantasy_team_id);
    state = AsyncData(instances);
    return instances;
  }

  // ============================================================
  // 🔹 FUNCTION 2: Load all instances for a league (finds user's team first)
  // ============================================================
  Future<List<FantasyTeamInstance>> loadAllInstancesForLeague({required String leagueId}) async {
    state = const AsyncLoading();

    final userTeam = await ref.read(fantasyTeamsProvider.notifier).getTeamForLeague(leagueId);

    if (userTeam == null) {
      state = const AsyncData([]);
      return [];
    }

    return await loadAllInstances(fantasy_team_id: userTeam.id);
  }

  // ============================================================
  // 🔹 FUNCTION 3: Get a specific instance by match number from loaded instances
  // ============================================================
  FantasyTeamInstance? getInstanceByMatchNum(int match_num) {
    final instances = state.value;
    if (instances == null) return null;

    try {
      return instances.firstWhere((instance) => instance.match_num == match_num);
    } catch (e) {
      return null;
    }
  }

  // ============================================================
  // 🔹 FUNCTION 4: Refresh all instances
  // ============================================================
  Future<void> refresh() async {
    if (_currentTeamId == null) return;
    await loadAllInstances(fantasy_team_id: _currentTeamId!);
  }
}
