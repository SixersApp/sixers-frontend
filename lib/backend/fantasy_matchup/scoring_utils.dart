import 'dart:math' as math;

import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/live_match/active_match_model.dart';

/// Parsed band with optional bounds and inclusive/exclusive endpoints.
class _Band {
  final double? lo;
  final bool loInclusive;
  final double? hi;
  final bool hiInclusive;
  _Band(this.lo, this.loInclusive, this.hi, this.hiInclusive);

  bool contains(double value) {
    if (lo != null) {
      if (loInclusive ? value < lo! : value <= lo!) return false;
    }
    if (hi != null) {
      if (hiInclusive ? value > hi! : value >= hi!) return false;
    }
    return true;
  }
}

/// Parse a band string like "[0,50)" or "(,100]" into a [_Band].
/// Format: left bracket/paren + optional number + comma + optional number + right bracket/paren.
_Band? _parseBand(String? band) {
  if (band == null || band.isEmpty) return null;
  final trimmed = band.trim();
  if (trimmed.length < 3) return null;

  final leftChar = trimmed[0];
  final rightChar = trimmed[trimmed.length - 1];
  final loInclusive = leftChar == '[';
  final hiInclusive = rightChar == ']';

  final inner = trimmed.substring(1, trimmed.length - 1);
  final commaIdx = inner.indexOf(',');
  if (commaIdx == -1) return null;

  final loStr = inner.substring(0, commaIdx).trim();
  final hiStr = inner.substring(commaIdx + 1).trim();

  final lo = loStr.isEmpty ? null : double.tryParse(loStr);
  final hi = hiStr.isEmpty ? null : double.tryParse(hiStr);

  if (loStr.isNotEmpty && lo == null) return null;
  if (hiStr.isNotEmpty && hi == null) return null;

  return _Band(lo, loInclusive, hi, hiInclusive);
}

/// Returns the set of scoring rule categories that apply to a given slot/role.
///
/// - bat slots → batting + fielding
/// - bowl slots → bowling + fielding
/// - allrounder slots → batting + bowling + fielding
/// - flex slots → determined by the player's role
Set<String> _applicableCategories(String slot, String role) {
  final s = slot.toLowerCase();
  if (s.startsWith('all')) {
    return {'batting', 'bowling', 'fielding'};
  }
  if (s.startsWith('bat')) {
    return {'batting', 'fielding'};
  }
  if (s.startsWith('bowl')) {
    return {'bowling', 'fielding'};
  }
  if (s.startsWith('flex')) {
    final r = role.toLowerCase();
    if (r.contains('bat') || r.contains('keeper') || r.contains('wicket')) {
      return {'batting', 'fielding'};
    }
    if (r.contains('bowl')) {
      return {'bowling', 'fielding'};
    }
    return {'batting', 'fielding'};
  }
  return {};
}

/// Compute points for a per_unit rule based on the stat name.
double _computePerUnit(
    PlayerPerformance perf, LeagueScoringRule rule, String stat) {
  final pts = rule.perUnitPoints ?? 0;
  switch (stat) {
    // Batting
    case 'bonus per 4':
      return (perf.fours ?? 0) * pts;
    case 'bonus per 6':
      return (perf.sixes ?? 0) * pts;
    case 'points per run':
      return (perf.runsScored ?? 0) * pts;
    // Bowling
    case '3-wicket bonus':
      return ((perf.wicketsTaken ?? 0) ~/ 3) * pts;
    case '5-wicket bonus':
      return ((perf.wicketsTaken ?? 0) ~/ 5) * pts;
    case 'points per wicket':
      return (perf.wicketsTaken ?? 0) * pts;
    // Fielding
    case '3-catches bonus':
      return ((perf.catches ?? 0) ~/ 3) * pts;
    case 'points per catch taken':
      return (perf.catches ?? 0) * pts;
    case 'run out':
      return (perf.runOuts ?? 0) * pts;
    case 'dropped catch':
      return (perf.catchesDropped ?? 0) * pts;
    default:
      return 0;
  }
}

