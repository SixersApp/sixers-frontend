// lib/draft_settings/draft_settings_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'draft_settings_model.dart' as model; // alias to avoid name clash
import 'draft_settings_service.dart';

part 'draft_settings_provider.g.dart';

/// One provider instance per league →
///     ref.watch(draftSettingsProvider(leagueId))
@riverpod
class DraftSettings extends _$DraftSettings {
  final _service = DraftSettingsService();

  /* ────────────────────────────────────────────────────────────
   * build  – called once per leagueId; first state is AsyncLoading()
   * ──────────────────────────────────────────────────────────── */
  @override
  Future<model.DraftSettings?> build(String leagueId) {
    return _service.fetch(leagueId);
  }

  /* ────────────────────────────────────────────────────────────
   * refresh  – re-query without flicker (keeps previous while loading)
   * ──────────────────────────────────────────────────────────── */
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.fetch(leagueId),
    ); // add a field
  }

  /* ────────────────────────────────────────────────────────────
   * updateSettings  – save to Supabase then refresh local state
   * ──────────────────────────────────────────────────────────── */
  Future<void> updateSettings(model.DraftSettings newSettings) async {
    await _service.update(newSettings);
    state = AsyncData(newSettings); // optimistic
  }
}
