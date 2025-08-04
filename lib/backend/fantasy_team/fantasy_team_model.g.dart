// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FantasyTeam _$FantasyTeamFromJson(Map<String, dynamic> json) => _FantasyTeam(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  userId: json['user_id'] as String,
  teamName: json['team_name'] as String,
  draftOrder: (json['draft_order'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$FantasyTeamToJson(_FantasyTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'league_id': instance.leagueId,
      'user_id': instance.userId,
      'team_name': instance.teamName,
      'draft_order': instance.draftOrder,
      'created_at': instance.createdAt?.toIso8601String(),
    };
