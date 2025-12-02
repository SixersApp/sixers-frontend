import 'package:freezed_annotation/freezed_annotation.dart';

part 'scoring_rule_model.freezed.dart';
part 'scoring_rule_model.g.dart';

double _numToDouble(dynamic v) {
  if (v == null) return 0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0;
}

@freezed
sealed class ScoringRule with _$ScoringRule {
  const factory ScoringRule({
    required String id,

    @JsonKey(name: "league_id")
    required String leagueId,

    required String stat,
    required String category,
    required String mode,

    @JsonKey(name: "per_unit_points", fromJson: _numToDouble)
    @Default(0)
    double perUnitPoints,

    @JsonKey(name: "flat_points", fromJson: _numToDouble)
    @Default(0)
    double flatPoints,

    @JsonKey(name: "threshold", fromJson: _numToDouble)
    @Default(0)
    double threshold,

    @Default("")
    String band,

    @JsonKey(name: "multiplier", fromJson: _numToDouble)
    @Default(0)
    double multiplier,

    @JsonKey(name: "created_at")
    required DateTime createdAt,
  }) = _ScoringRule;

  factory ScoringRule.fromJson(Map<String, dynamic> json) =>
      _$ScoringRuleFromJson(json);
}