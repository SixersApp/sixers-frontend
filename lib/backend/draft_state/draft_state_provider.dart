
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';

@riverpod
Stream<DraftState> draftStateStream( ref, String leagueId) {

  return DraftStateService()
      .stream(leagueId)
      .map((s) {
        ref.invalidate(draftPicksProvider(leagueId));
        ref.invalidate(leaguesProvider);
        return s;
      });
}


