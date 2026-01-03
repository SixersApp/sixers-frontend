// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Matchup _$MatchupFromJson(Map<String, dynamic> json) => _Matchup(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  matchNum: (json['match_num'] as num).toInt(),
  fantasyTeamInstance1Id: json['fantasy_team_instance1_id'] as String,
  fantasyTeam1Id: json['fantasy_team1_id'] as String,
  fantasyTeamInstance1Score: (json['fantasy_team_instance1_score'] as num)
      .toInt(),
  fantasyTeamInstance2Id: json['fantasy_team_instance2_id'] as String,
  fantasyTeam2Id: json['fantasy_team2_id'] as String,
  fantasyTeamInstance2Score: (json['fantasy_team_instance2_score'] as num)
      .toInt(),
);

Map<String, dynamic> _$MatchupToJson(_Matchup instance) => <String, dynamic>{
  'id': instance.id,
  'league_id': instance.leagueId,
  'match_num': instance.matchNum,
  'fantasy_team_instance1_id': instance.fantasyTeamInstance1Id,
  'fantasy_team1_id': instance.fantasyTeam1Id,
  'fantasy_team_instance1_score': instance.fantasyTeamInstance1Score,
  'fantasy_team_instance2_id': instance.fantasyTeamInstance2Id,
  'fantasy_team2_id': instance.fantasyTeam2Id,
  'fantasy_team_instance2_score': instance.fantasyTeamInstance2Score,
};
