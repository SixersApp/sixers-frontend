// lib/backend/scoring_rule/scoring_rule_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'scoring_rule_model.dart';

class ScoringRuleService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<ScoringRule>> fetchDefaults() async {
    final data = await _client
        .from('scoring_rules')
        .select('*')
        .or('league_id.is.null')
        .order('category', ascending: true)
        .order('stat', ascending: true)
        .order('mode', ascending: true);
    return (data as List)
        .map((e) => ScoringRule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

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

  Future<void> saveForLeague(String leagueId, List<ScoringRule> rules) async {
    await _client.from('scoring_rules').delete().eq('league_id', leagueId);
    if (rules.isEmpty) return;

    final rows = rules.map((r) {
      final m = Map<String, dynamic>.from(r.toRpcJson());
      m['league_id'] = leagueId;
      return m;
    }).toList();

    await _client.from('scoring_rules').insert(rows);
  }

  Future<void> replaceAllForLeague(String leagueId, List<ScoringRule> rules) async {
    final payload = rules.map((r) => r.toRpcJson()).toList();
    // toRpcJson should produce keys: category, stat, mode, per_unit_points, flat_points,
    // threshold, band (string OR {lower,upper,bounds}), multiplier

    await _client.rpc(
      'replace_league_scoring_rules',
      params: {
        'p_league': leagueId,
        'p_rules': payload, // Supabase sends this as JSONB[]
      },
    );
  }
}

