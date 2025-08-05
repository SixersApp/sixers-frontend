// lib/providers/leagues_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  /* ---------- CRUD helpers ---------- */

  Future<void> refresh() async {
    // AsyncLoading(previous) keeps old list while refetching → no blank frame
    state = const AsyncLoading();
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) {
      state = const AsyncData([]);
      return;
    }
    state = await AsyncValue.guard(() => _service.fetchLeaguesForUser(uid));
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

  Future<void> startDraft(String leagueId) async {
    await _service.startDraft(leagueId);
    await refresh(); // refresh provider state
  }

  Future<League?> getLeagueById(String id) => _service.getLeagueById(id);
}

@riverpod
class LeagueActions extends _$LeagueActions {
  final _svc = LeagueService();

  @override
  void build() {} // stateless

  Future<void> startDraft(String leagueId) async {
    await _svc.startDraft(leagueId);
    // refresh leagues list everywhere
    ref.invalidate(leaguesProvider);
  }
}
