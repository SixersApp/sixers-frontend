import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_match_model.freezed.dart';
part 'active_match_model.g.dart';

@freezed
sealed class PlayerPerformance with _$PlayerPerformance {
  const factory PlayerPerformance({
    @JsonKey(name: 'player_performance_id') required String playerPerformanceId,
    @JsonKey(name: 'player_id') required String playerId,
    @JsonKey(name: 'team_id') required String teamId,
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
  }) = _PlayerPerformance;

  factory PlayerPerformance.fromJson(Map<String, dynamic> json) =>
      _$PlayerPerformanceFromJson(json);
}

@freezed
sealed class ActiveMatch with _$ActiveMatch {
  const factory ActiveMatch({
    required String id,
    @JsonKey(name: 'match_date') required String matchDate,
    @JsonKey(name: 'tournament_id') required String tournamentId,
    @JsonKey(name: 'season_id') required String seasonId,
    @JsonKey(name: 'venue_id') String? venueId,
    @JsonKey(name: 'home_team_id') required String homeTeamId,
    @JsonKey(name: 'away_team_id') required String awayTeamId,
    @JsonKey(name: 'home_team_name') String? homeTeamName,
    @JsonKey(name: 'home_team_image') String? homeTeamImage,
    @JsonKey(name: 'away_team_name') String? awayTeamName,
    @JsonKey(name: 'away_team_image') String? awayTeamImage,
    @JsonKey(name: 'home_team_abbreviation') String? homeTeamAbbreviation,
    @JsonKey(name: 'away_team_abbreviation') String? awayTeamAbbreviation,
    @JsonKey(name: 'tournament_name') String? tournamentName,
    @JsonKey(name: 'abbreviation') String? abbreviation,
    @JsonKey(name: 'home_team_score') int? homeTeamScore,
    @JsonKey(name: 'away_team_score') int? awayTeamScore,
    @JsonKey(name: 'home_team_wickets') int? homeTeamWickets,
    @JsonKey(name: 'away_team_wickets') int? awayTeamWickets,
    @JsonKey(name: 'home_team_balls') int? homeTeamBalls,
    @JsonKey(name: 'away_team_balls') int? awayTeamBalls,
    @JsonKey(name: 'home_match_num') required int homeMatchNum,
    @JsonKey(name: 'away_match_num') required int awayMatchNum,
    int? dls,
    required String status,
    String? result,
    @JsonKey(name: 'event_num') int? eventNum,
    @JsonKey(name: 'player_performances')
    @Default([])
    List<PlayerPerformance> playerPerformances,
  }) = _ActiveMatch;

  factory ActiveMatch.fromJson(Map<String, dynamic> json) =>
      _$ActiveMatchFromJson(json);
}
