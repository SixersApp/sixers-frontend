import 'package:dio/dio.dart';
import 'package:sixers/utils/logger.dart';
import '../auth/dio_client.dart';
import 'waiver_model.dart';

class WaiverService {
  Future<WaiverPage> listWaivers({
    required String leagueId,
    int page = 1,
    int limit = 10,
    String search = '',
    String role = '',
  }) async {
    try {
      final res = await ApiClient.dio.get(
        '/waivers/$leagueId',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search.isNotEmpty) 'search': search,
          if (role.isNotEmpty) 'role': role,
        },
      );
      if (res.statusCode != 200 || res.data == null) return WaiverPage.empty();
      final data = res.data as Map<String, dynamic>;
      return WaiverPage(
        players: (data['players'] as List)
            .map((e) => WaiverPlayer.fromJson(e as Map<String, dynamic>))
            .toList(),
        page: data['page'] as int,
        totalPages: data['totalPages'] as int,
        total: data['total'] as int,
      );
    } catch (e) {
      logError('List waivers error: $e');
      return WaiverPage.empty();
    }
  }

  Future<Map<String, dynamic>> addPlayer({
    required String leagueId,
    required String teamId,
    required String playerId,
  }) async {
    try {
      final res = await ApiClient.dio.post(
        '/waivers/$leagueId/add',
        data: {'teamId': teamId, 'playerId': playerId},
      );
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return res.data as Map<String, dynamic>;
      }
      return {'ok': false, 'message': 'Failed to add player'};
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Failed to add player')
          : 'Failed to add player';
      return {'ok': false, 'message': msg};
    } catch (e) {
      return {'ok': false, 'message': 'Error: $e'};
    }
  }

  Future<Map<String, dynamic>> dropPlayer({
    required String leagueId,
    required String teamId,
    required String playerId,
  }) async {
    try {
      final res = await ApiClient.dio.post(
        '/waivers/$leagueId/drop',
        data: {'teamId': teamId, 'playerId': playerId},
      );
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return res.data as Map<String, dynamic>;
      }
      return {'ok': false, 'message': 'Failed to drop player'};
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Failed to drop player')
          : 'Failed to drop player';
      return {'ok': false, 'message': msg};
    } catch (e) {
      return {'ok': false, 'message': 'Error: $e'};
    }
  }
}
