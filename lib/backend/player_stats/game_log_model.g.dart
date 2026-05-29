// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameLogPerformance _$GameLogPerformanceFromJson(Map<String, dynamic> json) =>
    _GameLogPerformance(
      matchId: json['matchId'] as String,
      matchDate: json['matchDate'] as String,
      matchStatus: json['matchStatus'] as String,
      homeTeamName: json['homeTeamName'] as String?,
      homeTeamImage: json['homeTeamImage'] as String?,
      homeTeamAbbreviation: json['homeTeamAbbreviation'] as String?,
      awayTeamName: json['awayTeamName'] as String?,
      awayTeamImage: json['awayTeamImage'] as String?,
      awayTeamAbbreviation: json['awayTeamAbbreviation'] as String?,
      runsScored: (json['runsScored'] as num?)?.toInt() ?? 0,
      ballsFaced: (json['ballsFaced'] as num?)?.toInt() ?? 0,
      fours: (json['fours'] as num?)?.toInt() ?? 0,
      sixes: (json['sixes'] as num?)?.toInt() ?? 0,
      ballsBowled: (json['ballsBowled'] as num?)?.toInt(),
      runsConceded: (json['runsConceded'] as num?)?.toInt(),
      wicketsTaken: (json['wicketsTaken'] as num?)?.toInt(),
      catches: (json['catches'] as num?)?.toInt() ?? 0,
      runOuts: (json['runOuts'] as num?)?.toInt() ?? 0,
      catchesDropped: (json['catchesDropped'] as num?)?.toInt() ?? 0,
      notOut: json['notOut'] as bool? ?? false,
    );

Map<String, dynamic> _$GameLogPerformanceToJson(_GameLogPerformance instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'matchDate': instance.matchDate,
      'matchStatus': instance.matchStatus,
      'homeTeamName': instance.homeTeamName,
      'homeTeamImage': instance.homeTeamImage,
      'homeTeamAbbreviation': instance.homeTeamAbbreviation,
      'awayTeamName': instance.awayTeamName,
      'awayTeamImage': instance.awayTeamImage,
      'awayTeamAbbreviation': instance.awayTeamAbbreviation,
      'runsScored': instance.runsScored,
      'ballsFaced': instance.ballsFaced,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'ballsBowled': instance.ballsBowled,
      'runsConceded': instance.runsConceded,
      'wicketsTaken': instance.wicketsTaken,
      'catches': instance.catches,
      'runOuts': instance.runOuts,
      'catchesDropped': instance.catchesDropped,
      'notOut': instance.notOut,
    };

_GameLogResponse _$GameLogResponseFromJson(Map<String, dynamic> json) =>
    _GameLogResponse(
      playerId: json['playerId'] as String,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      role: json['role'] as String? ?? '',
      seasonId: json['seasonId'] as String,
      endYear: (json['endYear'] as num?)?.toInt(),
      tournamentName: json['tournamentName'] as String?,
      tournamentAbbreviation: json['tournamentAbbreviation'] as String?,
      teamName: json['teamName'] as String? ?? '',
      teamImage: json['teamImage'] as String?,
      teamAbbreviation: json['teamAbbreviation'] as String?,
      performances:
          (json['performances'] as List<dynamic>?)
              ?.map(
                (e) => GameLogPerformance.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GameLogResponseToJson(_GameLogResponse instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'name': instance.name,
      'image': instance.image,
      'role': instance.role,
      'seasonId': instance.seasonId,
      'endYear': instance.endYear,
      'tournamentName': instance.tournamentName,
      'tournamentAbbreviation': instance.tournamentAbbreviation,
      'teamName': instance.teamName,
      'teamImage': instance.teamImage,
      'teamAbbreviation': instance.teamAbbreviation,
      'performances': instance.performances,
    };
