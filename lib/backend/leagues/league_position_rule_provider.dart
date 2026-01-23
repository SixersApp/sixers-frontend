import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/leagues/league_position_rule_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';

part 'league_position_rule_provider.g.dart';

@riverpod
class LeaguePositionRules extends _$LeaguePositionRules {
  late final LeagueService _service;

  @override
  Future<List<LeaguePositionRule>> build(String leagueId) async {
    _service = LeagueService();
    return await _service.getLeaguePositionRules(leagueId: leagueId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.getLeaguePositionRules(leagueId: leagueId),
    );
  }
}

