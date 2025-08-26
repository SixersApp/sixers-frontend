import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_settings_model.dart';

class DraftSettingsService {
  final _client = Supabase.instance.client;

  Future<DraftSettings?> fetch(String leagueId) async {
    final row = await _client
        .from('league_draft_settings')
        .select()
        .eq('league_id', leagueId)
        .maybeSingle();
    return row == null ? null : DraftSettings.fromJson(row);
  }

  Future<void> update(DraftSettings settings) async {
    await _client
        .from('league_draft_settings')
        .update(settings.toJson())
        .eq('league_id', settings.leagueId);
  }

  Future<void> saveForLeague(String leagueId, List<ScoringRule> rules) async {
    // delete existing
    await _client
        .from('league_draft_settings')
        .delete()
        .eq('league_id', leagueId);

    if (rules.isEmpty) return;
    // insert new
    final rows = rules.map((r) {
      final m = Map<String, dynamic>.from(r.toRpcJson());
      m['league_id'] = leagueId;
      return m;
    }).toList();
    await _client.from('league_draft_settings').insert(rows);
  }

  Future<Map<String, dynamic>> updateTimePerPick({
    required String leagueId,
    required int seconds,
  }) async {
    assert(seconds > 0, 'time_per_pick must be > 0');
    final row = await _client
        .from('league_draft_settings')
        .update({'time_per_pick': seconds})
        .eq('league_id', leagueId)
        .select()
        .single(); // get the updated row back
    return row as Map<String, dynamic>;
  }
}
