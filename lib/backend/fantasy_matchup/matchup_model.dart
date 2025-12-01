import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_model.freezed.dart';
part 'matchup_model.g.dart';

@freezed
sealed class Matchup with _$Matchup {
  const factory Matchup({
    required String id,
    required String leagueId,
    required int matchNum,

    required String fantasyTeamInstance1Id,
    required String fantasyTeamInstance2Id,

    double? fantasyTeamInstance1Score,
    double? fantasyTeamInstance2Score,

    String? fantasyWinnerTeamInstanceId,
    required String createdAt,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) =>
      _$MatchupFromJson(json);
}