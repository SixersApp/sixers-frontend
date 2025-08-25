import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scoring_rule_model.dart';
import 'scoring_rule_service.dart';

part 'scoring_rule_provider.g.dart';

@riverpod
class ScoringRules extends _$ScoringRules {

  final _defaultsSvc = ScoringRuleService();
  final _leagueSvc = ScoringRuleService();

  String? _scopeLeagueId;

  @override
  Future<List<ScoringRule>> build({String? leagueId}) async {
    _scopeLeagueId = leagueId;

    if (leagueId == null) {
   
      return _defaultsSvc.fetchDefaults();
    }

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
