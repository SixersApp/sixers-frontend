// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Matchup _$MatchupFromJson(Map<String, dynamic> json) => _Matchup(
  id: json['id'] as String,
  leagueId: json['leagueId'] as String,
  matchNum: (json['matchNum'] as num).toInt(),
  fantasyTeamInstance1Id: json['fantasyTeamInstance1Id'] as String,
  fantasyTeamInstance2Id: json['fantasyTeamInstance2Id'] as String,
  fantasyTeamInstance1Score: (json['fantasyTeamInstance1Score'] as num?)
      ?.toDouble(),
  fantasyTeamInstance2Score: (json['fantasyTeamInstance2Score'] as num?)
      ?.toDouble(),
  fantasyWinnerTeamInstanceId: json['fantasyWinnerTeamInstanceId'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$MatchupToJson(_Matchup instance) => <String, dynamic>{
  'id': instance.id,
  'leagueId': instance.leagueId,
  'matchNum': instance.matchNum,
  'fantasyTeamInstance1Id': instance.fantasyTeamInstance1Id,
  'fantasyTeamInstance2Id': instance.fantasyTeamInstance2Id,
  'fantasyTeamInstance1Score': instance.fantasyTeamInstance1Score,
  'fantasyTeamInstance2Score': instance.fantasyTeamInstance2Score,
  'fantasyWinnerTeamInstanceId': instance.fantasyWinnerTeamInstanceId,
  'createdAt': instance.createdAt,
};
