import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/player_performance/player_performance_model.dart';
import 'package:sixers/backend/player_performance/player_performance_service.dart';

part 'player_performance_provider.g.dart';

@Riverpod(keepAlive: true)
PlayerPerformanceService playerPerformanceService(ref) {
  return PlayerPerformanceService();
}

@riverpod
class PlayerPerformanceController extends _$PlayerPerformanceController {
  @override
  Future<List<PlayerPerformance>> build(String ftiId) async {
    final service = ref.read(playerPerformanceServiceProvider);
    return service.fetchPerformances(ftiId);
  }

  Future<void> refresh() async {
    final service = ref.read(playerPerformanceServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => service.fetchPerformances(ftiId));
  }
}