import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stats_model.freezed.dart';
part 'player_stats_model.g.dart';

double? _toDouble(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v);
  return null;
}

@freezed
sealed class StatEntry with _$StatEntry {
  const factory StatEntry({
    @JsonKey(fromJson: _toDouble) double? value,
    @JsonKey(fromJson: _toDouble) double? percentile,
  }) = _StatEntry;

  factory StatEntry.fromJson(Map<String, dynamic> json) =>
      _$StatEntryFromJson(json);
}

@freezed
sealed class BattingStats with _$BattingStats {
  const factory BattingStats({
    StatEntry? matchesBatted,
    StatEntry? totalRuns,
    StatEntry? halfCenturies,
    StatEntry? centuries,
    StatEntry? strikeRate,
    StatEntry? battingAverage,
  }) = _BattingStats;

  factory BattingStats.fromJson(Map<String, dynamic> json) =>
      _$BattingStatsFromJson(json);
}

@freezed
sealed class BowlingStats with _$BowlingStats {
  const factory BowlingStats({
    StatEntry? matchesBowled,
    StatEntry? totalWickets,
    StatEntry? threeWicketHauls,
    StatEntry? fiveWicketHauls,
    StatEntry? bowlingAverage,
    StatEntry? bowlingEconomy,
  }) = _BowlingStats;

  factory BowlingStats.fromJson(Map<String, dynamic> json) =>
      _$BowlingStatsFromJson(json);
}

@freezed
sealed class SeasonStats with _$SeasonStats {
  const factory SeasonStats({
    required String seasonId,
    required int endYear,
    String? tournamentName,
    String? tournamentAbbreviation,
    @Default('') String teamName,
    String? teamImage,
    String? teamAbbreviation,
    @Default('') String role,
    BattingStats? batting,
    BowlingStats? bowling,
  }) = _SeasonStats;

  factory SeasonStats.fromJson(Map<String, dynamic> json) =>
      _$SeasonStatsFromJson(json);
}

@freezed
sealed class PlayerStats with _$PlayerStats {
  const factory PlayerStats({
    String? playerId,
    @Default('') String name,
    @Default('') String image,
    @Default([]) List<SeasonStats> seasons,
  }) = _PlayerStats;

  factory PlayerStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsFromJson(json);
}
