
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'draft_settings_model.dart' as model; // alias to avoid name clash
import 'draft_settings_service.dart';

part 'draft_settings_provider.g.dart';


@riverpod
class DraftSettings extends _$DraftSettings {
  final _service = DraftSettingsService();

 
  @override
  Future<model.DraftSettings?> build(String leagueId) {
    return _service.fetch(leagueId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.fetch(leagueId),
    ); 
  }

  
  Future<void> updateSettings(model.DraftSettings newSettings) async {
    await _service.update(newSettings);
    state = AsyncData(newSettings);
  }
}
