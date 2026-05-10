import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'waiver_model.dart';
import 'waiver_service.dart';

final waiverProvider =
    AsyncNotifierProvider<WaiverNotifier, WaiverPage>(WaiverNotifier.new);

class WaiverNotifier extends AsyncNotifier<WaiverPage> {
  late final WaiverService _service;
  String? _leagueId;
  int _page = 1;
  static const int pageSize = 5;

  @override
  Future<WaiverPage> build() async {
    _service = WaiverService();
    return WaiverPage.empty();
  }

  Future<void> loadPage(String leagueId, int page) async {
    _leagueId = leagueId;
    _page = page;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.listWaivers(leagueId: leagueId, page: page, limit: pageSize),
    );
  }

  Future<void> nextPage() async {
    final current = state.value;
    if (_leagueId == null || current == null || _page >= current.totalPages) return;
    await loadPage(_leagueId!, _page + 1);
  }

  Future<void> prevPage() async {
    if (_leagueId == null || _page <= 1) return;
    await loadPage(_leagueId!, _page - 1);
  }

  Future<Map<String, dynamic>> add(String leagueId, String teamId, String playerId) async {
    final result = await _service.addPlayer(
      leagueId: leagueId,
      teamId: teamId,
      playerId: playerId,
    );
    if (result['ok'] == true) {
      await ref.read(fantasyTeamInstancesProvider.notifier).silentRefresh();
      await loadPage(leagueId, _page);
    }
    return result;
  }

  Future<Map<String, dynamic>> drop(String leagueId, String teamId, String playerId) async {
    final result = await _service.dropPlayer(
      leagueId: leagueId,
      teamId: teamId,
      playerId: playerId,
    );
    if (result['ok'] == true) {
      await ref.read(fantasyTeamInstancesProvider.notifier).silentRefresh();
      await loadPage(leagueId, _page);
    }
    return result;
  }
}
