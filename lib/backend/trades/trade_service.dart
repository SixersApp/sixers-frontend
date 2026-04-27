import '../auth/dio_client.dart';
import 'trade_model.dart';

class TradeService {
  final _dio = ApiClient.dio;

  Future<List<Trade>> getLeagueTrades(String leagueId) async {
    final res = await _dio.get('/trades/league/$leagueId');
    if (res.statusCode != 200 || res.data is! List) return [];
    return (res.data as List)
        .map((e) => Trade.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<String?> proposeTrade({
    required String leagueId,
    required String proposerTeamId,
    required String recipientTeamId,
    required List<String> offeredPlayerIds,
    required List<String> requestedPlayerIds,
  }) async {
    final res = await _dio.post('/trades/propose', data: {
      'leagueId': leagueId,
      'proposerTeamId': proposerTeamId,
      'recipientTeamId': recipientTeamId,
      'offeredPlayerIds': offeredPlayerIds,
      'requestedPlayerIds': requestedPlayerIds,
    });
    if (res.statusCode != 201) return null;
    return res.data['tradeId'] as String?;
  }

  Future<bool> acceptTrade(String tradeId) async {
    final res = await _dio.post('/trades/$tradeId/accept');
    return res.statusCode == 200;
  }

  Future<bool> declineTrade(String tradeId) async {
    final res = await _dio.patch('/trades/$tradeId/decline');
    return res.statusCode == 200;
  }

  Future<bool> cancelTrade(String tradeId) async {
    final res = await _dio.patch('/trades/$tradeId/cancel');
    return res.statusCode == 200;
  }

  Future<bool> vetoTrade(String tradeId) async {
    final res = await _dio.post('/trades/$tradeId/veto');
    return res.statusCode == 200;
  }
}
