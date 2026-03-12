import 'package:sixers/backend/draft/appsync_draft_service.dart';
import 'draft_state_model.dart';

class DraftStateService {
  final _appsync = AppSyncDraftService();

  Future<DraftState?> fetch(String leagueId) {
    return _appsync.getDraftState(leagueId);
  }
}
