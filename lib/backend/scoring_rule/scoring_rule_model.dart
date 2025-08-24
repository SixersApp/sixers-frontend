// lib/backend/scoring/scoring_rule_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'scoring_rule_model.g.dart';

/// Matches Postgres enum rule_mode: 'per_unit' | 'flat' | 'threshold' | 'band' | 'multiplier'
@JsonEnum(fieldRename: FieldRename.snake)
enum RuleMode { perUnit, flat, threshold, band, multiplier }

/// Postgres numrange <-> text, e.g. "[0,30)", "(-infinity,10]"
class NumRange {
  final num? lower; // null => -infinity
  final num? upper; // null => +infinity
  final bool lowerInclusive; // '[' vs '('
  final bool upperInclusive; // ']' vs ')'
  final bool lowerInfinite; // -infinity
  final bool upperInfinite; // +infinity

  const NumRange({
    this.lower,
    this.upper,
    this.lowerInclusive = true,
    this.upperInclusive = false,
    this.lowerInfinite = false,
    this.upperInfinite = false,
  });

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

  String toPostgresText() {
    final open = lowerInclusive ? '[' : '(';
    final close = upperInclusive ? ']' : ')';
    final lowerStr = lowerInfinite
        ? '-infinity'
        : (lower == null ? '' : '$lower');
    final upperStr = upperInfinite
        ? 'infinity'
        : (upper == null ? '' : '$upper');
    return '$open$lowerStr,$upperStr$close';
  }

  @override
  String toString() => toPostgresText();
}

/// numrange <-> text converter for json_serializable
class PgNumRangeConverter implements JsonConverter<NumRange?, String?> {
  const PgNumRangeConverter();
  @override
  NumRange? fromJson(String? json) =>
      json == null ? null : NumRange.fromPostgresText(json);
  @override
  String? toJson(NumRange? object) => object?.toPostgresText();
}

/// One scoring rule row. For defaults/templates, `leagueId` is null.
/// DB uniqueness/exclusion constraints are enforced server-side.
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ScoringRule {
  final String? id; // uuid PK
  final String? leagueId; // null => global default/template
  final String stat; // e.g., "points_per_run", "catch_bonus"
  final String category; // e.g., "batting", "fielding", "leadership"
  @JsonKey(unknownEnumValue: RuleMode.perUnit)
  final RuleMode mode;

  // Only one of these sets is valid at a time, depending on `mode`.
  final num? perUnitPoints; // mode = per_unit
  final num? flatPoints; // mode = flat, threshold, band
  final int? threshold; // mode = threshold
  @PgNumRangeConverter()
  final NumRange? band; // mode = band (no overlaps per league/category/stat)
  final num? multiplier; // mode = multiplier

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

  /// Stable identity for updates in lists (independent of DB id).
  /// Mirrors DB uniqueness rules (adds threshold or band text for those modes).
  String key() {
    final base = '${category}|${stat}|${mode.name}';
    switch (mode) {
      case RuleMode.threshold:
        return '$base|thr=${threshold ?? ''}';
      case RuleMode.band:
        return '$base|band=${band?.toPostgresText() ?? ''}';
      default:
        return base;
    }
  }

  /// Prepare for bulk insert: drop id, set leagueId.
  ScoringRule copyForLeague(String leagueId) =>
      copyWith(id: null, leagueId: leagueId);

  /// Clear fields that are not allowed for the current mode,
  /// so outgoing JSON always satisfies the DB CHECK constraint.
  ScoringRule normalizedForMode() {
    switch (mode) {
      case RuleMode.perUnit:
        return copyWith(
          flatPoints: null,
          threshold: null,
          band: null,
          multiplier: null,
        );
      case RuleMode.flat:
        return copyWith(
          perUnitPoints: null,
          threshold: null,
          band: null,
          multiplier: null,
        );
      case RuleMode.threshold:
        return copyWith(perUnitPoints: null, band: null, multiplier: null);
      case RuleMode.band:
        return copyWith(perUnitPoints: null, threshold: null, multiplier: null);
      case RuleMode.multiplier:
        return copyWith(
          perUnitPoints: null,
          flatPoints: null,
          threshold: null,
          band: null,
        );
    }
  }

  /// Debug-time mirror of the DB CHECK.
  void assertValid() {
    switch (mode) {
      case RuleMode.perUnit:
        assert(
          perUnitPoints != null &&
              flatPoints == null &&
              threshold == null &&
              band == null &&
              multiplier == null,
        );
        break;
      case RuleMode.flat:
        assert(
          flatPoints != null &&
              perUnitPoints == null &&
              threshold == null &&
              band == null &&
              multiplier == null,
        );
        break;
      case RuleMode.threshold:
        assert(
          threshold != null &&
              flatPoints != null &&
              perUnitPoints == null &&
              band == null &&
              multiplier == null,
        );
        break;
      case RuleMode.band:
        assert(
          band != null &&
              flatPoints != null &&
              perUnitPoints == null &&
              threshold == null &&
              multiplier == null,
        );
        break;
      case RuleMode.multiplier:
        assert(
          multiplier != null &&
              perUnitPoints == null &&
              flatPoints == null &&
              threshold == null &&
              band == null,
        );
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

  // Equality based on stable key (so list updates work even before insert)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoringRule &&
          runtimeType == other.runtimeType &&
          key() == other.key();

  @override
  int get hashCode => key().hashCode;

  @override
  String toString() =>
      'ScoringRule{key=${key()}, perUnit=$perUnitPoints, flat=$flatPoints, thr=$threshold, band=$band, mult=$multiplier}';
}
