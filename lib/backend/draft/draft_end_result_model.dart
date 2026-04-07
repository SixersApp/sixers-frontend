import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_end_result_model.freezed.dart';
part 'draft_end_result_model.g.dart';

@freezed
sealed class DraftEndResult with _$DraftEndResult {
  const factory DraftEndResult({
    required String leagueId,
    required String status,
  }) = _DraftEndResult;

  factory DraftEndResult.fromJson(Map<String, dynamic> json) =>
      _$DraftEndResultFromJson(json);
}
