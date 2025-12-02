import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/player_performance/player_performance_model.dart';
import 'package:sixers/backend/player_performance/player_performance_service.dart';

part 'player_performance_provider.g.dart';

@riverpod
class PlayerPerformanceController extends _$PlayerPerformanceController {
  late final PlayerPerformanceService _service;

  @override
  Future<List<PlayerPerformance>> build(String ftiId) async {
    _service = PlayerPerformanceService();
    return _service.fetchPerformances(ftiId);
  }

  /// Optional manual refresh
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _service.fetchPerformances(ftiId));
  }
}