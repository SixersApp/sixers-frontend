// lib/draft_state/draft_state_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'draft_state_model.dart';
import 'draft_state_service.dart';

part 'draft_state_provider.g.dart';

@riverpod
Stream<DraftState> draftStateStream(ref, String leagueId) {
  return DraftStateService().stream(leagueId);
}
