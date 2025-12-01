import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'league_service.dart';
import 'league_model.dart';

part 'league_provider.g.dart';

@riverpod
class Leagues extends _$Leagues {
  @override
  Future<List<League>> build() async {
    final service = LeagueService();
    return await service.getLeagues();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = LeagueService();
      return await service.getLeagues();
    });
  }
}