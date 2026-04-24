import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/utils/logger.dart';
import 'available_player_model.dart';

class AvailablePlayerService {
  final _dio = ApiClient.dio;

  Future<List<AvailablePlayer>> fetchAvailablePlayers({
    required String leagueId,
    int limit = 50,
    int offset = 0,
  }) async {
    final res = await _dio.get(
      '/draft/players/available',
      queryParameters: {
        'leagueId': leagueId,
        'limit': limit,
        'offset': offset,
      },
    );

    if (res.statusCode != 200 || res.data is! List) {
      logError('fetchAvailablePlayers failed: ${res.statusCode}');
      throw Exception('Failed to fetch available players');
    }

    return (res.data as List)
        .map((e) => AvailablePlayer.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
