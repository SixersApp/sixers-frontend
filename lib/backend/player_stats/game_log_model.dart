import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_log_model.freezed.dart';
part 'game_log_model.g.dart';

@freezed
sealed class GameLogPerformance with _$GameLogPerformance {
  const factory GameLogPerformance({
    @JsonKey(name: 'matchId') required String matchId,
    @JsonKey(name: 'matchDate') required String matchDate,
    @JsonKey(name: 'matchStatus') required String matchStatus,
    @JsonKey(name: 'homeTeamName') String? homeTeamName,
    @JsonKey(name: 'homeTeamImage') String? homeTeamImage,
    @JsonKey(name: 'homeTeamAbbreviation') String? homeTeamAbbreviation,
    @JsonKey(name: 'awayTeamName') String? awayTeamName,
    @JsonKey(name: 'awayTeamImage') String? awayTeamImage,
    @JsonKey(name: 'awayTeamAbbreviation') String? awayTeamAbbreviation,
    @Default(0) int runsScored,
    @Default(0) int ballsFaced,
    @Default(0) int fours,
    @Default(0) int sixes,
    int? ballsBowled,
    int? runsConceded,
    int? wicketsTaken,
    @Default(0) int catches,
    @Default(0) int runOuts,
    @Default(0) int catchesDropped,
    @Default(false) bool notOut,
  }) = _GameLogPerformance;

  factory GameLogPerformance.fromJson(Map<String, dynamic> json) =>
      _$GameLogPerformanceFromJson(json);
}

@freezed
sealed class GameLogResponse with _$GameLogResponse {
  const factory GameLogResponse({
    required String playerId,
    @Default('') String name,
    @Default('') String image,
    @Default('') String role,
    required String seasonId,
    int? endYear,
    String? tournamentName,
    String? tournamentAbbreviation,
    @Default('') String teamName,
    String? teamImage,
    String? teamAbbreviation,
    @Default([]) List<GameLogPerformance> performances,
  }) = _GameLogResponse;

  factory GameLogResponse.fromJson(Map<String, dynamic> json) =>
      _$GameLogResponseFromJson(json);
}
