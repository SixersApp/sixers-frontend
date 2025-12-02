// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FantasyPlayer _$FantasyPlayerFromJson(Map<String, dynamic> json) =>
    _FantasyPlayer(
      playerSeasonId: json['player_season_id'] as String? ?? '',
      playerId: json['player_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      performanceId: json['performance_id'] as String? ?? '',
      runsScored: (json['runs_scored'] as num?)?.toInt() ?? 0,
      ballsFaced: (json['balls_faced'] as num?)?.toInt() ?? 0,
      fours: (json['fours'] as num?)?.toInt() ?? 0,
      sixes: (json['sixes'] as num?)?.toInt() ?? 0,
      runsConceded: (json['runs_conceded'] as num?)?.toInt() ?? 0,
      ballsBowled: (json['balls_bowled'] as num?)?.toInt() ?? 0,
      wicketsTaken: (json['wickets_taken'] as num?)?.toInt() ?? 0,
      catches: (json['catches'] as num?)?.toInt() ?? 0,
      dismissals: (json['dismissals'] as num?)?.toInt() ?? 0,
      caughtBehinds: (json['caught_behinds'] as num?)?.toInt() ?? 0,
      widesBowled: (json['wides_bowled'] as num?)?.toInt() ?? 0,
      byesBowled: (json['byes_bowled'] as num?)?.toInt() ?? 0,
      runOuts: (json['run_outs'] as num?)?.toInt() ?? 0,
      noBallsBowled: (json['no_balls_bowled'] as num?)?.toInt() ?? 0,
      catchesDropped: (json['catches_dropped'] as num?)?.toInt() ?? 0,
      insertedAt: json['inserted_at'] == null
          ? null
          : DateTime.parse(json['inserted_at'] as String),
      homeTeamId: json['home_team_id'] as String? ?? '',
      homeTeamName: json['home_team_name'] as String? ?? '',
      homeTeamImage: json['home_team_image'] as String? ?? '',
      awayTeamId: json['away_team_id'] as String? ?? '',
      awayTeamName: json['away_team_name'] as String? ?? '',
      awayTeamImage: json['away_team_image'] as String? ?? '',
      fantasyPoints: (json['fantasy_points'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FantasyPlayerToJson(_FantasyPlayer instance) =>
    <String, dynamic>{
      'player_season_id': instance.playerSeasonId,
      'player_id': instance.playerId,
      'full_name': instance.fullName,
      'performance_id': instance.performanceId,
      'runs_scored': instance.runsScored,
      'balls_faced': instance.ballsFaced,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'runs_conceded': instance.runsConceded,
      'balls_bowled': instance.ballsBowled,
      'wickets_taken': instance.wicketsTaken,
      'catches': instance.catches,
      'dismissals': instance.dismissals,
      'caught_behinds': instance.caughtBehinds,
      'wides_bowled': instance.widesBowled,
      'byes_bowled': instance.byesBowled,
      'run_outs': instance.runOuts,
      'no_balls_bowled': instance.noBallsBowled,
      'catches_dropped': instance.catchesDropped,
      'inserted_at': instance.insertedAt?.toIso8601String(),
      'home_team_id': instance.homeTeamId,
      'home_team_name': instance.homeTeamName,
      'home_team_image': instance.homeTeamImage,
      'away_team_id': instance.awayTeamId,
      'away_team_name': instance.awayTeamName,
      'away_team_image': instance.awayTeamImage,
      'fantasy_points': instance.fantasyPoints,
    };
