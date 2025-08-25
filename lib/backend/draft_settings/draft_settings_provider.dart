
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

final draftSettingsActionsProvider = Provider<DraftSettingsActions>(
  (ref) => DraftSettingsActions(ref),
);

class DraftSettingsActions {
  DraftSettingsActions(this.ref);
  final ref;

  DraftSettingsService get _svc => ref.read(draftSettingsProvider);

  Future<void> setTimePerPick(String leagueId, int seconds) async {
    assert(seconds > 0);
    await _svc.updateTimePerPick(leagueId: leagueId, seconds: seconds);
    // refresh cached data so UI updates
    ref.invalidate(draftSettingsProvider(leagueId));
  }
}
