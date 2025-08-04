import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_position_rule.freezed.dart';
part 'league_position_rule.g.dart';

@freezed
class LeaguePositionRule with _$LeaguePositionRule {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LeaguePositionRule({
    required String id,
    required String leagueId,
    required String role,
    required int minCount,
    required int maxCount,
  }) = _LeaguePositionRule;

  factory LeaguePositionRule.fromJson(Map<String, dynamic> json) =>
      _$LeaguePositionRuleFromJson(json);
}