/// Compute points for a flat rule based on the stat name.
double _computeFlat(
    PlayerPerformance perf, LeagueScoringRule rule, String stat) {
  final pts = rule.flatPoints ?? 0;
  switch (stat) {
    case 'bonus per century':
      return (perf.runsScored ?? 0) >= 100 ? pts : 0;
    case 'bonus per half-century':
      return (perf.runsScored ?? 0) >= 50 ? pts : 0;
    default:
      return 0;
  }
}

/// Compute points for a band rule based on the stat name.
/// Calculates a derived value (e.g. strike rate, economy) and checks if it
/// falls within the rule's band range.
double _computeBand(
    PlayerPerformance perf, LeagueScoringRule rule, String stat) {
  double? computedValue;

  switch (stat) {
    case 'strike rate':
      final ballsFaced = perf.ballsFaced ?? 0;
      if (ballsFaced == 0) return 0;
      computedValue = ((perf.runsScored ?? 0) / ballsFaced) * 100;
    case 'economy':
      final ballsBowled = perf.ballsBowled ?? 0;
      if (ballsBowled == 0) return 0;
      computedValue = ((perf.runsConceded ?? 0) / ballsBowled) * 100;
    default:
      return 0;
  }

  final band = _parseBand(rule.band);
  if (band == null) return 0;
  if (band.contains(computedValue)) {
    return rule.flatPoints ?? 0;
  }
  return 0;
}

/// Calculate fantasy points for a single [PlayerPerformance] given a set of
/// [LeagueScoringRule]s filtered to the applicable categories for their slot.
///
/// [playerId] is the player's ID.
/// [captainId] and [viceCaptainId] are player IDs of the captain and
/// vice-captain for the team. Multiplier rules (e.g. captaincy, vice captaincy)
/// are applied last, after all other rules have been summed.
double calculatePlayerPoints(
  PlayerPerformance perf,
  List<LeagueScoringRule> rules,
  Set<String> categories, {
  String? playerId,
  String? captainId,
  String? viceCaptainId,
}) {
  double total = 0;
  final multiplierRules = <LeagueScoringRule>[];

  for (final rule in rules) {
    // Multiplier rules (e.g. captaincy) apply regardless of category
    if (rule.mode == RuleMode.multiplier) {
      multiplierRules.add(rule);
      continue;
    }

    if (!categories.contains(rule.category.toLowerCase())) continue;

    final stat = rule.stat.toLowerCase();
    double points = 0;

    switch (rule.mode) {
      case RuleMode.per_unit:
        points = _computePerUnit(perf, rule, stat);
      case RuleMode.flat:
        points = _computeFlat(perf, rule, stat);
      case RuleMode.band:
        points = _computeBand(perf, rule, stat);
      case RuleMode.multiplier:
        break; // already handled above
      case RuleMode.threshold:
        points = _computeFlat(perf, rule, stat);
    }

    total += points;
  }

  // Apply multiplier rules after all other scoring
  for (final rule in multiplierRules) {
    final stat = rule.stat.toLowerCase();
    final bool applies;
    switch (stat) {
      case 'captaincy multiplier':
        applies = playerId != null && playerId == captainId;
      case 'vice captaincy multiplier':
        applies = playerId != null && playerId == viceCaptainId;
      default:
        applies = false;
    }
    if (applies) {
      total *= (rule.multiplier ?? 1);
    }
  }

  return total;
}

/// A single line item in a fantasy score breakdown.
class ScoreBreakdownItem {
  final String label;
  final String statDisplay;
  final String ptsPerDisplay;
  final double points;

  const ScoreBreakdownItem({
    required this.label,
    required this.statDisplay,
    required this.ptsPerDisplay,
    required this.points,
  });
}

/// Detailed breakdown result including subtotal, multipliers, and total.
class ScoreBreakdown {
  final List<ScoreBreakdownItem> items;
  final double subtotal;
  final List<ScoreBreakdownItem> multipliers;
  final double total;

  const ScoreBreakdown({
    required this.items,
    required this.subtotal,
    required this.multipliers,
    required this.total,
  });
}

