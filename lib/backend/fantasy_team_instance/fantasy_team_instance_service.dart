import '../auth/dio_client.dart';
import 'fantasy_team_instance_model.dart';

class FantasyTeamInstanceService {
  Future<FantasyTeamInstance?> getInstance({
    required String fantasyTeamId,
    required int matchNum,
  }) async {
    final res = await ApiClient.dio.get(
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