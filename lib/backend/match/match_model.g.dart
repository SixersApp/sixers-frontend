// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
  id: json['id'] as String?,
  matchDate: json['match_date'] as String?,
  tournamentId: json['tournament_id'] as String?,
  tournamentName: json['tournament_name'] as String?,
  seasonId: json['season_id'] as String?,
  venueId: json['venue_id'] as String?,
  homeTeamId: json['home_team_id'] as String?,
  awayTeamId: json['away_team_id'] as String?,
  homeTeamName: json['home_team_name'] as String?,
  homeTeamImage: json['home_team_image'] as String?,
  awayTeamName: json['away_team_name'] as String?,
  awayTeamImage: json['away_team_image'] as String?,
  homeTeamScore: (json['home_team_score'] as num?)?.toInt(),
  awayTeamScore: (json['away_team_score'] as num?)?.toInt(),
  homeTeamWickets: (json['home_team_wickets'] as num?)?.toInt(),
  awayTeamWickets: (json['away_team_wickets'] as num?)?.toInt(),
  homeTeamBalls: (json['home_team_balls'] as num?)?.toInt(),
  awayTeamBalls: (json['away_team_balls'] as num?)?.toInt(),
  status: json['status'] as String?,
);

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_date': instance.matchDate,
      'tournament_id': instance.tournamentId,
      'tournament_name': instance.tournamentName,
      'season_id': instance.seasonId,
      'venue_id': instance.venueId,
      'home_team_id': instance.homeTeamId,
      'away_team_id': instance.awayTeamId,
      'home_team_name': instance.homeTeamName,
      'home_team_image': instance.homeTeamImage,
      'away_team_name': instance.awayTeamName,
      'away_team_image': instance.awayTeamImage,
      'home_team_score': instance.homeTeamScore,
      'away_team_score': instance.awayTeamScore,
      'home_team_wickets': instance.homeTeamWickets,
      'away_team_wickets': instance.awayTeamWickets,
      'home_team_balls': instance.homeTeamBalls,
      'away_team_balls': instance.awayTeamBalls,
      'status': instance.status,
    };
