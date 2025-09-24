import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'matchup_model.dart';
import 'matchup_service.dart';

part 'matchup_provider.g.dart';

@riverpod
class Matchups extends _$Matchups {
  final _service = MatchupService();
  String? _leagueId;

  @override
  Future<List<Matchup>> build({String? leagueId}) async {
    _leagueId = leagueId;
    if (leagueId != null) {
      return _service.fetchMatchupsForLeague(leagueId);
    }
    return [];
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    if (_leagueId == null) {
      state = const AsyncData([]);
      return;
    }
    state = await AsyncValue.guard(() => _service.fetchMatchupsForLeague(_leagueId!));
  }

  Future<void> createMatchup(Matchup matchup) async {
    await _service.createMatchup(matchup);
    await refresh();
  }

  Future<void> updateMatchup(Matchup matchup) async {
    await _service.updateMatchup(matchup);
    await refresh();
  }

  Future<void> deleteMatchup(String id) async {
    await _service.deleteMatchup(id);
    await refresh();
  }

  Future<Matchup?> getMatchupById(String id) => _service.getMatchupById(id);
}

@riverpod
class UserMatchups extends _$UserMatchups {
  final _service = MatchupService();
  String? _userId;

  @override
  Future<List<Matchup>> build({String? userId}) async {
    _userId = userId;
    if (userId != null) {
      return _service.fetchMatchupsForUser(userId);
    }
    return [];
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    if (_userId == null) {
      state = const AsyncData([]);
      return;
    }
    state = await AsyncValue.guard(() => _service.fetchMatchupsForUser(_userId!));
  }
}
