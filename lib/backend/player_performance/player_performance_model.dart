import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_performance_model.freezed.dart';
part 'player_performance_model.g.dart';

@freezed
sealed class PlayerPerformance with _$PlayerPerformance {
  const factory PlayerPerformance({
    required String playerSeasonId,
    required String playerId,
    String? performanceId,

    // Stats — default null -> 0
    @Default(0) int runsScored,
    @Default(0) int ballsFaced,
    @Default(0) int fours,
    @Default(0) int sixes,
    @Default(0) int runsConceded,
    @Default(0) int ballsBowled,
    @Default(0) int wicketsTaken,
    @Default(0) int catches,
    @Default(0) int dismissals,
    @Default(0) int caughtBehinds,
    @Default(0) int widesBowled,
    @Default(0) int byesBowled,
    @Default(0) int runOuts,
    @Default(0) int noBallsBowled,
    @Default(0) int catchesDropped,

    String? insertedAt,

    // Match Context
    String? homeTeamId,
    String? homeTeamName,
    String? homeTeamImage,
    String? awayTeamId,
    String? awayTeamName,
    String? awayTeamImage,
  }) = _PlayerPerformance;

  factory PlayerPerformance.fromJson(Map<String, dynamic> json) =>
      _$PlayerPerformanceFromJson({
        ...json,
        // Ensure null → 0 for statistics
        "runsScored": json["runs_scored"] ?? 0,
        "ballsFaced": json["balls_faced"] ?? 0,
        "fours": json["fours"] ?? 0,
        "sixes": json["sixes"] ?? 0,
        "runsConceded": json["runs_conceded"] ?? 0,
        "ballsBowled": json["balls_bowled"] ?? 0,
        "wicketsTaken": json["wickets_taken"] ?? 0,
        "catches": json["catches"] ?? 0,
        "dismissals": json["dismissals"] ?? 0,
        "caughtBehinds": json["caught_behinds"] ?? 0,
        "widesBowled": json["wides_bowled"] ?? 0,
        "byesBowled": json["byes_bowled"] ?? 0,
        "runOuts": json["run_outs"] ?? 0,
        "noBallsBowled": json["no_balls_bowled"] ?? 0,
        "catchesDropped": json["catches_dropped"] ?? 0,
      });
}