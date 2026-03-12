import 'package:sixers/backend/draft/appsync_draft_service.dart';
import 'draft_pick_model.dart';

class DraftPickService {
  final _appsync = AppSyncDraftService();

  Future<List<DraftPick>> fetch(String leagueId) {
    return _appsync.getDraftPicks(leagueId);
  }

  Future<void> makePick({
    required String leagueId,
    required String teamId,
    required String playerId,
    required int roundNumber,
    required int pickNumber,
  }) {
    return _appsync.postDraftPick(
      teamId: teamId,
      playerId: playerId,
      roundNumber: roundNumber,
      pickNumber: pickNumber,
      leagueId: leagueId,
    );
  }
}
