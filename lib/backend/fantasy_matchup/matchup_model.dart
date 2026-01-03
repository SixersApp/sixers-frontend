import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_model.freezed.dart';
part 'matchup_model.g.dart';

@freezed
sealed class Matchup with _$Matchup {
  const factory Matchup({
    required String id,
    @JsonKey(name: "league_id") required String leagueId,
    @JsonKey(name: "match_num") required int matchNum,

    // TEAM 1
    @JsonKey(name: "fantasy_team_instance1_id")
    required String fantasyTeamInstance1Id,

    @JsonKey(name: "fantasy_team1_id")
    required String fantasyTeam1Id,

    @JsonKey(name: "fantasy_team_instance1_score")
    required int fantasyTeamInstance1Score,

    // TEAM 2
    @JsonKey(name: "fantasy_team_instance2_id")
    required String fantasyTeamInstance2Id,

    @JsonKey(name: "fantasy_team2_id")
    required String fantasyTeam2Id,

    @JsonKey(name: "fantasy_team_instance2_score")
    required int fantasyTeamInstance2Score,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) =>
      _$MatchupFromJson(json);
}