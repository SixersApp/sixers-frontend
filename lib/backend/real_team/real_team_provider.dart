import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/real_team/real_team_model.dart';
import 'package:sixers/backend/real_team/real_team_service.dart';

part 'real_team_provider.g.dart';

@riverpod
class RealTeams extends _$RealTeams {
  final _service = RealTeamService();

  @override
  Future<List<RealTeam>> build({String? tournamentId}) async {
    if (tournamentId == null) {
      return _service.fetchAllTeams();
    }
    return _service.fetchTeamsForTournament(tournamentId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (tournamentId == null) {
        return _service.fetchAllTeams();
      }
      return _service.fetchTeamsForTournament(tournamentId!);
    });
  }

  Future<void> createTeam(RealTeam team) async {
    await _service.createTeam(team);
    await refresh();
  }

  Future<void> updateTeam(RealTeam team) async {
    await _service.updateTeam(team);
    await refresh();
  }

  Future<void> deleteTeam(String id) async {
    await _service.deleteTeam(id);
    await refresh();
  }

  Future<RealTeam?> getTeamById(String id) => _service.getTeamById(id);
}
