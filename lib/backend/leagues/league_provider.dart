// lib/providers/leagues_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';

part 'league_provider.g.dart';

@riverpod
class Leagues extends _$Leagues {
  final _service = LeagueService();

  @override
  Future<List<League>> build() async {
    return [];
  }

  Future<void> loadLeaguesForUser(String userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _service.fetchLeaguesForUser(userId);
    });
  }

  Future<void> createLeague(League league, String userId) async {
    await _service.createLeague(league, userId);
    await loadLeaguesForUser(userId);
  }

  Future<void> updateLeague(League league, String userId) async {
    await _service.updateLeague(league);
    await loadLeaguesForUser(userId);
  }

  Future<void> deleteLeague(String leagueId, String userId) async {
    await _service.deleteLeague(leagueId);
    await loadLeaguesForUser(userId);
  }

  Future<League?> getLeagueById(String id) async {
    return await _service.getLeagueById(id);
  }
}
