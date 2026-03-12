import 'package:dio/dio.dart';
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

      return (res.data as List).map((e) => FantasyTeamInstance.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      logError('Get all team instances error: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> swapSlots({required String ftiId, required String slot1, required String slot2}) async {
    try {
      logInfo('Swapping slots $slot1 and $slot2 for instance $ftiId');

      final res = await ApiClient.dio.post("/fantasy-team-instance/$ftiId/swap-slots", data: {"slot1": slot1, "slot2": slot2});

      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        logInfo('Swap successful');
        return res.data as Map<String, dynamic>;
      } else {
        logError('Swap failed with status ${res.statusCode}');
        return {"ok": false, "message": "Failed to swap slots"};
      }
    } catch (e) {
      logError('Swap slots error: $e');
      return {"ok": false, "message": "Error swapping slots: $e"};
    }
  }

  Future<Map<String, dynamic>> updateCaptains({required String ftiId, required String captain, required String viceCaptain}) async {
    try {
      logInfo('Updating captains for instance $ftiId: captain=$captain, viceCaptain=$viceCaptain');

      final res = await ApiClient.dio.patch("/fantasy-team-instance/$ftiId/captains", data: {"captain": captain, "vice_captain": viceCaptain});

      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        logInfo('Captains updated successfully');
        return {"ok": true, ...res.data as Map<String, dynamic>};
      } else {
        logError('Update captains failed with status ${res.statusCode}');
        return {"ok": false, "message": "Failed to update captains"};
      }
    } on DioException catch (e) {
      logError('Update captains dio error: ${e.response?.data ?? e.message}');
      final errorMessage = e.response?.data is Map ? (e.response!.data['message'] ?? 'Failed to update captains') : 'Failed to update captains';
      return {"ok": false, "message": errorMessage};
    } catch (e) {
      logError('Update captains error: $e');
      return {"ok": false, "message": "Error updating captains"};
    }
  }
}
