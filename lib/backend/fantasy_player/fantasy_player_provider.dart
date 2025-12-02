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
    return _service.fetchFantasyPlayers(ftiId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _service.fetchFantasyPlayers(ftiId));
  }
}