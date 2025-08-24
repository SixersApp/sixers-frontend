import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tournament_model.dart';
import 'tournament_service.dart';

part 'tournament_provider.g.dart';

@riverpod
class Tournaments extends _$Tournaments {
  final _service = TournamentService();

  @override
  Future<List<Tournament>> build() => _service.fetchAll();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _service.fetchAll());
  }
}
