// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchupPlayerPerformance _$MatchupPlayerPerformanceFromJson(
  Map<String, dynamic> json,
) => _MatchupPlayerPerformance(
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

Map<String, dynamic> _$MatchupPlayerPerformanceToJson(
  _MatchupPlayerPerformance instance,
) => <String, dynamic>{
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

_MatchupPlayer _$MatchupPlayerFromJson(Map<String, dynamic> json) =>
    _MatchupPlayer(
      playerId: json['playerId'] as String,
      performanceId: json['performanceId'] as String?,
      matchId: json['matchId'] as String?,
      name: json['name'] as String,
      fullName: json['full_name'] as String?,
      image: json['image'] as String,
      role: json['role'] as String,
      slot: json['slot'] as String? ?? '',
      teamName: json['teamName'] as String,
      teamImage: json['teamImage'] as String,
      teamAbbreviation: json['teamAbbreviation'] as String?,
      projectedPpg: (json['projectedPoints'] as num?)?.toDouble() ?? 0,
      fantasyPoints: (json['fantasyPoints'] as num?)?.toDouble(),
      performance: json['performance'] == null
          ? null
          : MatchupPlayerPerformance.fromJson(
              json['performance'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MatchupPlayerToJson(_MatchupPlayer instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'performanceId': instance.performanceId,
      'matchId': instance.matchId,
      'name': instance.name,
      'full_name': instance.fullName,
      'image': instance.image,
      'role': instance.role,
      'slot': instance.slot,
      'teamName': instance.teamName,
      'teamImage': instance.teamImage,
      'teamAbbreviation': instance.teamAbbreviation,
      'projectedPoints': instance.projectedPpg,
      'fantasyPoints': instance.fantasyPoints,
      'performance': instance.performance,
    };

_MatchupTeam _$MatchupTeamFromJson(Map<String, dynamic> json) => _MatchupTeam(
  fantasyTeamId: json['fantasyTeamId'] as String,
  fantasyTeamInstanceId: json['fantasyTeamInstanceId'] as String,
  captain: json['captain'] as String?,
  viceCaptain: json['viceCaptain'] as String?,
  players:
      (json['players'] as List<dynamic>?)
          ?.map((e) => MatchupPlayer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MatchupTeamToJson(_MatchupTeam instance) =>
    <String, dynamic>{
      'fantasyTeamId': instance.fantasyTeamId,
      'fantasyTeamInstanceId': instance.fantasyTeamInstanceId,
      'captain': instance.captain,
      'viceCaptain': instance.viceCaptain,
      'players': instance.players,
    };

_Matchup _$MatchupFromJson(Map<String, dynamic> json) => _Matchup(
  id: json['id'] as String,
  matchNum: (json['matchNum'] as num).toInt(),
  team1: MatchupTeam.fromJson(json['team1'] as Map<String, dynamic>),
  team2: MatchupTeam.fromJson(json['team2'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchupToJson(_Matchup instance) => <String, dynamic>{
  'id': instance.id,
  'matchNum': instance.matchNum,
  'team1': instance.team1,
  'team2': instance.team2,
};

_LeagueMatchupGroup _$LeagueMatchupGroupFromJson(Map<String, dynamic> json) =>
    _LeagueMatchupGroup(
      leagueId: json['leagueId'] as String,
      matchups:
          (json['matchups'] as List<dynamic>?)
              ?.map((e) => Matchup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LeagueMatchupGroupToJson(_LeagueMatchupGroup instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'matchups': instance.matchups,
    };

_WeekMatchupGroup _$WeekMatchupGroupFromJson(Map<String, dynamic> json) =>
    _WeekMatchupGroup(
      leagueId: json['leagueId'] as String,
      matchNum: (json['matchNum'] as num).toInt(),
      status: json['status'] as String,
      matchups:
          (json['matchups'] as List<dynamic>?)
              ?.map((e) => Matchup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WeekMatchupGroupToJson(_WeekMatchupGroup instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'matchNum': instance.matchNum,
      'status': instance.status,
      'matchups': instance.matchups,
    };
