// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_position_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaguePositionRule _$LeaguePositionRuleFromJson(Map<String, dynamic> json) =>
    _LeaguePositionRule(
      id: json['id'] as String,
      leagueId: json['league_id'] as String,
      minCount: (json['min_count'] as num).toInt(),
      maxCount: (json['max_count'] as num).toInt(),
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      roleDetails: (json['role_details'] as List<dynamic>)
          .map((e) => PositionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaguePositionRuleToJson(_LeaguePositionRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'league_id': instance.leagueId,
      'min_count': instance.minCount,
      'max_count': instance.maxCount,
      'roles': instance.roles,
      'role_details': instance.roleDetails,
    };

_PositionDetail _$PositionDetailFromJson(Map<String, dynamic> json) =>
    _PositionDetail(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$PositionDetailToJson(_PositionDetail instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
