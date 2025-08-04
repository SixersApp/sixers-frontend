import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_draft_setting.freezed.dart';
part 'league_draft_setting.g.dart';

@freezed
class LeagueDraftSetting with _$LeagueDraftSetting {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LeagueDraftSetting({
    required String leagueId,
    required int timePerPick,
    required bool autoPickEnabled,
    int? pickWarningSeconds,
    bool? snakeDraft,
    DateTime? createdAt,
  }) = _LeagueDraftSetting;

  factory LeagueDraftSetting.fromJson(Map<String, dynamic> json) =>
      _$LeagueDraftSettingFromJson(json);
}
