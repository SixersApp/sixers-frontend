import 'package:supabase_flutter/supabase_flutter.dart';
import 'matchup_model.dart';
import 'package:sixers/utils/logger.dart';

class MatchupService {
  final client = Supabase.instance.client;

  Future<List<Matchup>> fetchMatchupsForLeague(String leagueId) async {
    final rows = await client
        .from('matchups')
        .select('''
          *,
          team1:team1_id (
            *,
            fantasy_team:fantasy_team_id (*)
          ),
          team2:team2_id (
            *,
            fantasy_team:fantasy_team_id (*)
          )
        ''')
        .eq('league_id', leagueId)
        .order('scheduled_time');

    return (rows as List).map((row) => Matchup.fromJson(row as Map<String, dynamic>)).toList();
  }

  Future<List<Matchup>> fetchMatchupsForUser(String userId) async {
    try {
      logInfo('[MatchupService.fetchMatchupsForUser] userId=$userId');

      // Resolve user's fantasy team ids first
      final teamRows = await client.from('fantasy_teams').select('id').eq('user_id', userId);
      final teamIds = (teamRows as List).map((e) => (e as Map<String, dynamic>)['id'] as String).toList();
      logDebug('[MatchupService.fetchMatchupsForUser] teamIds=${teamIds.length} -> $teamIds');
      if (teamIds.isEmpty) return [];

      // Resolve instance ids for those fantasy teams
      final instanceRows = await client
          .from('fantasy_team_instance')
          .select('id,fantasy_team_id')
          .inFilter('fantasy_team_id', teamIds);
      final instanceIds = (instanceRows as List).map((e) => (e as Map<String, dynamic>)['id'] as String).toList();
      logDebug('[MatchupService.fetchMatchupsForUser] instanceIds=${instanceIds.length}');
      if (instanceIds.isEmpty) return [];
      final inList = 'in.(${instanceIds.join(',')})';
      logDebug('[MatchupService.fetchMatchupsForUser] filterExpr=team1_id.$inList OR team2_id.$inList');

      final rows = await client
          .from('matchups')
          .select('''
            *,
            team1:team1_id (
              *,
              fantasy_team:fantasy_team_id (*)
            ),
            team2:team2_id (
              *,
              fantasy_team:fantasy_team_id (*)
            )
          ''')
          .or('team1_id.$inList,team2_id.$inList')
          .order('scheduled_time');

      logInfo('[MatchupService.fetchMatchupsForUser] fetched ${(rows as List).length} rows');
      return rows.map((row) => Matchup.fromJson(row)).toList();
    } catch (e, st) {
      logError('[MatchupService.fetchMatchupsForUser] ERROR: $e', st);
      rethrow;
    }
  }

  Future<Matchup?> getMatchupById(String id) async {
    final row = await client
        .from('matchups')
        .select('''
          *,
          team1:team1_id (
            *,
            fantasy_team:fantasy_team_id (*)
          ),
          team2:team2_id (
            *,
            fantasy_team:fantasy_team_id (*)
          )
        ''')
        .eq('id', id)
        .maybeSingle();

    return row == null ? null : Matchup.fromJson(row);
  }

  Future<void> createMatchup(Matchup matchup) => client.from('matchups').insert(matchup.toJson());

  Future<void> updateMatchup(Matchup matchup) => client.from('matchups').update(matchup.toJson()).eq('id', matchup.id);

  Future<void> deleteMatchup(String id) => client.from('matchups').delete().eq('id', id);
}
