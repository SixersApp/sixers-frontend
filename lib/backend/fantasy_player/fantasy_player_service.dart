import 'package:dio/dio.dart';
import 'package:sixers/utils/logger.dart';
import 'fantasy_player_model.dart';
import 'package:sixers/backend/auth/dio_client.dart';

class FantasyPlayerService {
  final Dio _dio = ApiClient.dio;

  Future<List<FantasyPlayer>> fetchFantasyPlayers(String ftiId) async {
    final res = await _dio.get("/fantasyTeamInstance/$ftiId/performances");

    final raw = res.data as List;

    logInfo(raw);

    return raw.map((e) => FantasyPlayer.fromJson(e)).toList();
  }
}