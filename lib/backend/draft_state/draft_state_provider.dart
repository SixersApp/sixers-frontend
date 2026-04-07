import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft/appsync_draft_service.dart';
import 'package:sixers/backend/draft/draft_end_result_model.dart';
import 'package:sixers/backend/draft/draft_pick_result_model.dart';
import 'package:sixers/backend/draft/draft_player_provider.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/utils/logger.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';

final draftStateServiceProvider = Provider<DraftStateService>((ref) {
  return DraftStateService();
});

@Riverpod(keepAlive: true)
Stream<DraftState?> draftStateStream(Ref ref, String leagueId) async* {
  final svc = DraftStateService();
  final appsync = AppSyncDraftService();

  final initial = await svc.fetch(leagueId);
  yield initial;

  // Merge onDraftPick and onDraftEnd into a single event stream.
  final controller = StreamController<_DraftEvent>();

  final pickSub = appsync.onDraftPick(leagueId).listen(
    (result) => controller.add(_PickEvent(result)),
    onError: (e) => controller.addError(e),
  );

  final endSub = appsync.onDraftEnd(leagueId).listen(
    (result) => controller.add(_EndEvent(result)),
    onError: (e) => controller.addError(e),
  );

  ref.onDispose(() {
    pickSub.cancel();
    endSub.cancel();
    controller.close();
  });

  await for (final event in controller.stream) {
    switch (event) {
      case _PickEvent(result: final pickResult):
        ref.invalidate(draftPicksProvider(leagueId));
        ref.invalidate(leaguesProvider);

        // If the drafted player isn't in our local list, fetch more players
        final playersState = ref.read(draftPlayersProvider(leagueId));
        final knownIds = playersState.players.map((p) => p.id).toSet();
        if (!knownIds.contains(pickResult.pick.playerId)) {
          ref.read(draftPlayersProvider(leagueId).notifier).fetchNextPage();
        }

        // Re-fetch the full draft state after each pick event
        final updated = await svc.fetch(leagueId);

        // If no next team, the draft is finishing — show finalizing state
        if (pickResult.nextTeamId == null ||
            pickResult.nextPickExpiresAt == null) {
          // logInfo('Last pick detected for league $leagueId — finalizing');
          if (updated != null) {
            yield updated.copyWith(status: 'finalizing');
          } else {
            yield initial?.copyWith(status: 'finalizing');
          }
        } else {
          yield updated;
        }

      case _EndEvent():
        // logInfo('Draft ended for league $leagueId');
        // Update the local league status to active
        final leaguesNotifier = ref.read(leaguesProvider.notifier);
        final leagues = ref.read(leaguesProvider).whenOrNull(
              data: (l) => l,
            ) ??
            [];
        final match = leagues.where((l) => l.id == leagueId);
        if (match.isNotEmpty) {
          leaguesNotifier.updateLeague(
            match.first.copyWith(status: LeagueStatus.active),
          );
        }

        // Fetch matchups now that the draft is over
        ref.invalidate(userMatchupsProvider);

        // Yield a completed state
        final finalState = await svc.fetch(leagueId);
        yield finalState?.copyWith(status: 'completed') ??
            initial?.copyWith(status: 'completed');
    }
  }
}

// Internal event types for merging the two subscription streams.
sealed class _DraftEvent {}

class _PickEvent extends _DraftEvent {
  final DraftPickResult result;
  _PickEvent(this.result);
}

class _EndEvent extends _DraftEvent {
  final DraftEndResult result;
  _EndEvent(this.result);
}
