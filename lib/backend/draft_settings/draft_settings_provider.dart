// lib/backend/draft_settings/draft_settings_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'draft_settings_model.dart' as model; // alias to avoid name clash
import 'draft_settings_service.dart';

part 'draft_settings_provider.g.dart';


final draftSettingsServiceProvider = Provider<DraftSettingsService>(
  (ref) => DraftSettingsService(),
);


@riverpod
class DraftSettings extends _$DraftSettings {
  @override
  Future<model.DraftSettings?> build(String leagueId) async {
    final svc = ref.read(draftSettingsServiceProvider);
    return svc.fetch(leagueId);
  }

  Future<void> refresh() async {
    final svc = ref.read(draftSettingsServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => svc.fetch(leagueId));
  }

  Future<void> updateSettings(model.DraftSettings newSettings) async {
    final svc = ref.read(draftSettingsServiceProvider);
    await svc.update(newSettings);
    state = AsyncData(newSettings);
  }
}


final draftSettingsActionsProvider = Provider<DraftSettingsActions>(
  (ref) => DraftSettingsActions(ref),
);

class DraftSettingsActions {
  DraftSettingsActions(this.ref);
  final Ref ref;

  DraftSettingsService get _svc => ref.read(draftSettingsServiceProvider);


  Future<void> setTimePerPick(String leagueId, int seconds) async {
    assert(seconds > 0);
    await _svc.updateTimePerPick(leagueId: leagueId, seconds: seconds);
    // Refresh cached data so UI updates
    ref.invalidate(draftSettingsProvider(leagueId));

  }
}
