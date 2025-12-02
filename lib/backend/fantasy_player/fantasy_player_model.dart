import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_player_model.freezed.dart';
part 'fantasy_player_model.g.dart';

@freezed
sealed class FantasyPlayer with _$FantasyPlayer {
  const factory FantasyPlayer({
    @JsonKey(name: "player_season_id", defaultValue: "") 
    required String playerSeasonId,

    @JsonKey(name: "player_id", defaultValue: "")
    required String playerId,

    @JsonKey(name: "full_name", defaultValue: "")
    required String fullName,

    @JsonKey(name: "performance_id", defaultValue: "")
    required String performanceId,

    @JsonKey(name: "runs_scored", defaultValue: 0)
    @Default(0) int runsScored,

    @JsonKey(name: "balls_faced", defaultValue: 0)
    @Default(0) int ballsFaced,

    @JsonKey(name: "fours", defaultValue: 0)
    @Default(0) int fours,

    @JsonKey(name: "sixes", defaultValue: 0)
    @Default(0) int sixes,

    @JsonKey(name: "runs_conceded", defaultValue: 0)
    @Default(0) int runsConceded,

    @JsonKey(name: "balls_bowled", defaultValue: 0)
    @Default(0) int ballsBowled,

    @JsonKey(name: "wickets_taken", defaultValue: 0)
    @Default(0) int wicketsTaken,

    @JsonKey(name: "catches", defaultValue: 0)
    @Default(0) int catches,

    @JsonKey(name: "dismissals", defaultValue: 0)
    @Default(0) int dismissals,

    @JsonKey(name: "caught_behinds", defaultValue: 0)
    @Default(0) int caughtBehinds,

    @JsonKey(name: "wides_bowled", defaultValue: 0)
    @Default(0) int widesBowled,

    @JsonKey(name: "byes_bowled", defaultValue: 0)
    @Default(0) int byesBowled,

    @JsonKey(name: "run_outs", defaultValue: 0)
    @Default(0) int runOuts,

    @JsonKey(name: "no_balls_bowled", defaultValue: 0)
    @Default(0) int noBallsBowled,

    @JsonKey(name: "catches_dropped", defaultValue: 0)
    @Default(0) int catchesDropped,

    @JsonKey(name: "inserted_at")
    DateTime? insertedAt,

    @JsonKey(name: "home_team_id", defaultValue: "")
    @Default("") String homeTeamId,

    @JsonKey(name: "home_team_name", defaultValue: "")
    @Default("") String homeTeamName,

    @JsonKey(name: "home_team_image", defaultValue: "")
    @Default("") String homeTeamImage,

    @JsonKey(name: "away_team_id", defaultValue: "")
    @Default("") String awayTeamId,

    @JsonKey(name: "away_team_name", defaultValue: "")
    @Default("") String awayTeamName,

    @JsonKey(name: "away_team_image", defaultValue: "")
    @Default("") String awayTeamImage,

    @JsonKey(name: "fantasy_points", defaultValue: 0)
    @Default(0) int fantasyPoints,
  }) = _FantasyPlayer;

  factory FantasyPlayer.fromJson(Map<String, dynamic> json) =>
      _$FantasyPlayerFromJson(json);
}