/// Return a per-stat readable name for display.
String _statDisplayName(String stat) {
  switch (stat) {
    case 'points per run':
      return 'Runs';
    case 'bonus per 4':
      return "4's scored";
    case 'bonus per 6':
      return "6's scored";
    case 'strike rate':
      return 'Strike Rate';
    case 'economy':
      return 'Economy';
    case 'bonus per century':
      return 'Century Bonus';
    case 'bonus per half-century':
      return 'Half Century Bonus';
    case 'points per wicket':
      return 'Wickets';
    case '3-wicket bonus':
      return '3-Wicket Bonus';
    case '5-wicket bonus':
      return '5-Wicket Bonus';
    case 'points per catch taken':
      return 'Catch Taken';
    case '3-catches bonus':
      return '3-Catches Bonus';
    case 'run out':
      return 'Run Out';
    case 'dropped catch':
      return 'Dropped Catch';
    case 'captaincy multiplier':
      return 'Captain Multiplier';
    case 'vice captaincy multiplier':
      return 'Vice Captain Multiplier';
    default:
      return stat[0].toUpperCase() + stat.substring(1);
  }
}

/// Format a band string like "[140,)" → ">140", "(,6]" → "<6", "[100,150)" → "100-150".
String _formatBand(String? band) {
  if (band == null || band.isEmpty) return '';
  final parsed = _parseBand(band);
  if (parsed == null) return band;

  if (parsed.lo != null && parsed.hi == null) {
    final loStr = parsed.lo! == parsed.lo!.roundToDouble()
        ? parsed.lo!.toInt().toString()
        : parsed.lo!.toString();
    return '>$loStr';
  }
  if (parsed.lo == null && parsed.hi != null) {
    final hiStr = parsed.hi! == parsed.hi!.roundToDouble()
        ? parsed.hi!.toInt().toString()
        : parsed.hi!.toString();
    return '<$hiStr';
  }
  if (parsed.lo != null && parsed.hi != null) {
    final loStr = parsed.lo! == parsed.lo!.roundToDouble()
        ? parsed.lo!.toInt().toString()
        : parsed.lo!.toString();
    final hiStr = parsed.hi! == parsed.hi!.roundToDouble()
        ? parsed.hi!.toInt().toString()
        : parsed.hi!.toString();
    return '$loStr-$hiStr';
  }
  return band;
}

/// Get the stat value to display for a given rule.
String _statValue(PlayerPerformance perf, LeagueScoringRule rule, String stat) {
  switch (stat) {
    case 'points per run':
      return '${perf.runsScored ?? 0}';
    case 'bonus per 4':
      return '${perf.fours ?? 0}';
    case 'bonus per 6':
      return '${perf.sixes ?? 0}';
    case 'strike rate':
      final bf = perf.ballsFaced ?? 0;
      if (bf == 0) return '0';
      return _formatBand(rule.band);
    case 'economy':
      final bb = perf.ballsBowled ?? 0;
      if (bb == 0) return '0';
      return _formatBand(rule.band);
    case 'bonus per century':
      return (perf.runsScored ?? 0) >= 100 ? '1' : '0';
    case 'bonus per half-century':
      return (perf.runsScored ?? 0) >= 50 ? '1' : '0';
    case 'points per wicket':
      return '${perf.wicketsTaken ?? 0}';
    case '3-wicket bonus':
      return '${(perf.wicketsTaken ?? 0) ~/ 3}';
    case '5-wicket bonus':
      return '${(perf.wicketsTaken ?? 0) ~/ 5}';
    case 'points per catch taken':
      return '${perf.catches ?? 0}';
    case '3-catches bonus':
      return '${(perf.catches ?? 0) ~/ 3}';
    case 'run out':
      return '${perf.runOuts ?? 0}';
    case 'dropped catch':
      return '${perf.catchesDropped ?? 0}';
    case 'captaincy multiplier':
      return 'C';
    case 'vice captaincy multiplier':
      return 'VC';
    default:
      return '';
  }
}

/// Get the "Pts. Per" display for a rule.
String _ptsPerDisplay(LeagueScoringRule rule) {
  switch (rule.mode) {
    case RuleMode.per_unit:
      return '${rule.perUnitPoints?.toInt() ?? 0}';
    case RuleMode.flat:
    case RuleMode.threshold:
    case RuleMode.band:
      return '${rule.flatPoints?.toInt() ?? 0}';
    case RuleMode.multiplier:
      return '${rule.multiplier ?? 1}x';
  }
}

