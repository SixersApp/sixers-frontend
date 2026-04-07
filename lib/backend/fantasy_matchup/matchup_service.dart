import 'package:sixers/utils/logger.dart';

import '../auth/dio_client.dart';
import 'matchup_model.dart';

class MatchupService {
  final _dio = ApiClient.dio;

  Future<WeekMatchupGroup?> getWeekMatchups(String leagueId, int matchNum) async {
    final res = await _dio.get('/matchups/league/$leagueId/week/$matchNum');
    if (res.statusCode != 200 || res.data is! Map) return null;
    return WeekMatchupGroup.fromJson(res.data as Map<String, dynamic>);
  }

  Future<List<LeagueMatchupGroup>> getMatchups() async {
    final res = await _dio.get("/matchups/feed");
    // Debug: log player projection fields
    if (res.data is List && (res.data as List).isNotEmpty) {
      final firstGroup = res.data[0] as Map<String, dynamic>;
      final matchups = firstGroup['matchups'] as List?;
      if (matchups != null && matchups.isNotEmpty) {
        final firstMatchup = matchups[0] as Map<String, dynamic>;
        final team1 = firstMatchup['team1'] as Map<String, dynamic>;
        final players = team1['players'] as List;
        if (players.isNotEmpty) {
          final p = players[0];
          logInfo('Sample player keys: ${(p as Map).keys.toList()}');
          logInfo('Sample player: name=${p['name']}, projectedPoints=${p['projectedPoints']}');
        }
      }
    }

    if (res.statusCode != 200 || res.data is! List) return [];

    return (res.data as List)
        .map((e) => LeagueMatchupGroup.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
