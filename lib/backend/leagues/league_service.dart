// lib/services/league_service.dart
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeagueService {
  final client = Supabase.instance.client;

  /// Get all leagues where the user owns a fantasy team
  Future<List<League>> fetchLeaguesForUser(String userId) async {
    final rows = await client
        .from('fantasy_teams')
        .select('leagues(*)')
        .eq('user_id', userId);

    return (rows as List)
        .map((row) => League.fromJson(row['leagues']))
        .toList();
  }

  /// Create a league and add the creator as a fantasy team
  Future<void> createLeague(League league, String userId) async {
    final inserted = await client
        .from('leagues')
        .insert(league.toJson())
        .select()
        .single();

    final leagueId = inserted['id'] as String;

    await client.from('fantasy_teams').insert({
      'league_id': leagueId,
      'user_id': userId,
      'team_name': '${league.name} Team',
    });
  }

  Future<void> updateLeague(League league) async {
    await client.from('leagues').update(league.toJson()).eq('id', league.id);
  }

  Future<void> deleteLeague(String leagueId) async {
    await client.from('leagues').delete().eq('id', leagueId);
  }

  Future<League?> getLeagueById(String id) async {
    final res = await client
        .from('leagues')
        .select()
        .eq('id', id)
        .maybeSingle();
    return res == null ? null : League.fromJson(res);
  }
}
