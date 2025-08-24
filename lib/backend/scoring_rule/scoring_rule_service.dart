// lib/backend/scoring/scoring_rule_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'scoring_rule_model.dart';

class ScoringRuleService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Defaults = rows with league_id IS NULL
  Future<List<ScoringRule>> fetchDefaults() async {
    final data = await _client
        .from('scoring_rules')
        .select('*')
        .filter('league_id','is',null)
        .order('category', ascending: true)
        .order('stat', ascending: true)
        .order('mode', ascending: true);
    return (data as List)
        .map((e) => ScoringRule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Full rule set for a league (you’re materializing copies, so this is complete)
  Future<List<ScoringRule>> fetchByLeagueId(String leagueId) async {
    final data = await _client
        .from('scoring_rules')
        .select('*')
        .eq('league_id', leagueId)
        .order('category', ascending: true)
        .order('stat', ascending: true)
        .order('mode', ascending: true);
    return (data as List)
        .map((e) => ScoringRule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Bulk insert a complete rule set for a league (assumes no existing rows).
  Future<void> insertAllForLeague(String leagueId, List<ScoringRule> rules) async {
    final payload = rules
        .map((r) => r.copyWith(id: null, leagueId: leagueId).toJson())
        .toList();
    await _client.from('scoring_rules').insert(payload);
  }

  /// Optional: wipe and replace all rules for a league (useful for editing flows).
  Future<void> replaceAllForLeague(String leagueId, List<ScoringRule> rules) async {
    // Delete existing, then insert new (wrap in RPC if you want strict atomicity).
    await _client.from('scoring_rules').delete().eq('league_id', leagueId);
    await insertAllForLeague(leagueId, rules);
  }
}
