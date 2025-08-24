
import 'package:json_annotation/json_annotation.dart';

part 'scoring_rule_model.g.dart';

/// Matches Postgres enum `rule_mode` values
@JsonEnum(fieldRename: FieldRename.snake)
enum RuleMode { perUnit, flat, threshold, band, multiplier }

/// Minimal range type for Postgres `numrange`
/// Serialized as the standard PG text form, e.g. "[0,30)", "(-infinity,10]"
class NumRange {
  final num? lower;               // null if -infinity
  final num? upper;               // null if +infinity
  final bool lowerInclusive;      // '[' vs '('
  final bool upperInclusive;      // ']' vs ')'
  final bool lowerInfinite;       // -infinity
  final bool upperInfinite;       // +infinity

  const NumRange({
    this.lower,
    this.upper,
    this.lowerInclusive = true,
    this.upperInclusive = false,
    this.lowerInfinite = false,
    this.upperInfinite = false,
  });

  /// Parse Postgres numrange text to NumRange
  factory NumRange.fromPostgresText(String text) {
    final s = text.trim();
    if (s.isEmpty || s.toLowerCase() == 'empty') {
      return const NumRange(lower: null, upper: null);
    }
    final li = s.startsWith('[');
    final ui = s.endsWith(']');
    final inner = s.substring(1, s.length - 1);
    final parts = inner.split(',');
    if (parts.length != 2) {
      throw FormatException('Invalid numrange: $text');
    }

    num? parseNum(String v) => num.tryParse(v);
    final lowerStr = parts[0].trim();
    final upperStr = parts[1].trim();

    final lowerIsInf = lowerStr.toLowerCase() == '-infinity';
    final upperIsInf = upperStr.toLowerCase() == 'infinity';

    final lowerNum = lowerIsInf || lowerStr.isEmpty ? null : parseNum(lowerStr);
    final upperNum = upperIsInf || upperStr.isEmpty ? null : parseNum(upperStr);

    return NumRange(
      lower: lowerNum,
      upper: upperNum,
      lowerInclusive: li,
      upperInclusive: ui,
      lowerInfinite: lowerIsInf,
      upperInfinite: upperIsInf,
    );
  }

  /// Convert to Postgres numrange text (e.g. "[0,30)")
  String toPostgresText() {
    String lowerStr =
        lowerInfinite ? '-infinity' : (lower == null ? '' : '$lower');
    String upperStr =
        upperInfinite ? 'infinity' : (upper == null ? '' : '$upper');
    final open = lowerInclusive ? '[' : '(';
    final close = upperInclusive ? ']' : ')';
    return '$open$lowerStr,$upperStr$close';
  }

  @override
  String toString() => toPostgresText();
}

/// JSON converter for the `band` column (PG `numrange` <-> text)
class PgNumRangeConverter implements JsonConverter<NumRange?, String?> {
  const PgNumRangeConverter();
  @override
  NumRange? fromJson(String? json) =>
      (json == null) ? null : NumRange.fromPostgresText(json);
  @override
  String? toJson(NumRange? object) => object?.toPostgresText();
}

