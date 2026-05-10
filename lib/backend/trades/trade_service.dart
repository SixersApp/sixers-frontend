import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/trades/trade_model.dart';

class TradeService {
  Future<List<Trade>> listTrades(String teamId) async {
    final res = await ApiClient.dio.get('/trades/list/$teamId');
    final data = res.data as List<dynamic>;
    return data.map((e) => Trade.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Map<String, dynamic>> proposeTrade({
    required String leagueId,
    required String proposerTeamId,
    required String recipientTeamId,
    required List<String> offeredPlayerIds,
    required List<String> requestedPlayerIds,
  }) async {
    try {
      final res = await ApiClient.dio.post('/trades/propose', data: {
        'leagueId': leagueId,
        'proposerTeamId': proposerTeamId,
        'recipientTeamId': recipientTeamId,
        'offeredPlayerIds': offeredPlayerIds,
        'requestedPlayerIds': requestedPlayerIds,
      });
      return {'ok': true, ...res.data as Map<String, dynamic>};
    } on DioException catch (e) {
      return {'ok': false, 'message': e.response?.data?['message'] ?? 'Failed to propose trade'};
    }
  }

  Future<Map<String, dynamic>> acceptTrade(String tradeId) async {
    try {
      final res = await ApiClient.dio.post('/trades/$tradeId/accept');
      return {'ok': true, ...res.data as Map<String, dynamic>};
    } on DioException catch (e) {
      return {'ok': false, 'message': e.response?.data?['message'] ?? 'Failed to accept trade'};
    }
  }

  Future<Map<String, dynamic>> declineTrade(String tradeId) async {
    try {
      final res = await ApiClient.dio.patch('/trades/$tradeId/decline');
      return {'ok': true, ...res.data as Map<String, dynamic>};
    } on DioException catch (e) {
      return {'ok': false, 'message': e.response?.data?['message'] ?? 'Failed to decline trade'};
    }
  }
}
