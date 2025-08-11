// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
  id: json['id'] as String,
  name: json['name'] as String,
  role: json['role'] as String,
  tournamentId: json['tournament_id'] as String,
  realTeamId: json['real_team_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
  'tournament_id': instance.tournamentId,
  'real_team_id': instance.realTeamId,
  'created_at': instance.createdAt.toIso8601String(),
  'user_id': instance.userId,
};
