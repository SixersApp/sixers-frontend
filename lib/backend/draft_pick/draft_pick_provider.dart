import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_pick_model.dart';

part 'draft_pick_provider.g.dart';

@riverpod
Future<List<DraftPick>> draftPicks(
  ref,
  String leagueId,
) async {
  final rows = await Supabase.instance.client
      .from('draft_picks')
      .select()
      .eq('league_id', leagueId)
      .order('pick_number');
  return (rows as List)
      .map((r) => DraftPick.fromJson(r as Map<String, dynamic>))
      .toList();
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
    ref.invalidate(draftPicksProvider(leagueId));
  }
}
