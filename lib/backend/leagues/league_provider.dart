
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/players/player_provider.dart';

part 'league_provider.g.dart';

@riverpod
class Leagues extends _$Leagues {
  final _service = LeagueService();

  @override
  Future<List<League>> build() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return [];
    return _service.fetchLeaguesForUser(uid);
  }

 

  Future<void> refresh() async {

    state = const AsyncLoading();
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) {
      state = const AsyncData([]);
      return;
    }
    state = await AsyncValue.guard(() => _service.fetchLeaguesForUser(uid));
  }

  Future<String?> createLeagueWithRules(
    League league,
    List<ScoringRule>? rules,
  ) async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return null;
    final id = await _service.createLeagueWithRules(
      league: league,
      ownerUserId: uid,
      rules: rules, 
    );
    await refresh();
    return id;
  }

  Future<void> createLeague(League league) async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;
    await _service.createLeague(league, uid);
    await refresh();
  }

  Future<void> updateLeague(League league) async {
    await _service.updateLeague(league);
    await refresh();
  }

  Future<void> deleteLeague(String leagueId) async {
    await _service.deleteLeague(leagueId);
    await refresh();
  }

  Future<League?> getLeagueByJoinCode(String joinCode) async {
    return _service.getLeagueByJoinCode(joinCode);
  }

  Future<void> startDraft(String leagueId) async {
    await _service.startDraft(leagueId);
    await refresh(); 
  }

  Future<League?> getLeagueById(String id) => _service.getLeagueById(id);
}

@riverpod
class LeagueActions extends _$LeagueActions {
  final _svc = LeagueService();

  @override
  void build() {}

  Future<void> startDraft(String leagueId) async {
    await _svc.startDraft(leagueId);
    
    ref.invalidate(draftStateStreamProvider(leagueId));
    ref.invalidate(leaguesProvider);

    try {
      final league = await _svc.getLeagueById(leagueId);
      if (league != null) {
        ref.invalidate(allPlayersProvider(league.tournamentId));
      }
    } catch (e) {
      print(
        '[LeagueActions] Error getting league for players invalidation: $e',
      );
    }
  }
}
