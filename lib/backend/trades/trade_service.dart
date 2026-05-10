import 'package:dio/dio.dart';
import 'package:sixers/utils/logger.dart';
import '../auth/dio_client.dart';
import 'trade_model.dart';

class TradeService {
  Future<List<Trade>> listTrades(String teamId) async {
    try {
      final res = await ApiClient.dio.get('/trades/list/$teamId');
      if (res.statusCode != 200 || res.data is! List) return [];
      return (res.data as List)
          .map((e) => Trade.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logError('List trades error: $e');
      return [];
    }
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
      if (res.statusCode == 201 && res.data is Map<String, dynamic>) {
        return {'ok': true, ...res.data as Map<String, dynamic>};
      }
      return {'ok': false, 'message': 'Failed to propose trade'};
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Failed to propose trade')
          : 'Failed to propose trade';
      return {'ok': false, 'message': msg};
    } catch (e) {
      return {'ok': false, 'message': 'Error: $e'};
    }
  }

  Future<Map<String, dynamic>> acceptTrade(String tradeId) async {
    try {
      final res = await ApiClient.dio.post('/trades/$tradeId/accept');
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return {'ok': true, ...res.data as Map<String, dynamic>};
      }
      return {'ok': false, 'message': 'Failed to accept trade'};
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Failed to accept trade')
          : 'Failed to accept trade';
      return {'ok': false, 'message': msg};
    } catch (e) {
      return {'ok': false, 'message': 'Error: $e'};
    }
  }

  Future<Map<String, dynamic>> declineTrade(String tradeId) async {
    try {
      final res = await ApiClient.dio.patch('/trades/$tradeId/decline');
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return {'ok': true, ...res.data as Map<String, dynamic>};
      }
      return {'ok': false, 'message': 'Failed'};
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Failed')
          : 'Failed';
      return {'ok': false, 'message': msg};
    } catch (e) {
      return {'ok': false, 'message': 'Error: $e'};
    }
  }
}
