import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/utils/logger.dart';
import 'league_model.dart';

class LeagueService {
  final _dio = ApiClient.dio;

  Future<List<League>> getLeagues() async {
    final res = await _dio.get("/leagues");

    if (res.statusCode != 200 || res.data is! List) return [];

    return (res.data as List)
        .map((e) => League.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<League> createLeague({
    required String name,
    required String tournamentId,
    required String teamName,
    required String teamColor,
    required String teamAbbreviation,
    String? teamIcon,
    int maxTeams = 10,
    List<LeagueScoringRule>? scoringRules,
  }) async {
    final body = {
      'name': name,
      'tournament_id': tournamentId,
      'max_teams': maxTeams,
      'team': {
        'name': teamName,
        'color': teamColor,
        'abbreviation': teamAbbreviation,
        if (teamIcon != null) 'icon': teamIcon,
      },
      'scoring_rules': scoringRules?.map((r) => r.toJson()).toList(),
    };

    logInfo('Creating league with body: $body');

    try {
      final res = await _dio.post("/leagues", data: body);
      logInfo('Create league response: ${res.statusCode} - ${res.data}');

      if (res.statusCode != 201) {
        throw Exception('Failed to create league: ${res.statusCode}');
      }

      return League.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      logError('Create league error: $e');
      rethrow;
    }
  }

  Future<List<LeagueScoringRule>> getDefaultScoringRules() async {
    final res = await _dio.get("/leagues/scoring-rules");

    if (res.statusCode != 200 || res.data is! List) return [];

    logInfo('Raw scoring rules response: ${res.data}');

    return (res.data as List)
        .map((e) => LeagueScoringRule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Tournament>> getTournaments() async {
    final res = await _dio.get("/tournaments");

    if (res.statusCode != 200 || res.data is! List) return [];

    logInfo('Raw tournaments response: ${res.data}');

    return (res.data as List)
        .map((e) => Tournament.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<DraftSettings> updateDraftSettings({
    required String leagueId,
    int? timePerPick,
    int? pickWarningSeconds,
    bool? snakeDraft,
  }) async {
    final body = <String, dynamic>{};
    if (timePerPick != null) body['time_per_pick'] = timePerPick;
    if (pickWarningSeconds != null)
      body['pick_warning_seconds'] = pickWarningSeconds;
    if (snakeDraft != null) body['snake_draft'] = snakeDraft;

    logInfo('Updating draft settings for league $leagueId with body: $body');

    try {
      final res = await _dio.put(
        "/leagues/$leagueId/draft-settings",
        data: body,
      );
      logInfo(
        'Update draft settings response: ${res.statusCode} - ${res.data}',
      );

      if (res.statusCode != 200) {
        throw Exception('Failed to update draft settings: ${res.statusCode}');
      }

      return DraftSettings.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      logError('Update draft settings error: $e');
      rethrow;
    }
  }

  Future<League?> findLeagueByCode(String joinCode) async {
    logInfo('Finding league with code: $joinCode');

    try {
      final res = await _dio.get("/leagues/join/$joinCode");
      logInfo('Find league response: ${res.statusCode} - ${res.data}');

      if (res.statusCode != 200) {
        return null;
      }

      return League.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      logError('Find league by code error: $e');
      return null;
    }
  }

  Future<League> joinLeague({
    required String joinCode,
    required String teamName,
    required String teamColor,
    required String teamAbbreviation,
    String? teamIcon,
  }) async {
    final body = {
      'team_name': teamName,
      'team_color': teamColor,
      'abbreviation': teamAbbreviation,
      if (teamIcon != null) 'team_icon': teamIcon,
    };

    logInfo('Joining league with code $joinCode, body: $body');

    try {
      final res = await _dio.post("/leagues/join/$joinCode", data: body);
      logInfo('Join league response: ${res.statusCode} - ${res.data}');

      if (res.statusCode != 200 && res.statusCode != 201) {
        throw Exception(
          'Failed to join league: ${res.statusCode} \n\n ${res.data["message"]}',
        );
      }

      return League.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      logError('Join league error: $e');
      rethrow;
    }
  }

  Future<List<LeagueScoringRule>> updateLeagueScoringRules({
    required String leagueId,
    required List<LeagueScoringRule> scoringRules,
  }) async {
    final rules = scoringRules.map((r) => r.toJson()).toList();

    logInfo(
      'Updating scoring rules for league $leagueId, count: ${rules.length}',
    );
    logInfo('Rules body: $rules');

    try {
      final res = await _dio.put(
        "/leagues/$leagueId/scoring-rules",
        data: {"scoring_rules": rules},
      );
      logInfo('Update scoring rules response: ${res.statusCode} - ${res.data}');

      if (res.statusCode != 200) {
        throw Exception('Failed to update scoring rules: ${res.statusCode}');
      }

      return (res.data as List)
          .map((e) => LeagueScoringRule.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logError('Update scoring rules error: $e');
      rethrow;
    }
  }
}
