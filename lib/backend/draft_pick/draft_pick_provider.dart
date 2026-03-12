import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_service.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'draft_pick_model.dart';

part 'draft_pick_provider.g.dart';

@riverpod
Future<List<DraftPick>> draftPicks(Ref ref, String leagueId) async {
  return DraftPickService().fetch(leagueId);
}

@riverpod
class DraftPickActions extends _$DraftPickActions {
  @override
  void build() {}

  Future<void> makePick({
    required String leagueId,
    required String teamId,
    required String playerId,
    required int roundNumber,
    required int pickNumber,
  }) async {
    await DraftPickService().makePick(
      leagueId: leagueId,
      teamId: teamId,
      playerId: playerId,
      roundNumber: roundNumber,
      pickNumber: pickNumber,
    );

    if (!ref.mounted) return;
    ref.invalidate(draftPicksProvider(leagueId));
    ref.invalidate(draftStateStreamProvider(leagueId));
  }
}
