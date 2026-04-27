import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../auth/auth_provider.dart';
import 'trade_model.dart';
import 'trade_service.dart';

part 'trade_provider.g.dart';

@riverpod
class LeagueTrades extends _$LeagueTrades {
  @override
  Future<List<Trade>> build(String leagueId) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];
    return TradeService().getLeagueTrades(leagueId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => TradeService().getLeagueTrades(leagueId));
  }

  Future<bool> accept(String tradeId) async {
    final success = await TradeService().acceptTrade(tradeId);
    if (success) await refresh();
    return success;
  }

  Future<bool> decline(String tradeId) async {
    final success = await TradeService().declineTrade(tradeId);
    if (success) await refresh();
    return success;
  }

  Future<bool> cancel(String tradeId) async {
    final success = await TradeService().cancelTrade(tradeId);
    if (success) await refresh();
    return success;
  }

  Future<bool> veto(String tradeId) async {
    final success = await TradeService().vetoTrade(tradeId);
    if (success) await refresh();
    return success;
  }
}
