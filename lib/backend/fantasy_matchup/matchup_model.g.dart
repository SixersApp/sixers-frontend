// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Matchup _$MatchupFromJson(Map<String, dynamic> json) => _Matchup(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  matchNum: (json['match_num'] as num).toInt(),
  teamInstance1Id: json['fantasy_team_instance1_id'] as String,
  teamInstance2Id: json['fantasy_team_instance2_id'] as String,
  team1Score: _doubleFromJson(json['fantasy_team_instance1_score']),
  team2Score: _doubleFromJson(json['fantasy_team_instance2_score']),
  winnerTeamInstanceId: json['fantasy_winner_team_instance_id'] as String?,
  team1: json['team1'] == null
      ? null
      : FantasyTeamInstance.fromJson(json['team1'] as Map<String, dynamic>),
  team2: json['team2'] == null
      ? null
      : FantasyTeamInstance.fromJson(json['team2'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchupToJson(_Matchup instance) => <String, dynamic>{
  'id': instance.id,
  'league_id': instance.leagueId,
  'match_num': instance.matchNum,
  'fantasy_team_instance1_id': instance.teamInstance1Id,
  'fantasy_team_instance2_id': instance.teamInstance2Id,
  'fantasy_team_instance1_score': _doubleToJson(instance.team1Score),
  'fantasy_team_instance2_score': _doubleToJson(instance.team2Score),
  'fantasy_winner_team_instance_id': instance.winnerTeamInstanceId,
  'team1': instance.team1,
  'team2': instance.team2,
};
