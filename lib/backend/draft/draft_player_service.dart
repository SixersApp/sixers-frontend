import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/utils/logger.dart';
import 'draft_player_model.dart';

class DraftPlayerService {
  final _dio = ApiClient.dio;

  Future<List<DraftPlayer>> fetchPlayers({
    required String leagueId,
    int limit = 50,
    int offset = 0,
  }) async {
    final res = await _dio.get(
      '/draft/players',
      queryParameters: {
        'leagueId': leagueId,
        'limit': limit,
        'offset': offset,
      },
    );

    if (res.statusCode == 200 && res.data is List && (res.data as List).isNotEmpty) {
      logInfo('Draft player sample keys: ${(res.data as List).first.keys}');
      logInfo('Draft player sample: ${(res.data as List).first}');
    }

    if (res.statusCode != 200 || res.data is! List) {
      logError('fetchDraftPlayers failed: ${res.statusCode}');
      throw Exception('Failed to fetch draft players');
    }

    return (res.data as List)
        .map((e) => DraftPlayer.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
