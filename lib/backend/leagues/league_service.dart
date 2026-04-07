import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/leagues/league_position_rule_model.dart';
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
    required int maxTeams,
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

    try {
      final res = await _dio.post("/leagues", data: body);

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

    return (res.data as List)
        .map((e) => LeagueScoringRule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Tournament>> getTournaments() async {
    final res = await _dio.get("/tournaments");

    if (res.statusCode != 200 || res.data is! List) return [];

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

    try {
      final res = await _dio.put(
        "/leagues/$leagueId/draft-settings",
        data: body,
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
    try {
      final res = await _dio.get("/leagues/join/$joinCode");

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

    try {
      final res = await _dio.post("/leagues/join/$joinCode", data: body);

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

  Future<League> updateDraftOrder({
    required String leagueId,
    required List<Map<String, Object>> teamIds,
  }) async {
    try {
      final res = await _dio.put(
        "/leagues/$leagueId/draft-order",
        data: {"draft_order": teamIds},
      );

      if (res.statusCode != 200) {
        throw Exception('Failed to update draft order: ${res.statusCode}');
      }

      return League.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      logError('Update draft order error: $e');
      rethrow;
    }
  }

  Future<List<LeagueScoringRule>> updateLeagueScoringRules({
    required String leagueId,
    required List<LeagueScoringRule> scoringRules,
  }) async {
    final rules = scoringRules.map((r) => r.toJson()).toList();

    try {
      final res = await _dio.put(
        "/leagues/$leagueId/scoring-rules",
        data: {"scoring_rules": rules},
      );

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

  Future<List<LeaguePositionRule>> getLeaguePositionRules({
    required String leagueId,
  }) async {
    try {
      final res = await _dio.get("/leagues/$leagueId/position-rules");
      
      if (res.statusCode != 200 || res.data is! List) {
        return [];
      }

      return (res.data as List)
          .map((e) => LeaguePositionRule.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logError('Get league position rules error: $e');
      return [];
    }
  }
}
