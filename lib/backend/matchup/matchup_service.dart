import 'package:supabase_flutter/supabase_flutter.dart';
import 'matchup_model.dart';

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
