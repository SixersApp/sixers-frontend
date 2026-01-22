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

  Future<List<FantasyTeamInstance>> getAllInstances({required String fantasy_team_id}) async {
    logInfo('Fetching all instances for team $fantasy_team_id');
    
    try {
      final res = await ApiClient.dio.get("/fantasy-team-instance/$fantasy_team_id/all");

      if (res.statusCode != 200 || res.data is! List) {
        logInfo('No instances found, returning empty list');
        return [];
      }

      logInfo('Loaded ${(res.data as List).length} team instances');

      return (res.data as List)
          .map((e) => FantasyTeamInstance.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logError('Get all team instances error: $e');
      return [];
    }
  }
}
