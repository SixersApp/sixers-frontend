import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'draft_pick_model.dart';
import 'draft_pick_service.dart';

part 'draft_pick_provider.g.dart';

@riverpod
Stream<List<DraftPick>> draftPicksStream(ref, String leagueId) {
  // convert single-pick stream → continually growing list stream
  final service = DraftPickService();
  final controller = StreamController<List<DraftPick>>();
  final buffer = <DraftPick>[];

  // Ensure subscription is cleaned up
  final sub = service.stream(leagueId).listen((pick) {
    buffer.add(pick);
    buffer.sort((a, b) => a.pickNumber.compareTo(b.pickNumber));
    controller.add(List.unmodifiable(buffer));
  });

  // Emit an initial empty list so listeners don't remain in loading state
  controller.add(const []);

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
}

/// expose mutations
@riverpod
class DraftPickActions extends _$DraftPickActions {
  @override
  void build() {}

  Future<void> makePick({
    required String leagueId,
    required String teamId,
    required String playerId,
  }) async {
    await DraftPickService().makePick(
      leagueId: leagueId,
      teamId: teamId,
      playerId: playerId,
    );
    // force refresh for this league’s list (immediate feedback)
    ref.invalidate(draftPicksStreamProvider(leagueId));
  }
}
