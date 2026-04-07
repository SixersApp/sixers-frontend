// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerPerformance _$PlayerPerformanceFromJson(Map<String, dynamic> json) =>
    _PlayerPerformance(
      playerPerformanceId: json['player_performance_id'] as String,
      playerId: json['player_id'] as String,
      teamId: json['team_id'] as String,
      runsScored: (json['runs_scored'] as num?)?.toInt(),
      ballsFaced: (json['balls_faced'] as num?)?.toInt(),
      fours: (json['fours'] as num?)?.toInt(),
      sixes: (json['sixes'] as num?)?.toInt(),
      ballsBowled: (json['balls_bowled'] as num?)?.toInt(),
      runsConceded: (json['runs_conceded'] as num?)?.toInt(),
      wicketsTaken: (json['wickets_taken'] as num?)?.toInt(),
      catches: (json['catches'] as num?)?.toInt(),
      runOuts: (json['run_outs'] as num?)?.toInt(),
      catchesDropped: (json['catches_dropped'] as num?)?.toInt(),
      notOut: json['not_out'] as bool?,
    );

Map<String, dynamic> _$PlayerPerformanceToJson(_PlayerPerformance instance) =>
    <String, dynamic>{
      'player_performance_id': instance.playerPerformanceId,
      'player_id': instance.playerId,
      'team_id': instance.teamId,
      'runs_scored': instance.runsScored,
      'balls_faced': instance.ballsFaced,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'balls_bowled': instance.ballsBowled,
      'runs_conceded': instance.runsConceded,
      'wickets_taken': instance.wicketsTaken,
      'catches': instance.catches,
      'run_outs': instance.runOuts,
      'catches_dropped': instance.catchesDropped,
      'not_out': instance.notOut,
    };

_ActiveMatch _$ActiveMatchFromJson(Map<String, dynamic> json) => _ActiveMatch(
  id: json['id'] as String,
  matchDate: json['match_date'] as String,
  tournamentId: json['tournament_id'] as String,
  seasonId: json['season_id'] as String,
  venueId: json['venue_id'] as String?,
  homeTeamId: json['home_team_id'] as String,
  awayTeamId: json['away_team_id'] as String,
  homeTeamName: json['home_team_name'] as String?,
  homeTeamImage: json['home_team_image'] as String?,
  awayTeamName: json['away_team_name'] as String?,
  awayTeamImage: json['away_team_image'] as String?,
  homeTeamAbbreviation: json['home_team_abbreviation'] as String?,
  awayTeamAbbreviation: json['away_team_abbreviation'] as String?,
  tournamentName: json['tournament_name'] as String?,
  abbreviation: json['abbreviation'] as String?,
  homeTeamScore: (json['home_team_score'] as num?)?.toInt(),
  awayTeamScore: (json['away_team_score'] as num?)?.toInt(),
  homeTeamWickets: (json['home_team_wickets'] as num?)?.toInt(),
  awayTeamWickets: (json['away_team_wickets'] as num?)?.toInt(),
  homeTeamBalls: (json['home_team_balls'] as num?)?.toInt(),
  awayTeamBalls: (json['away_team_balls'] as num?)?.toInt(),
  homeMatchNum: (json['home_match_num'] as num).toInt(),
  awayMatchNum: (json['away_match_num'] as num).toInt(),
  dls: (json['dls'] as num?)?.toInt(),
  status: json['status'] as String,
  result: json['result'] as String?,
  eventNum: (json['event_num'] as num?)?.toInt(),
  playerPerformances:
      (json['player_performances'] as List<dynamic>?)
          ?.map((e) => PlayerPerformance.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ActiveMatchToJson(_ActiveMatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_date': instance.matchDate,
      'tournament_id': instance.tournamentId,
      'season_id': instance.seasonId,
      'venue_id': instance.venueId,
      'home_team_id': instance.homeTeamId,
      'away_team_id': instance.awayTeamId,
      'home_team_name': instance.homeTeamName,
      'home_team_image': instance.homeTeamImage,
      'away_team_name': instance.awayTeamName,
      'away_team_image': instance.awayTeamImage,
      'home_team_abbreviation': instance.homeTeamAbbreviation,
      'away_team_abbreviation': instance.awayTeamAbbreviation,
      'tournament_name': instance.tournamentName,
      'abbreviation': instance.abbreviation,
      'home_team_score': instance.homeTeamScore,
      'away_team_score': instance.awayTeamScore,
      'home_team_wickets': instance.homeTeamWickets,
      'away_team_wickets': instance.awayTeamWickets,
      'home_team_balls': instance.homeTeamBalls,
      'away_team_balls': instance.awayTeamBalls,
      'home_match_num': instance.homeMatchNum,
      'away_match_num': instance.awayMatchNum,
      'dls': instance.dls,
      'status': instance.status,
      'result': instance.result,
      'event_num': instance.eventNum,
      'player_performances': instance.playerPerformances,
    };
