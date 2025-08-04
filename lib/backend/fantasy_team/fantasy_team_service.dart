// lib/fantasy_teams/fantasy_team_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'fantasy_team_model.dart';

class FantasyTeamService {
  final client = Supabase.instance.client;

  /// Get all fantasy teams for a specific user
  Future<List<FantasyTeam>> getUserFantasyTeams(String userId) async {
    final res = await client
        .from('fantasy_teams')
        .select()
        .eq('user_id', userId);

    return (res as List).map((json) => FantasyTeam.fromJson(json)).toList();
  }

  Future<FantasyTeam?> getTeamById(String id) async {
    final res = await client
        .from('fantasy_teams')
        .select()
        .eq('id', id)
        .maybeSingle();

    return res == null ? null : FantasyTeam.fromJson(res);
  }

  Future<void> createTeam(FantasyTeam team) async {
    await client.from('fantasy_teams').insert(team.toJson());
  }

  Future<void> updateTeam(FantasyTeam team) async {
    await client.from('fantasy_teams').update(team.toJson()).eq('id', team.id);
  }

  Future<void> deleteTeam(String id) async {
    await client.from('fantasy_teams').delete().eq('id', id);
  }
}
