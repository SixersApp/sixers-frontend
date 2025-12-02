// lib/backend/fantasy_matchup/matchup_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_provider.dart';
import 'matchup_model.dart';
import 'matchup_service.dart';

final userMatchupsProvider =
    FutureProvider.family<List<Matchup>, int>((ref, matchNum) async {
  // Wait for auth so ApiClient has token
  final auth = await ref.watch(authProviderProvider.future);
  if (auth == null) return [];

  final service = MatchupService();

  try {
    return await service.getUserMatchups(matchNum);
  } catch (e, st) {
    // ignore: avoid_print
    print("Error loading matchups for matchNum=$matchNum: $e\n$st");
    throw e;
  }
});