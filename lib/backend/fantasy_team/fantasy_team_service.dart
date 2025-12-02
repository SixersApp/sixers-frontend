import 'package:dio/dio.dart';
import 'fantasy_team_model.dart';
import '../auth/dio_client.dart';

class FantasyTeamService {
  final Dio _dio = ApiClient.dio; 

  /// Get ALL fantasy teams for a user
  Future<List<FantasyTeam>> getAllTeams(String userId) async {
    final res = await _dio.get("/fantasy-teams?userId=$userId");
    return (res.data as List)
        .map((j) => FantasyTeam.fromJson(j))
        .toList();
  }

  /// Get fantasy team for this user inside a specific league
  Future<FantasyTeam?> getTeamForLeague({
    required String userId,
    required String leagueId,
  }) async {
    final res = await _dio.get("/user-fantasy-team/by-league?leagueId=$leagueId");

    if (res.data == null) return null;

    final allTeams = (res.data as List)
        .map((j) => FantasyTeam.fromJson(j))
        .toList();

    try {
      return allTeams.firstWhere((t) => t.userId == userId);
    } catch (e) {
      return null;
    }
  }

  /// Get ALL fantasy teams inside a league
  Future<List<FantasyTeam>> getTeamsInLeague(String leagueId) async {
    final res = await _dio.get("/fantasy-teams/in-league?leagueId=$leagueId");

    return (res.data as List)
        .map((j) => FantasyTeam.fromJson(j))
        .toList();
  }
}