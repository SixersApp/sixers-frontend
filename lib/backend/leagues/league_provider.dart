// lib/backend/leagues/league_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'league_model.dart';
import 'league_service.dart';
import '../auth/auth_provider.dart';

final leaguesProvider =
    AsyncNotifierProvider<LeaguesNotifier, List<League>>(LeaguesNotifier.new);

class LeaguesNotifier extends AsyncNotifier<List<League>> {
  late final LeagueService _service;

  @override
  Future<List<League>> build() async {
    _service = LeagueService();


    try {
      final leagues = await _service.getLeagues();
      return leagues;
    } catch (e, st) {
      // Optional: log for debugging
      // ignore: avoid_print
      print("Error loading leagues: $e\n$st");
      // Let Riverpod see the error so UI can show fallback
      throw e;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}