/// Calculate a detailed score breakdown for a single performance.
ScoreBreakdown calculateScoreBreakdown(
  PlayerPerformance perf,
  List<LeagueScoringRule> rules,
  Set<String> categories, {
  String? playerId,
  String? captainId,
  String? viceCaptainId,
}) {
  final items = <ScoreBreakdownItem>[];
  final multiplierItems = <ScoreBreakdownItem>[];
  double subtotal = 0;

  final multiplierRules = <LeagueScoringRule>[];

  for (final rule in rules) {
    // Multiplier rules (e.g. captaincy) apply regardless of category
    if (rule.mode == RuleMode.multiplier) {
      multiplierRules.add(rule);
      continue;
    }

    if (!categories.contains(rule.category.toLowerCase())) continue;

    final stat = rule.stat.toLowerCase();
    double points = 0;

    switch (rule.mode) {
      case RuleMode.per_unit:
        points = _computePerUnit(perf, rule, stat);
      case RuleMode.flat:
        points = _computeFlat(perf, rule, stat);
      case RuleMode.band:
        points = _computeBand(perf, rule, stat);
      case RuleMode.multiplier:
        break; // already handled above
      case RuleMode.threshold:
        points = _computeFlat(perf, rule, stat);
    }

    if (points != 0) {
      items.add(ScoreBreakdownItem(
        label: _statDisplayName(stat),
        statDisplay: _statValue(perf, rule, stat),
        ptsPerDisplay: _ptsPerDisplay(rule),
        points: points,
      ));
    }
    subtotal += points;
  }

  double total = subtotal;

  for (final rule in multiplierRules) {
    final stat = rule.stat.toLowerCase();
    final bool applies;
    switch (stat) {
      case 'captaincy multiplier':
        applies = playerId != null && playerId == captainId;
      case 'vice captaincy multiplier':
        applies = playerId != null && playerId == viceCaptainId;
      default:
        applies = false;
    }
    if (applies) {
      final multiplierPts = subtotal * ((rule.multiplier ?? 1) - 1);
      multiplierItems.add(ScoreBreakdownItem(
        label: _statDisplayName(stat),
        statDisplay: stat == 'captaincy multiplier' ? 'C' : 'VC',
        ptsPerDisplay: '${rule.multiplier ?? 1}x',
        points: multiplierPts,
      ));
      total = subtotal * (rule.multiplier ?? 1);
    }
  }

  return ScoreBreakdown(
    items: items,
    subtotal: subtotal,
    multipliers: multiplierItems,
    total: total,
  );
}

// ─── Projection ─────────────────────────────────────────────────────────────

/// Core projection formula.
/// [actualPts] — fantasy points scored so far.
/// [projectedPpg] — pre-match projected points per game.
/// [c] — completion ratio (0–1).
double projectedFantasyScore(double actualPts, double projectedPpg, double c) {
  if (c <= 0) return projectedPpg;
  if (c >= 1) return actualPts;

  final rawPace = actualPts / (c * projectedPpg);
  final pace = rawPace.clamp(0.2, 3.0);
  final momentum = c * pace + (1 - c);
  return actualPts + (1 - c) * projectedPpg * momentum;
}

/// Compute the completion ratio for a player based on slot, role, and perf.
/// Batsmen: ballsFaced / 25, capped at 1. If notOut == false (i.e. out), return 1.
/// Bowlers: oversBowled / 4, capped at 1. If oversBowled >= 24 balls (4 overs), 1.
/// All-rounders: max(cBat, cBowl).
/// Flex: depends on role.
double completionRatio(String slot, String role, PlayerPerformance perf) {
  final s = slot.toLowerCase();

  double cBat() {
    if (perf.notOut == false) return 1.0; // out
    return ((perf.ballsFaced ?? 0) / 25.0).clamp(0.0, 1.0);
  }

  double cBowl() {
    final bb = perf.ballsBowled ?? 0;
    if (bb >= 24) return 1.0; // 4 overs done
    return (bb / 24.0).clamp(0.0, 1.0);
  }

  if (s.startsWith('all')) {
    return cBat() > cBowl() ? cBat() : cBowl();
  }
  if (s.startsWith('bat') || s.startsWith('wicket')) return cBat();
  if (s.startsWith('bowl')) return cBowl();
  if (s.startsWith('flex')) {
    final r = role.toLowerCase();
    if (r.contains('bat') || r.contains('keeper') || r.contains('wicket')) return cBat();
    if (r.contains('bowl')) return cBowl();
    return cBat();
  }
  return 0;
}

