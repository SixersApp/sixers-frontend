// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FantasyTeam _$FantasyTeamFromJson(Map<String, dynamic> json) => _FantasyTeam(
  id: json['id'] as String,
  leagueId: json['leagueId'] as String,
  userId: json['userId'] as String,
  teamName: json['teamName'] as String,
  draftOrder: (json['draftOrder'] as num).toInt(),
  teamColor: json['teamColor'] as String,
  teamIcon: json['teamIcon'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$FantasyTeamToJson(_FantasyTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leagueId': instance.leagueId,
      'userId': instance.userId,
      'teamName': instance.teamName,
      'draftOrder': instance.draftOrder,
      'teamColor': instance.teamColor,
      'teamIcon': instance.teamIcon,
      'createdAt': instance.createdAt.toIso8601String(),
    };
