
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'fantasy_team_model.dart';
import 'fantasy_team_service.dart';

part 'fantasy_team_provider.g.dart';

@riverpod
class FantasyTeams extends _$FantasyTeams {
  final _service = FantasyTeamService();
  String? _leagueId; 

  @override
  Future<List<FantasyTeam>> build({String? leagueId}) async {
    _leagueId = leagueId;
    if (leagueId != null) {
      return _service.fetchTeamsForLeague(leagueId);
    }
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return [];
    return _service.fetchTeamsForUser(uid);
  }

  

  Future<void> refresh() async {
    state = const AsyncLoading();
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) {
      state = const AsyncData([]);
      return;
    }
    state = await AsyncValue.guard(() => _service.fetchTeamsForUser(uid));
  }

  Future<void> createTeam(FantasyTeam team) async {
    await _service.createTeam(team);
    await refresh();
  }

  Future<void> updateTeam(FantasyTeam team) async {
    await _service.updateTeam(team);
    await refresh();
  }

  Future<void> deleteTeam(String id) async {
    await _service.deleteTeam(id);
    await refresh();
  }

  Future<FantasyTeam?> getTeamById(String id) => _service.getTeamById(id);
}
