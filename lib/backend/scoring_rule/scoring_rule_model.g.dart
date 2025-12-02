// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoringRule _$ScoringRuleFromJson(Map<String, dynamic> json) => _ScoringRule(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  stat: json['stat'] as String,
  category: json['category'] as String,
  mode: json['mode'] as String,
  perUnitPoints: json['per_unit_points'] == null
      ? 0
      : _numToDouble(json['per_unit_points']),
  flatPoints: json['flat_points'] == null
      ? 0
      : _numToDouble(json['flat_points']),
  threshold: json['threshold'] == null ? 0 : _numToDouble(json['threshold']),
  band: json['band'] as String? ?? "",
  multiplier: json['multiplier'] == null ? 0 : _numToDouble(json['multiplier']),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ScoringRuleToJson(_ScoringRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'league_id': instance.leagueId,
      'stat': instance.stat,
      'category': instance.category,
      'mode': instance.mode,
      'per_unit_points': instance.perUnitPoints,
      'flat_points': instance.flatPoints,
      'threshold': instance.threshold,
      'band': instance.band,
      'multiplier': instance.multiplier,
      'created_at': instance.createdAt.toIso8601String(),
    };
