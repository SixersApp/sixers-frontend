// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoringRule _$ScoringRuleFromJson(Map<String, dynamic> json) => ScoringRule(
  id: json['id'] as String?,
  leagueId: json['league_id'] as String?,
  stat: json['stat'] as String,
  category: json['category'] as String,
  mode: $enumDecode(_$RuleModeEnumMap, json['mode']),
  perUnitPoints: json['per_unit_points'] as num?,
  flatPoints: json['flat_points'] as num?,
  threshold: (json['threshold'] as num?)?.toInt(),
  band: const PgNumRangeConverter().fromJson(json['band'] as String?),
  multiplier: json['multiplier'] as num?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ScoringRuleToJson(ScoringRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'league_id': instance.leagueId,
      'stat': instance.stat,
      'category': instance.category,
      'mode': _$RuleModeEnumMap[instance.mode]!,
      'per_unit_points': instance.perUnitPoints,
      'flat_points': instance.flatPoints,
      'threshold': instance.threshold,
      'band': const PgNumRangeConverter().toJson(instance.band),
      'multiplier': instance.multiplier,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$RuleModeEnumMap = {
  RuleMode.perUnit: 'per_unit',
  RuleMode.flat: 'flat',
  RuleMode.threshold: 'threshold',
  RuleMode.band: 'band',
  RuleMode.multiplier: 'multiplier',
};