/// Build lookups from playerPerformanceId and playerId -> PlayerPerformance
/// across all active matches.
({Map<String, PlayerPerformance> byPerfId, Map<String, PlayerPerformance> byPlayerId}) buildPerformanceLookup(
  Map<String, ActiveMatch> matchMap,
) {
  final byPerfId = <String, PlayerPerformance>{};
  final byPlayerId = <String, PlayerPerformance>{};
  for (final match in matchMap.values) {
    for (final perf in match.playerPerformances) {
      byPerfId[perf.playerPerformanceId] = perf;
      byPlayerId[perf.playerId] = perf;
    }
  }
  return (byPerfId: byPerfId, byPlayerId: byPlayerId);
}

/// Calculate the total fantasy score for a team's active players.
///
/// Each player is scored only on the rule categories that match their slot/role.
/// [captainId] and [viceCaptainId] are player IDs from the [MatchupTeam].
double calculateTeamScore(
  Iterable<MatchupPlayer> activePlayers,
  Map<String, PlayerPerformance> perfByPerfId,
  Map<String, PlayerPerformance> perfByPlayerId,
  List<LeagueScoringRule> rules, {
  String? captainId,
  String? viceCaptainId,
}) {
  double total = 0;
  for (final player in activePlayers) {
    final perf = (player.performanceId != null
            ? perfByPerfId[player.performanceId!]
            : null) ??
        perfByPlayerId[player.playerId];
    if (perf == null) continue;

    final categories = _applicableCategories(player.slot, player.role);
    final playerPoints = calculatePlayerPoints(
      perf,
      rules,
      categories,
      playerId: player.playerId,
      captainId: captainId,
      viceCaptainId: viceCaptainId,
    );
    total += playerPoints;
  }
  return total;
}

// ─── Win probability ─────────────────────────────────────────────────

/// Uncertainty factor: weight of remaining-to-score in stddev.
const _k = 0.3;

/// Approximate the normal CDF using the logistic approximation.
double _normalCdf(double x) => 1.0 / (1.0 + math.exp(-1.7 * x));

/// Per-player stddev: how uncertain their final score is.
double _playerStddev(double projectedScore, double initialProjection, double currentScore) {
  final shift = (projectedScore - initialProjection).abs();
  final remaining = (projectedScore - currentScore).abs();
  return shift + _k * remaining;
}

/// Compute win probability for team 1 given per-player data for both teams.
///
/// Each player needs: [currentScore], [projectedScore] (accounts for
/// captain/vc multipliers), and [initialProjection] (pre-match baseline).
///
/// Returns a value in [0, 1] representing team 1's win probability.
double winProbability({
  required List<({double currentScore, double projectedScore, double initialProjection})> team1Players,
  required List<({double currentScore, double projectedScore, double initialProjection})> team2Players,
}) {
  double teamMean(List<({double currentScore, double projectedScore, double initialProjection})> players) =>
      players.fold(0.0, (sum, p) => sum + p.projectedScore);

  double teamStd(List<({double currentScore, double projectedScore, double initialProjection})> players) {
    final variance = players.fold(0.0, (sum, p) {
      final sd = _playerStddev(p.projectedScore, p.initialProjection, p.currentScore);
      return sum + sd * sd;
    });
    return math.sqrt(variance);
  }

  final mean1 = teamMean(team1Players);
  final std1 = teamStd(team1Players);
  final mean2 = teamMean(team2Players);
  final std2 = teamStd(team2Players);

  final combinedStd = math.sqrt(std1 * std1 + std2 * std2);
  if (combinedStd == 0) return mean1 >= mean2 ? 0.5 : 0.5;

  return 1.0 - _normalCdf((mean2 - mean1) / combinedStd);
}
