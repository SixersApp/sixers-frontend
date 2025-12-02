// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerPerformance _$PlayerPerformanceFromJson(Map<String, dynamic> json) =>
    _PlayerPerformance(
      playerSeasonId: json['playerSeasonId'] as String,
      playerId: json['playerId'] as String,
      performanceId: json['performanceId'] as String?,
      runsScored: (json['runsScored'] as num?)?.toInt() ?? 0,
      ballsFaced: (json['ballsFaced'] as num?)?.toInt() ?? 0,
      fours: (json['fours'] as num?)?.toInt() ?? 0,
      sixes: (json['sixes'] as num?)?.toInt() ?? 0,
      runsConceded: (json['runsConceded'] as num?)?.toInt() ?? 0,
      ballsBowled: (json['ballsBowled'] as num?)?.toInt() ?? 0,
      wicketsTaken: (json['wicketsTaken'] as num?)?.toInt() ?? 0,
      catches: (json['catches'] as num?)?.toInt() ?? 0,
      dismissals: (json['dismissals'] as num?)?.toInt() ?? 0,
      caughtBehinds: (json['caughtBehinds'] as num?)?.toInt() ?? 0,
      widesBowled: (json['widesBowled'] as num?)?.toInt() ?? 0,
      byesBowled: (json['byesBowled'] as num?)?.toInt() ?? 0,
      runOuts: (json['runOuts'] as num?)?.toInt() ?? 0,
      noBallsBowled: (json['noBallsBowled'] as num?)?.toInt() ?? 0,
      catchesDropped: (json['catchesDropped'] as num?)?.toInt() ?? 0,
      insertedAt: json['insertedAt'] as String?,
      homeTeamId: json['homeTeamId'] as String?,
      homeTeamName: json['homeTeamName'] as String?,
      homeTeamImage: json['homeTeamImage'] as String?,
      awayTeamId: json['awayTeamId'] as String?,
      awayTeamName: json['awayTeamName'] as String?,
      awayTeamImage: json['awayTeamImage'] as String?,
    );

Map<String, dynamic> _$PlayerPerformanceToJson(_PlayerPerformance instance) =>
    <String, dynamic>{
      'playerSeasonId': instance.playerSeasonId,
      'playerId': instance.playerId,
      'performanceId': instance.performanceId,
      'runsScored': instance.runsScored,
      'ballsFaced': instance.ballsFaced,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'runsConceded': instance.runsConceded,
      'ballsBowled': instance.ballsBowled,
      'wicketsTaken': instance.wicketsTaken,
      'catches': instance.catches,
      'dismissals': instance.dismissals,
      'caughtBehinds': instance.caughtBehinds,
      'widesBowled': instance.widesBowled,
      'byesBowled': instance.byesBowled,
      'runOuts': instance.runOuts,
      'noBallsBowled': instance.noBallsBowled,
      'catchesDropped': instance.catchesDropped,
      'insertedAt': instance.insertedAt,
      'homeTeamId': instance.homeTeamId,
      'homeTeamName': instance.homeTeamName,
      'homeTeamImage': instance.homeTeamImage,
      'awayTeamId': instance.awayTeamId,
      'awayTeamName': instance.awayTeamName,
      'awayTeamImage': instance.awayTeamImage,
    };
