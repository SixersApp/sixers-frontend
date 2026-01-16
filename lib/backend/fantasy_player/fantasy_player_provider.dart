import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'fantasy_player_service.dart';
import 'fantasy_player_model.dart';

part 'fantasy_player_provider.g.dart';

@riverpod
class FantasyPlayerController extends _$FantasyPlayerController {
  late FantasyPlayerService _service;

  @override
  Future<List<FantasyPlayer>> build(String ftiId) async {
    _service = FantasyPlayerService();

    // Auto refresh
    final timer = Timer.periodic(const Duration(seconds: 5), (_) {
      refresh();
    });
    ref.onDispose(() => timer.cancel());

    return _service.fetchFantasyPlayers(ftiId);
  }

  Future<void> refresh() async {

    final newState = await AsyncValue.guard(() {
      return _service.fetchFantasyPlayers(ftiId);
    });

    state = newState;
  }
}