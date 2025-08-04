import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup.freezed.dart';
part 'matchup.g.dart';

@freezed
class Matchup with _$Matchup {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Matchup({
    required String id,
    required String leagueId,
    required int matchNum,
    required String team1Id,
    required String team2Id,
    required double team1Score,
    required double team2Score,
    DateTime? scheduledTime,
    String? winnerTeamId,
    required DateTime createdAt,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);
}
