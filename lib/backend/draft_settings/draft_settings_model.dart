import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_settings_model.freezed.dart';
part 'draft_settings_model.g.dart';

@freezed
sealed class DraftSettings with _$DraftSettings {
  const factory DraftSettings({
    @JsonKey(name: 'league_id') required String leagueId,
    @JsonKey(name: 'time_per_pick') required int timePerPick,
    @JsonKey(name: 'auto_pick_enabled') required bool autoPickEnabled,
    @JsonKey(name: 'pick_warning_seconds') int? pickWarningSeconds,
    @JsonKey(name: 'snake_draft') bool? snakeDraft,
  }) = _DraftSettings;

  factory DraftSettings.fromJson(Map<String, dynamic> json) =>
      _$DraftSettingsFromJson(json);
}
