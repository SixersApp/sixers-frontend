import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';

@riverpod
Stream<DraftState> draftStateStream(ref, String leagueId) {
  return DraftStateService().stream(leagueId).map((s) {
    ref.invalidate(draftPicksProvider(leagueId));
    ref.invalidate(leaguesProvider);
    // Invalidate players provider for this league's tournament
    // We need to get the league to find the tournament ID
    // Note: We can't easily get the tournament ID here since we don't have access to the league data
    // The players will be invalidated when the UI rebuilds and watches the league provider
    return s;
  });
}
