import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_start_result_model.freezed.dart';
part 'draft_start_result_model.g.dart';

@freezed
sealed class DraftOrderEntry with _$DraftOrderEntry {
  const factory DraftOrderEntry({
    required String teamId,
    required int order,
  }) = _DraftOrderEntry;

  factory DraftOrderEntry.fromJson(Map<String, dynamic> json) =>
      _$DraftOrderEntryFromJson(json);
}

@freezed
sealed class DraftStartResult with _$DraftStartResult {
  const factory DraftStartResult({
    required String leagueId,
    required String currentTeamId,
    required int currentRound,
    required int currentPick,
    required String pickExpiresAt,
    required List<DraftOrderEntry> draftOrder,
  }) = _DraftStartResult;

  factory DraftStartResult.fromJson(Map<String, dynamic> json) =>
      _$DraftStartResultFromJson(json);
}
