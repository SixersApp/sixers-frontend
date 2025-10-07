import 'package:supabase_flutter/supabase_flutter.dart';
import 'real_team_model.dart';
import 'package:sixers/utils/logger.dart';

class RealTeamService {
  final client = Supabase.instance.client;

  Future<List<RealTeam>> fetchAllTeams() async {
    final rows = await client.from('real_teams').select();
    return (rows as List).map((r) => RealTeam.fromJson(r as Map<String, dynamic>)).toList();
  }

  Future<List<RealTeam>> fetchTeamsForTournament(String tournamentId) async {
    logDebug("fetching all tournmanet teams");
    final rows = await client.from('real_teams').select().eq('tournament_id', tournamentId);
    return (rows as List).map((r) => RealTeam.fromJson(r as Map<String, dynamic>)).toList();
  }

  Future<RealTeam?> getTeamById(String id) async {
    final row = await client.from('real_teams').select().eq('id', id).maybeSingle();
    return row == null ? null : RealTeam.fromJson(row);
  }

  Future<void> createTeam(RealTeam team) async {
    await client.from('real_teams').insert({'id': team.id, 'tournament_id': team.tournamentId, 'name': team.name});
  }

  Future<void> updateTeam(RealTeam team) async {
    await client.from('real_teams').update({'tournament_id': team.tournamentId, 'name': team.name}).eq('id', team.id);
  }

  Future<void> deleteTeam(String id) async {
    await client.from('real_teams').delete().eq('id', id);
  }
}
