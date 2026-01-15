import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_scoring_rule_model.freezed.dart';
part 'league_scoring_rule_model.g.dart';

enum RuleMode {
  per_unit,
  flat,
  threshold,
  band,
  multiplier;

  static RuleMode fromString(String value) {
    final v = value.toLowerCase();
    switch (v) {
      case 'per_unit':
        return RuleMode.per_unit;
      case 'flat':
        return RuleMode.flat;
      case 'threshold':
        return RuleMode.threshold;
      case 'band':
        return RuleMode.band;
      case 'multiplier':
        return RuleMode.multiplier;
      default:
        return RuleMode.per_unit;
    }
  }
}

class RuleModeConverter implements JsonConverter<RuleMode, String> {
  const RuleModeConverter();

  @override
  RuleMode fromJson(String json) => RuleMode.fromString(json);

  @override
  String toJson(RuleMode object) => object.name;
}

class StringToDoubleConverter implements JsonConverter<double?, dynamic> {
  const StringToDoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    if (json is String) return double.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(double? object) => object;
}

class StringToIntConverter implements JsonConverter<int?, dynamic> {
  const StringToIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is num) return json.toInt();
    if (json is String) return int.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(int? object) => object;
}

@freezed
sealed class LeagueScoringRule with _$LeagueScoringRule {
  const factory LeagueScoringRule({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "league_id") String? leagueId,
    @JsonKey(name: "stat") required String stat,
    @JsonKey(name: "category") required String category,
    @RuleModeConverter()
    @JsonKey(name: "mode")
    required RuleMode mode,
    @StringToDoubleConverter()
    @JsonKey(name: "per_unit_points") double? perUnitPoints,
    @StringToDoubleConverter()
    @JsonKey(name: "flat_points") double? flatPoints,
    @StringToIntConverter()
    @JsonKey(name: "threshold") int? threshold,
    @JsonKey(name: "band") String? band,
    @StringToDoubleConverter()
    @JsonKey(name: "multiplier") double? multiplier,
  }) = _LeagueScoringRule;

  factory LeagueScoringRule.fromJson(Map<String, dynamic> json) =>
      _$LeagueScoringRuleFromJson(json);
}

@freezed
sealed class Tournament with _$Tournament {
  const factory Tournament({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "abbreviation") String? abbreviation,
    @JsonKey(name: "seasons") List<Season>? seasons,
  }) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
}

@freezed
sealed class Season with _$Season {
  const factory Season({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "start_year") required int startYear,
    @JsonKey(name: "end_year") required int endYear,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) =>
      _$SeasonFromJson(json);
}
