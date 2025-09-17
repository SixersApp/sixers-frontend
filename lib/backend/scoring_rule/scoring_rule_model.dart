
import 'package:json_annotation/json_annotation.dart';

part 'scoring_rule_model.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum RuleMode { perUnit, flat, threshold, band, multiplier }

class NumRange {
  final num? lower; 
  final num? upper;
  final bool lowerInclusive; 
  final bool upperInclusive;
  final bool lowerInfinite;
  final bool upperInfinite; 

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


class PgNumRangeConverter implements JsonConverter<NumRange?, String?> {
  const PgNumRangeConverter();
  @override
  NumRange? fromJson(String? json) =>
      json == null ? null : NumRange.fromPostgresText(json);
  @override
  String? toJson(NumRange? object) => object?.toPostgresText();
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ScoringRule {
  final String? id; 
  final String? leagueId;
  final String stat;
  final String category; 
  @JsonKey(unknownEnumValue: RuleMode.perUnit)
  final RuleMode mode;


  final num? perUnitPoints; 
  final num? flatPoints;
  final int? threshold; 
  @PgNumRangeConverter()
  final NumRange? band; 
  final num? multiplier; 

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

  String key() {
    final base = '$category|$stat|${mode.name}';
    switch (mode) {
      case RuleMode.threshold:
        return '$base|thr=${threshold ?? ''}';
      case RuleMode.band:
        return '$base|band=${band?.toPostgresText() ?? ''}';
      default:
        return base;
    }
  }


  ScoringRule copyForLeague(String leagueId) =>
      copyWith(id: null, leagueId: leagueId);

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

extension ScoringRuleRpc on ScoringRule {
  String get modeSnake => switch (mode) {
    RuleMode.perUnit => 'per_unit',
    RuleMode.flat => 'flat',
    RuleMode.threshold => 'threshold',
    RuleMode.band => 'band',
    RuleMode.multiplier => 'multiplier',
  };

  Map<String, dynamic> toRpcJson() {
    final norm = normalizedForMode(); 
    Map<String, dynamic> out = {
      'category': norm.category,
      'stat': norm.stat,
      'mode': modeSnake,
      if (norm.perUnitPoints != null) 'per_unit_points': norm.perUnitPoints,
      if (norm.flatPoints != null) 'flat_points': norm.flatPoints,
      if (norm.threshold != null) 'threshold': norm.threshold,
      if (norm.multiplier != null) 'multiplier': norm.multiplier,
    };
    if (norm.mode == RuleMode.band && norm.band != null) {
      final b = norm.band!;
      out['band'] = {
        'lower': b.lowerInfinite ? null : b.lower,
        'upper': b.upperInfinite ? null : b.upper,
        'bounds': '${b.lowerInclusive ? '[' : '('}${b.upperInclusive ? ']' : ')'}',
      };
    }
    out.removeWhere((_, v) => v == null);
    return out;
  }
}
