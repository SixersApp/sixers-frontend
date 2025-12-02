import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
sealed class MatchModel with _$MatchModel {
  const factory MatchModel({
    @JsonKey(name: "id") String? id,

    @JsonKey(name: "match_date") String? matchDate,
    @JsonKey(name: "tournament_id") String? tournamentId,
    @JsonKey(name: "season_id") String? seasonId,
    @JsonKey(name: "venue_id") String? venueId,

    @JsonKey(name: "home_team_id") String? homeTeamId,
    @JsonKey(name: "away_team_id") String? awayTeamId,

    @JsonKey(name: "home_team_name") String? homeTeamName,
    @JsonKey(name: "home_team_image") String? homeTeamImage,
    @JsonKey(name: "away_team_name") String? awayTeamName,
    @JsonKey(name: "away_team_image") String? awayTeamImage,

    @JsonKey(name: "home_team_score") int? homeTeamScore,
    @JsonKey(name: "away_team_score") int? awayTeamScore,

    @JsonKey(name: "home_team_wickets") int? homeTeamWickets,
    @JsonKey(name: "away_team_wickets") int? awayTeamWickets,

    @JsonKey(name: "home_team_balls") int? homeTeamBalls,
    @JsonKey(name: "away_team_balls") int? awayTeamBalls,

    @JsonKey(name: "status") String? status,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}