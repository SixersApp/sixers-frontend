import 'package:sixers/utils/logger.dart';
import '../auth/dio_client.dart';
import 'fantasy_team_instance_model.dart';

class FantasyTeamInstanceService {
  Future<FantasyTeamInstance?> getInstance({required String fantasy_team_id, required int match_num}) async {
    final res = await ApiClient.dio.get(
      "/fantasy-team-instance",
      queryParameters: {"teamId": fantasy_team_id, "match_num": match_num},
    );

    if (res.data == null) return null;
    logDebug(res.data);
    return FantasyTeamInstance.fromJson(res.data);
  }
}
