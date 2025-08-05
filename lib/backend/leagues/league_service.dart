// lib/services/league_service.dart
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeagueService {
  final client = Supabase.instance.client;

  /// Get all leagues where the user owns a fantasy team
  Future<List<League>> fetchLeaguesForUser(String userId) async {
    print('[fetchLeaguesForUser] userId = $userId');

    // 1️⃣ get league_ids where the user owns a fantasy team
    final teamRows = await client
        .from('fantasy_teams')
        .select('league_id') // only the FK column
        .eq('user_id', userId);

    print('[fetchLeaguesForUser] teamRows: $teamRows');

    final ids = (teamRows as List)
        .map((row) => row['league_id'] as String)
        .toSet() // remove duplicates
        .toList();

    if (ids.isEmpty) {
      print('[fetchLeaguesForUser] no league_ids found');
      return [];
    }

    // 2️⃣ fetch those leagues
    final leagueRows = await client
        .from('leagues')
        .select()
        .inFilter('id', ids);

    print('[fetchLeaguesForUser] leagueRows: $leagueRows');

    return (leagueRows as List)
        .map((json) => League.fromJson(json as Map<String, dynamic>))
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

  Future<void> startDraft(String leagueId) async {
    await client
        .from('leagues')
        .update({'status': 'draft_in_progress'})
        .eq('id', leagueId);
  }
}
