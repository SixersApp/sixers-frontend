import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_service.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_pick_model.dart';

part 'draft_pick_provider.g.dart';

@riverpod
Future<List<DraftPick>> draftPicks(ref, String leagueId) async {
  final rows = await Supabase.instance.client.from('draft_picks').select().eq('league_id', leagueId).order('pick_number');
  return (rows as List).map((r) => DraftPick.fromJson(r as Map<String, dynamic>)).toList();
}

@riverpod
class DraftPickActions extends _$DraftPickActions {
  @override
  void build() {}

  Future<void> makePick({required String leagueId, required String teamId, required String playerId}) async {
    await DraftPickService().makePick(leagueId: leagueId, teamId: teamId, playerId: playerId);

    ref.invalidate(draftPicksProvider(leagueId));
    ref.invalidate(draftPicksStreamProvider(leagueId));
    // Also invalidate draft state since pick order changes
    ref.invalidate(draftStateStreamProvider(leagueId));
  }
}

// Live stream of picks for a league; emits the full list initially and on any change
final draftPicksStreamProvider = StreamProvider.family<List<DraftPick>, String>((ref, leagueId) {
  final client = Supabase.instance.client;
  final controller = StreamController<List<DraftPick>>.broadcast();

  Future<void> emitCurrent() async {
    try {
      final list = await DraftPickService().fetch(leagueId);
      controller.add(list);
    } catch (e) {
      print('Error fetching draft picks: $e');
    }
  }

  // Create a unique channel name for this league
  final channelName = 'draft_picks_$leagueId';

  final channel = client.channel(channelName);

  // Listen to all changes on the draft_picks table
  channel.onPostgresChanges(
    event: PostgresChangeEvent.all,
    schema: 'public',
    table: 'draft_picks',
    callback: (payload) {
      // Check if the change affects this league
      if (payload.newRecord != null && payload.newRecord['league_id'] == leagueId) {
        emitCurrent();
      } else if (payload.oldRecord != null && payload.oldRecord['league_id'] == leagueId) {
        emitCurrent();
      }
    },
  );

  channel.subscribe();

  controller
    ..onListen = () {
      emitCurrent();
    };

  ref.onDispose(() {
    client.removeChannel(channel);
    controller.close();
  });

  return controller.stream;
});
