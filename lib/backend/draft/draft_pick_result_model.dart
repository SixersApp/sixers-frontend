import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';

part 'draft_pick_result_model.freezed.dart';
part 'draft_pick_result_model.g.dart';

@freezed
sealed class DraftPickResult with _$DraftPickResult {
  const factory DraftPickResult({
    required DraftPick pick,
    String? leagueId,
    String? nextTeamId,
    String? nextPickExpiresAt,
  }) = _DraftPickResult;

  factory DraftPickResult.fromJson(Map<String, dynamic> json) =>
      _$DraftPickResultFromJson(json);
}
