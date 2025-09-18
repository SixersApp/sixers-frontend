import 'package:supabase_flutter/supabase_flutter.dart';
import 'fantasy_team_model.dart';

class FantasyTeamService {
  final client = Supabase.instance.client;

  Future<List<FantasyTeam>> fetchTeamsForUser(String userId) async {
    final rows = await client.from('fantasy_teams').select().eq('user_id', userId);

    return (rows as List).map((row) => FantasyTeam.fromJson(row as Map<String, dynamic>)).toList();
  }

  Future<List<FantasyTeam>> fetchTeamsForLeague(String leagueId) async {
    final rows = await client.from('fantasy_teams').select().eq('league_id', leagueId);

    return (rows as List).map((row) => FantasyTeam.fromJson(row as Map<String, dynamic>)).toList();
  }

  Future<FantasyTeam?> getTeamById(String id) async {
    final row = await client.from('fantasy_teams').select().eq('id', id).maybeSingle();
    return row == null ? null : FantasyTeam.fromJson(row);
  }

  Future<FantasyTeam?> getTeamForUser(String userId) async {
    final row = await client.from('fantasy_teams').select().eq('user_id', userId).maybeSingle();
    return row == null ? null : FantasyTeam.fromJson(row);
  }

  Future<void> createTeam(FantasyTeam team) => client.from('fantasy_teams').insert(team.toJson());

  Future<void> updateTeam(FantasyTeam team) => client.from('fantasy_teams').update(team.toJson()).eq('id', team.id);

  Future<void> deleteTeam(String id) => client.from('fantasy_teams').delete().eq('id', id);
}
