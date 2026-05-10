import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/trades/trade_model.dart';
import 'package:sixers/backend/trades/trade_service.dart';

final tradesProvider = AsyncNotifierProvider<TradesNotifier, List<Trade>>(TradesNotifier.new);

class TradesNotifier extends AsyncNotifier<List<Trade>> {
  late final TradeService _service;
  String? _teamId;

  @override
  Future<List<Trade>> build() async {
    _service = TradeService();
    return [];
  }

  Future<void> loadTrades(String teamId) async {
    _teamId = teamId;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _service.listTrades(teamId));
  }

  Future<void> _silentRefresh() async {
    if (_teamId == null) return;
    try {
      final trades = await _service.listTrades(_teamId!);
      state = AsyncData(trades);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<Map<String, dynamic>> accept(String tradeId) async {
    final result = await _service.acceptTrade(tradeId);
    if (result['ok'] == true) {
      await _silentRefresh();
      await ref.read(fantasyTeamInstancesProvider.notifier).silentRefresh();
    }
    return result;
  }

  Future<Map<String, dynamic>> decline(String tradeId) async {
    final result = await _service.declineTrade(tradeId);
    if (result['ok'] == true) await _silentRefresh();
    return result;
  }

  Future<Map<String, dynamic>> propose({
    required String leagueId,
    required String proposerTeamId,
    required String recipientTeamId,
    required List<String> offeredPlayerIds,
    required List<String> requestedPlayerIds,
  }) async {
    final result = await _service.proposeTrade(
      leagueId: leagueId,
      proposerTeamId: proposerTeamId,
      recipientTeamId: recipientTeamId,
      offeredPlayerIds: offeredPlayerIds,
      requestedPlayerIds: requestedPlayerIds,
    );
    if (result['ok'] == true) await _silentRefresh();
    return result;
  }
}
