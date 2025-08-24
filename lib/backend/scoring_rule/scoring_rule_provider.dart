// lib/backend/scoring_rule/scoring_rule_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scoring_rule_model.dart';
import 'scoring_rule_service.dart';

part 'scoring_rule_provider.g.dart';

@riverpod
class ScoringRules extends _$ScoringRules {
  final _service = ScoringRuleService();
  String? _leagueId; // remember current scope for refresh()

  @override
  Future<List<ScoringRule>> build({String? leagueId}) async {
    _leagueId = leagueId;
    if (leagueId == null) {
      // league_id IS NULL -> default rules
      return _service.fetchDefaults();
    }
    return _service.fetchByLeagueId(leagueId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final id = _leagueId;
      return id == null
          ? _service.fetchDefaults()
          : _service.fetchByLeagueId(id);
    });
  }

  // /// Optional helper when you want to replace all rules for a league then refresh.
  // Future<void> replaceAll(String leagueId, List<ScoringRule> rules) async {
  //   await _service.replaceAllForLeague(leagueId, rules);
  //   await refresh();
  // }
}
