import 'package:flutter/foundation.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/utils/logger.dart';

class LeagueService {
  final client = Supabase.instance.client;

  Future<List<League>> fetchLeaguesForUser(String userId) async {
    logInfo('[fetchLeaguesForUser] userId = $userId');

    final teamRows = await client.from('fantasy_teams').select('league_id').eq('user_id', userId);

    logDebug('[fetchLeaguesForUser] teamRows: $teamRows');

    final ids = (teamRows as List).map((row) => row['league_id'] as String).toSet().toList();

    if (ids.isEmpty) {
      logInfo('[fetchLeaguesForUser] no league_ids found');
      return [];
    }

    final leagueRows = await client.from('leagues').select().inFilter('id', ids);

    logDebug('[fetchLeaguesForUser] leagueRows: $leagueRows');

    return (leagueRows as List).map((json) => League.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<String> createLeagueWithRules({required League league, required String ownerUserId, List<ScoringRule>? rules}) async {
    final payload = Map<String, dynamic>.from(league.toJson())
      ..remove('id')
      ..remove('join_code')
      ..remove('created_at')
      ..remove('updated_at');

    final rulesJson = (rules == null) ? <Map<String, dynamic>>[] : rules.map((r) => r.toRpcJson()).toList();

    final id = await Supabase.instance.client.rpc(
      'create_league_with_rules',
      params: {'p_league': payload, 'p_owner': ownerUserId, 'p_rules': rulesJson},
    );
    return id as String;
  }

  Future<void> createLeague(League league, String userId) async {
    final inserted = await client.from('leagues').insert(league.toJson()).select().single();

    final leagueId = inserted['id'] as String;

    await client.from('fantasy_teams').insert({'league_id': leagueId, 'user_id': userId, 'team_name': '${league.name} Team'});
  }

  Future<void> updateLeague(League league) async {
    await client.from('leagues').update(league.toJson()).eq('id', league.id);
  }

  Future<void> deleteLeague(String leagueId) async {
    await client.from('leagues').delete().eq('id', leagueId);
  }

  Future<League?> getLeagueById(String id) async {
    final res = await client.from('leagues').select().eq('id', id).maybeSingle();
    return res == null ? null : League.fromJson(res);
  }

  Future<League?> getLeagueByJoinCode(String joinCode) async {
    final res = await client.from('leagues').select().eq('join_code', joinCode).eq('status', 'draft_pending').maybeSingle();
    return res == null ? null : League.fromJson(res);
  }

  Future<void> startDraft(String leagueId) async {
    try {
      final league = await getLeagueById(leagueId);
      if (league == null) {
        throw Exception('League not found: $leagueId');
      }
      final _ = await client.from('leagues').select('id').eq('id', leagueId).maybeSingle();

      final _ = await client.from('leagues').update({'status': 'draft_in_progress'}).eq('id', leagueId);
    } catch (e, st) {
      logError('[startDraft] Error starting draft: $e', st);
      logDebug('[startDraft] Error type: ${e.runtimeType}');
      rethrow;
    }
  }
}
