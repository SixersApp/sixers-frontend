// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Matchup _$MatchupFromJson(Map<String, dynamic> json) => _Matchup(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  matchNum: (json['match_num'] as num).toInt(),
  scheduledTime: json['scheduled_time'] == null
      ? null
      : DateTime.parse(json['scheduled_time'] as String),
  team1Score: (json['team1_score'] as num?)?.toDouble(),
  team2Score: (json['team2_score'] as num?)?.toDouble(),
  winnerTeamId: json['winner_team_id'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
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
  'scheduled_time': instance.scheduledTime?.toIso8601String(),
  'team1_score': instance.team1Score,
  'team2_score': instance.team2Score,
  'winner_team_id': instance.winnerTeamId,
  'created_at': instance.createdAt?.toIso8601String(),
  'team1': instance.team1,
  'team2': instance.team2,
};

_FantasyTeamInstance _$FantasyTeamInstanceFromJson(Map<String, dynamic> json) =>
    _FantasyTeamInstance(
      id: json['id'] as String,
      fantasyTeamId: json['fantasy_team_id'] as String,
      isLocked: json['is_locked'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      fantasyTeam: json['fantasy_team'] == null
          ? null
          : FantasyTeam.fromJson(json['fantasy_team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FantasyTeamInstanceToJson(
  _FantasyTeamInstance instance,
) => <String, dynamic>{
  'id': instance.id,
  'fantasy_team_id': instance.fantasyTeamId,
  'is_locked': instance.isLocked,
  'created_at': instance.createdAt?.toIso8601String(),
  'fantasy_team': instance.fantasyTeam,
};
