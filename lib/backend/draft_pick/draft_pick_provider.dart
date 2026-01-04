import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_service.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_pick_model.dart';

part 'draft_pick_provider.g.dart';

@riverpod
Future<List<DraftPick>> draftPicks(WidgetRef ref, String leagueId) async {
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
    // Also invalidate draft state since pick order changes
    ref.invalidate(draftStateStreamProvider(leagueId));
  }
}
