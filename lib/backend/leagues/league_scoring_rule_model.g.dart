// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_scoring_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeagueScoringRule _$LeagueScoringRuleFromJson(Map<String, dynamic> json) =>
    _LeagueScoringRule(
      id: json['id'] as String?,
      leagueId: json['league_id'] as String?,
      stat: json['stat'] as String,
      category: json['category'] as String,
      mode: const RuleModeConverter().fromJson(json['mode'] as String),
      perUnitPoints: const StringToDoubleConverter().fromJson(
        json['per_unit_points'],
      ),
      flatPoints: const StringToDoubleConverter().fromJson(json['flat_points']),
      threshold: const StringToIntConverter().fromJson(json['threshold']),
      band: json['band'] as String?,
      multiplier: const StringToDoubleConverter().fromJson(json['multiplier']),
    );

Map<String, dynamic> _$LeagueScoringRuleToJson(
  _LeagueScoringRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'league_id': instance.leagueId,
  'stat': instance.stat,
  'category': instance.category,
  'mode': const RuleModeConverter().toJson(instance.mode),
  'per_unit_points': const StringToDoubleConverter().toJson(
    instance.perUnitPoints,
  ),
  'flat_points': const StringToDoubleConverter().toJson(instance.flatPoints),
  'threshold': const StringToIntConverter().toJson(instance.threshold),
  'band': instance.band,
  'multiplier': const StringToDoubleConverter().toJson(instance.multiplier),
};

_Tournament _$TournamentFromJson(Map<String, dynamic> json) => _Tournament(
  id: json['id'] as String,
  name: json['name'] as String,
  abbreviation: json['abbreviation'] as String?,
  seasons: (json['seasons'] as List<dynamic>?)
      ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TournamentToJson(_Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'seasons': instance.seasons,
    };

_Season _$SeasonFromJson(Map<String, dynamic> json) => _Season(
  id: json['id'] as String,
  startYear: (json['start_year'] as num).toInt(),
  endYear: (json['end_year'] as num).toInt(),
);

Map<String, dynamic> _$SeasonToJson(_Season instance) => <String, dynamic>{
  'id': instance.id,
  'start_year': instance.startYear,
  'end_year': instance.endYear,
};