/// One scoring rule row. For defaults/templates, `leagueId` is null.
/// DB uniqueness/exclusion constraints are enforced server-side.
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ScoringRule {
  final String? id;             // uuid PK
  final String? leagueId;       // null => global default/template
  final String stat;            // e.g., "points_per_run", "catch_bonus"
  final String category;        // e.g., "batting", "fielding", "leadership"
  final RuleMode mode;

  // Only one of these sets is valid at a time, depending on `mode`.
  final num? perUnitPoints;     // mode = per_unit
  final num? flatPoints;        // mode = flat, threshold, band
  final int? threshold;         // mode = threshold
  @PgNumRangeConverter()
  final NumRange? band;         // mode = band (no overlaps per league/category/stat)
  final num? multiplier;        // mode = multiplier

  final DateTime? createdAt;

  const ScoringRule({
    this.id,
    this.leagueId,
    required this.stat,
    required this.category,
    required this.mode,
    this.perUnitPoints,
    this.flatPoints,
    this.threshold,
    this.band,
    this.multiplier,
    this.createdAt,
  });

  /// Handy constructors that mirror your CHECK constraint
  factory ScoringRule.perUnit({
    String? id,
    String? leagueId,
    required String stat,
    required String category,
    required num perUnitPoints,
  }) =>
      ScoringRule(
        id: id,
        leagueId: leagueId,
        stat: stat,
        category: category,
        mode: RuleMode.perUnit,
        perUnitPoints: perUnitPoints,
      );

  factory ScoringRule.flat({
    String? id,
    String? leagueId,
    required String stat,
    required String category,
    required num flatPoints,
  }) =>
      ScoringRule(
        id: id,
        leagueId: leagueId,
        stat: stat,
        category: category,
        mode: RuleMode.flat,
        flatPoints: flatPoints,
      );

  factory ScoringRule.threshold({
    String? id,
    String? leagueId,
    required String stat,
    required String category,
    required int threshold,
    required num flatPoints,
  }) =>
      ScoringRule(
        id: id,
        leagueId: leagueId,
        stat: stat,
        category: category,
        mode: RuleMode.threshold,
        threshold: threshold,
        flatPoints: flatPoints,
      );

  factory ScoringRule.band({
    String? id,
    String? leagueId,
    required String stat,
    required String category,
    required NumRange band,
    required num flatPoints,
  }) =>
      ScoringRule(
        id: id,
        leagueId: leagueId,
        stat: stat,
        category: category,
        mode: RuleMode.band,
        band: band,
        flatPoints: flatPoints,
      );

  factory ScoringRule.multiplier({
    String? id,
    String? leagueId,
    required String stat,
    required String category,
    required num multiplier,
  }) =>
      ScoringRule(
        id: id,
        leagueId: leagueId,
        stat: stat,
        category: category,
        mode: RuleMode.multiplier,
        multiplier: multiplier,
      );

  /// Optional client-side check mirroring the DB CHECK constraint
  void assertValid() {
    switch (mode) {
      case RuleMode.perUnit:
        assert(perUnitPoints != null &&
            flatPoints == null &&
            threshold == null &&
            band == null &&
            multiplier == null);
        break;
      case RuleMode.flat:
        assert(flatPoints != null &&
            perUnitPoints == null &&
            threshold == null &&
            band == null &&
            multiplier == null);
        break;
      case RuleMode.threshold:
        assert(threshold != null &&
            flatPoints != null &&
            perUnitPoints == null &&
            band == null &&
            multiplier == null);
        break;
      case RuleMode.band:
        assert(band != null &&
            flatPoints != null &&
            perUnitPoints == null &&
            threshold == null &&
            multiplier == null);
        break;
      case RuleMode.multiplier:
        assert(multiplier != null &&
            perUnitPoints == null &&
            flatPoints == null &&
            threshold == null &&
            band == null);
        break;
    }
  }

  factory ScoringRule.fromJson(Map<String, dynamic> json) =>
      _$ScoringRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ScoringRuleToJson(this);

  ScoringRule copyWith({
    String? id,
    String? leagueId,
    String? stat,
    String? category,
    RuleMode? mode,
    num? perUnitPoints,
    num? flatPoints,
    int? threshold,
    NumRange? band,
    num? multiplier,
    DateTime? createdAt,
  }) {
    return ScoringRule(
      id: id ?? this.id,
      leagueId: leagueId ?? this.leagueId,
      stat: stat ?? this.stat,
      category: category ?? this.category,
      mode: mode ?? this.mode,
      perUnitPoints: perUnitPoints ?? this.perUnitPoints,
      flatPoints: flatPoints ?? this.flatPoints,
      threshold: threshold ?? this.threshold,
      band: band ?? this.band,
      multiplier: multiplier ?? this.multiplier,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
