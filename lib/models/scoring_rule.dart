import 'package:freezed_annotation/freezed_annotation.dart';

part 'scoring_rule.freezed.dart';
part 'scoring_rule.g.dart';

@freezed
class ScoringRule with _$ScoringRule {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ScoringRule({
    required String id,
    required String leagueId,
    required String event,
    required double points,
    required DateTime createdAt,
  }) = _ScoringRule;

  factory ScoringRule.fromJson(Map<String, dynamic> json) =>
      _$ScoringRuleFromJson(json);
}
