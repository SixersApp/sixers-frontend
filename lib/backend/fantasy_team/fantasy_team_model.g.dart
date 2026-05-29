// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchScore _$MatchScoreFromJson(Map<String, dynamic> json) => _MatchScore(
  matchNum: (json['match_num'] as num).toInt(),
  points: const _NumericToDouble().fromJson(json['points'] as Object),
);

Map<String, dynamic> _$MatchScoreToJson(_MatchScore instance) =>
    <String, dynamic>{
      'match_num': instance.matchNum,
      'points': const _NumericToDouble().toJson(instance.points),
    };

_FantasyTeam _$FantasyTeamFromJson(Map<String, dynamic> json) => _FantasyTeam(
  id: json['id'] as String,
  leagueId: json['league_id'] as String,
  userId: json['user_id'] as String,
  teamName: json['team_name'] as String,
  userName: json['user_name'] as String?,
  draftOrder: (json['draft_order'] as num?)?.toInt(),
  teamColor: json['team_color'] as String?,
  teamIcon: json['team_icon'] as String?,
  teamAbbreviation: json['abbreviation'] as String?,
  createdAt: json['created_at'] as String?,
  wins: (json['wins'] as num?)?.toInt(),
  losses: (json['losses'] as num?)?.toInt(),
  matchesCompleted: (json['matches_completed'] as num?)?.toInt(),
  avgPointsPerGame: const _NumericToNullableDouble().fromJson(
    json['avg_points_per_game'],
  ),
  matchScores: (json['match_scores'] as List<dynamic>?)
      ?.map((e) => MatchScore.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FantasyTeamToJson(_FantasyTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'league_id': instance.leagueId,
      'user_id': instance.userId,
      'team_name': instance.teamName,
      'user_name': instance.userName,
      'draft_order': instance.draftOrder,
      'team_color': instance.teamColor,
      'team_icon': instance.teamIcon,
      'abbreviation': instance.teamAbbreviation,
      'created_at': instance.createdAt,
      'wins': instance.wins,
      'losses': instance.losses,
      'matches_completed': instance.matchesCompleted,
      'avg_points_per_game': const _NumericToNullableDouble().toJson(
        instance.avgPointsPerGame,
      ),
      'match_scores': instance.matchScores,
    };
