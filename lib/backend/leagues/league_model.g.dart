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
  status: const LeagueStatusConverter().fromJson(json['status'] as String),
  maxTeams: (json['max_teams'] as num).toInt(),
  joinCode: json['join_code'] as String,
  seasonId: json['season_id'] as String,
);

Map<String, dynamic> _$LeagueToJson(_League instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tournament_id': instance.tournamentId,
  'creator_id': instance.creatorId,
  'status': const LeagueStatusConverter().toJson(instance.status),
  'max_teams': instance.maxTeams,
  'join_code': instance.joinCode,
  'season_id': instance.seasonId,
};
