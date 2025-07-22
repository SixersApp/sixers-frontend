// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
  id: json['id'] as String,
  name: json['name'] as String,
  tournaments: Tournament.fromJson(json['tournaments'] as Map<String, dynamic>),
  real_teams: RealTeam.fromJson(json['real_teams'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tournaments': instance.tournaments,
  'real_teams': instance.real_teams,
};

_Tournament _$TournamentFromJson(Map<String, dynamic> json) =>
    _Tournament(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$TournamentToJson(_Tournament instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_RealTeam _$RealTeamFromJson(Map<String, dynamic> json) =>
    _RealTeam(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$RealTeamToJson(_RealTeam instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
