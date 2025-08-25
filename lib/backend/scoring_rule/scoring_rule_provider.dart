import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scoring_rule_model.dart';
import 'scoring_rule_service.dart';      // defaults: league_id IS NULL

part 'scoring_rule_provider.g.dart';

@riverpod
class ScoringRules extends _$ScoringRules {
  // Services
  final _defaultsSvc = ScoringRuleService();
  final _leagueSvc = ScoringRuleService();

  // Track the scope used to build this notifier so refresh() knows what to refetch
  String? _scopeLeagueId;

  @override
  Future<List<ScoringRule>> build({String? leagueId}) async {
    _scopeLeagueId = leagueId;

    if (leagueId == null) {
      // Defaults (league_id IS NULL)
      return _defaultsSvc.fetchDefaults();
    }

    // League-specific; fall back to defaults if none exist yet
    final leagueRules = await _leagueSvc.fetchByLeagueId(leagueId);
    if (leagueRules.isNotEmpty) return leagueRules;

    return _defaultsSvc.fetchDefaults();
  }

  Future<void> refresh() async {
    final id = _scopeLeagueId;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (id == null) {
        return _defaultsSvc.fetchDefaults();
      } else {
        final leagueRules = await _leagueSvc.fetchByLeagueId(id);
        return leagueRules.isNotEmpty
            ? leagueRules
            : _defaultsSvc.fetchDefaults();
      }
    });
  }

  /// Replace all rules for a league (delete + insert) then refresh if we're
  /// currently scoped to that same league.
  Future<void> replaceAllForLeague(
    String leagueId,
    List<ScoringRule> rules,
  ) async {
    await _leagueSvc.replaceAllForLeague(leagueId, rules);
    if (_scopeLeagueId == leagueId) {
      await refresh();
    }
  }
}
