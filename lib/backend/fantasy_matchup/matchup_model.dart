import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_model.freezed.dart';
part 'matchup_model.g.dart';

@freezed
sealed class MatchupPlayerPerformance with _$MatchupPlayerPerformance {
  const factory MatchupPlayerPerformance({
    @JsonKey(name: 'runs_scored') int? runsScored,
    @JsonKey(name: 'balls_faced') int? ballsFaced,
    int? fours,
    int? sixes,
    @JsonKey(name: 'balls_bowled') int? ballsBowled,
    @JsonKey(name: 'runs_conceded') int? runsConceded,
    @JsonKey(name: 'wickets_taken') int? wicketsTaken,
    int? catches,
    @JsonKey(name: 'run_outs') int? runOuts,
    @JsonKey(name: 'catches_dropped') int? catchesDropped,
    @JsonKey(name: 'not_out') bool? notOut,
  }) = _MatchupPlayerPerformance;

  factory MatchupPlayerPerformance.fromJson(Map<String, dynamic> json) =>
      _$MatchupPlayerPerformanceFromJson(json);
}

@freezed
sealed class MatchupPlayer with _$MatchupPlayer {
  const factory MatchupPlayer({
    required String playerId,
    String? performanceId,
    String? matchId,
    required String name,
    @JsonKey(name: 'full_name') String? fullName,
    required String image,
    required String role,
    @Default('') String slot,
    required String teamName,
    required String teamImage,
    String? teamAbbreviation,
    @JsonKey(name: 'projectedPoints') @Default(0) double projectedPpg,
    double? fantasyPoints,
    MatchupPlayerPerformance? performance,
  }) = _MatchupPlayer;

  factory MatchupPlayer.fromJson(Map<String, dynamic> json) =>
      _$MatchupPlayerFromJson(json);
}

@freezed
sealed class MatchupTeam with _$MatchupTeam {
  const factory MatchupTeam({
    required String fantasyTeamId,
    required String fantasyTeamInstanceId,
    String? captain,
    String? viceCaptain,
    @Default([]) List<MatchupPlayer> players,
  }) = _MatchupTeam;

  factory MatchupTeam.fromJson(Map<String, dynamic> json) =>
      _$MatchupTeamFromJson(json);
}

@freezed
sealed class Matchup with _$Matchup {
  const factory Matchup({
    required String id,
    required int matchNum,
    required MatchupTeam team1,
    required MatchupTeam team2,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) =>
      _$MatchupFromJson(json);
}

@freezed
sealed class LeagueMatchupGroup with _$LeagueMatchupGroup {
  const factory LeagueMatchupGroup({
    required String leagueId,
    @Default([]) List<Matchup> matchups,
  }) = _LeagueMatchupGroup;

  factory LeagueMatchupGroup.fromJson(Map<String, dynamic> json) =>
      _$LeagueMatchupGroupFromJson(json);
}

@freezed
sealed class WeekMatchupGroup with _$WeekMatchupGroup {
  const factory WeekMatchupGroup({
    required String leagueId,
    required int matchNum,
    required String status,
    @Default([]) List<Matchup> matchups,
  }) = _WeekMatchupGroup;

  factory WeekMatchupGroup.fromJson(Map<String, dynamic> json) =>
      _$WeekMatchupGroupFromJson(json);
}
