import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_service.dart';

part 'scoring_rule_provider.g.dart';

@riverpod
class ScoringRules extends _$ScoringRules {
  @override
  FutureOr<List<ScoringRule>> build(String fantasyTeamInstanceId) async {
    final service = ScoringRuleService();
    return service.getScoringRules(fantasyTeamInstanceId);
  }

  /// Manual refresh
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ScoringRuleService().getScoringRules(fantasyTeamInstanceId),
    );
  }
}