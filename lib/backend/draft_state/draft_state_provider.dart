
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';


final draftStateServiceProvider = Provider<DraftStateService>((ref) {
  return DraftStateService();
});

@Riverpod(keepAlive: true)
Stream<DraftState?> draftStateStream(ref, String leagueId) async* {
  final svc = DraftStateService();

  final initial = await svc.fetch(leagueId); 
  yield initial;


  await for (final s in svc.stream(leagueId)) {
  
    ref.invalidate(draftPicksProvider(leagueId));
    ref.invalidate(leaguesProvider);
    yield s; 
  }
}
