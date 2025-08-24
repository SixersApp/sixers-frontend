// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_League _$LeagueFromJson(Map<String, dynamic> json) => _League(
  id: json['id'] as String,
  name: json['name'] as String,
  tournamentId: json['tournament_id'] as String,
  creatorId: json['creator_id'] as String,
  status: $enumDecode(_$LeagueStatusEnumMap, json['status']),
  maxTeams: (json['max_teams'] as num).toInt(),
  joinCode: json['join_code'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$LeagueToJson(_League instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tournament_id': instance.tournamentId,
  'creator_id': instance.creatorId,
  'status': _$LeagueStatusEnumMap[instance.status]!,
  'max_teams': instance.maxTeams,
  'join_code': instance.joinCode,
  'created_at': instance.createdAt?.toIso8601String(),
};

const _$LeagueStatusEnumMap = {
  LeagueStatus.draft_pending: 'draft_pending',
  LeagueStatus.draft_in_progress: 'draft_in_progress',
  LeagueStatus.active: 'active',
  LeagueStatus.completed: 'completed',
};
