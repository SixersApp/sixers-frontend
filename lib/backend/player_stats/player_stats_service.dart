import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../auth/dio_client.dart';
import 'game_log_model.dart';
import 'player_stats_model.dart';

class PlayerStatsService {
  final _dio = ApiClient.dio;

  Future<PlayerStats?> getPlayerStats(String playerId) async {
    try {
      final res = await _dio.get('/players/$playerId/stats');
      if (res.statusCode != 200 || res.data is! Map) return null;
      return PlayerStats.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint('PlayerStats error [${e.response?.statusCode}]: ${e.response?.data}');
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<GameLogResponse?> getPlayerPerformances(String playerId, {String? leagueId}) async {
    try {
      final res = await _dio.get(
        '/players/$playerId/performances',
        queryParameters: {if (leagueId != null) 'leagueId': leagueId},
      );
      if (res.statusCode != 200 || res.data is! Map) return null;
      return GameLogResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint('PlayerPerformances error [${e.response?.statusCode}]: ${e.response?.data}');
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }
}
