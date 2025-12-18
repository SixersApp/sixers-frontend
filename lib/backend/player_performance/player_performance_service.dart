import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/player_performance/player_performance_model.dart';

class PlayerPerformanceService {
  Future<List<PlayerPerformance>> fetchPerformances(String ftiId) async {
    final response = await ApiClient.dio.get(
      "/fantasyTeamInstance/performances/$ftiId",
    );

    final data = response.data;

    if (data is! List) return [];

    return data
        .map((json) => PlayerPerformance.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
