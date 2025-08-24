// lib/providers/scoring_rule_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'scoring_rule_provider.g.dart';

@Riverpod(keepAlive: true)
ScoringRuleService scoringRuleService(ref) {
  return ScoringRuleService();
}

/// Defaults (league_id IS NULL)
@riverpod
Future<List<ScoringRule>> defaultScoringRules(ref) async {
  final ScoringRuleService svc = ref.read(scoringRuleServiceProvider);
  return svc.fetchDefaults();
}

/// Full league rules (materialized copy)
@riverpod
Future<List<ScoringRule>> scoringRulesByLeague(
  ref,
  String leagueId,
) async {
  final ScoringRuleService svc = ref.read(scoringRuleServiceProvider);
  return svc.fetchByLeagueId(leagueId);
}
