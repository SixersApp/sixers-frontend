// lib/backend/leagues/league_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../auth/auth_provider.dart';
import 'league_model.dart';
import 'league_service.dart';

part 'league_provider.g.dart';

@riverpod
class Leagues extends _$Leagues {
  @override
  Future<List<League>> build() async {
    // Wait for authentication to finish loading
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];

    final service = LeagueService();

    try {
      final leagues = await service.getLeagues();
      return leagues;
    } catch (e, st) {
      print("❌ Error loading leagues: $e\n$st");
      rethrow;
    }
  }

  /// Allows manual refreshing just like matchups
  Future<void> refresh() async {
    state = await AsyncValue.guard(() => build());
  }
}