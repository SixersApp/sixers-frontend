import 'package:freezed_annotation/freezed_annotation.dart';
import '../fantasy_team_instance/fantasy_team_instance_model.dart';

part 'matchup_model.freezed.dart';
part 'matchup_model.g.dart';

double? _doubleFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

dynamic _doubleToJson(double? value) => value;

@freezed
sealed class Matchup with _$Matchup {
  const factory Matchup({
    required String id,

    @JsonKey(name: "league_id")
    required String leagueId,

    @JsonKey(name: "match_num")
    required int matchNum,

    @JsonKey(name: "fantasy_team_instance1_id")
    required String teamInstance1Id,

    @JsonKey(name: "fantasy_team_instance2_id")
    required String teamInstance2Id,

    @JsonKey(
      name: "fantasy_team_instance1_score",
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? team1Score,

    @JsonKey(
      name: "fantasy_team_instance2_score",
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? team2Score,

    @JsonKey(name: "fantasy_winner_team_instance_id")
    String? winnerTeamInstanceId,

    // Nested optional models
    FantasyTeamInstance? team1,
    FantasyTeamInstance? team2,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) =>
      _$MatchupFromJson(json);
}