import '../auth/dio_client.dart';
import 'fantasy_team_model.dart';

class FantasyTeamService {
  Future<List<FantasyTeam>> getAllUsersTeams() async {
    final res = await ApiClient.dio.get("/fantasy-teams/user");
    return (res.data as List)
        .map((e) => FantasyTeam.fromJson(e))
        .toList();
  }

  Future<FantasyTeam?> getTeamForLeague(String leagueId) async {
    final res = await ApiClient.dio.get(
      "/fantasy-teams/user",
      queryParameters: { "leagueId": leagueId },
    );

    if (res.data == null) return null;
    return FantasyTeam.fromJson(res.data);
  }

  Future<List<FantasyTeam>> getTeamsInLeague(String leagueId) async {
    final res = await ApiClient.dio.get(
      "/fantasy-teams",
      queryParameters: { "leagueId": leagueId },
    );
    return (res.data as List)
        .map((e) => FantasyTeam.fromJson(e))
        .toList();
  }
}