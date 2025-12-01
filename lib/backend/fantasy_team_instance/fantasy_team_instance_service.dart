import 'package:dio/dio.dart';
import '../auth/dio_client.dart';
import 'fantasy_team_instance_model.dart';

class FantasyTeamInstanceService {
  final Dio _dio = ApiClient.dio; 

  /// Get instance by fantasy team ID + match number
  Future<FantasyTeamInstance?> getInstance({
    required String fantasyTeamId,
    required int matchNum,
  }) async {
    final res = await _dio.get(
      "/fantasy-team-instance",
      queryParameters: {
        "teamId": fantasyTeamId,
        "matchNum": matchNum,
      },
    );

    if (res.data == null) return null;

    return FantasyTeamInstance.fromJson(res.data);
  }
}