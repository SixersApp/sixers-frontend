// lib/backend/draft_state/draft_state_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';

/// Service provider (so we don't instantiate the service repeatedly)
final draftStateServiceProvider = Provider<DraftStateService>((ref) {
  return DraftStateService();
});

/// Stream that yields an initial snapshot (can be null) and then live updates.
/// Nullable so "no active draft yet" is a first-class state.
@Riverpod(keepAlive: true)
Stream<DraftState?> draftStateStream(ref, String leagueId) async* {
  final svc = DraftStateService();

  // 1) Emit current value immediately so the UI can render
  final initial = await svc.fetch(leagueId); // returns DraftState? (may be null)
  yield initial;

  // 2) Then pipe realtime updates
  await for (final s in svc.stream(leagueId)) {
    // Side effects when state changes
    ref.invalidate(draftPicksProvider(leagueId));
    ref.invalidate(leaguesProvider);
    yield s; // s is DraftState? already
  }
}
