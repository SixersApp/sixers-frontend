import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_pick.freezed.dart';
part 'draft_pick.g.dart';

@freezed
class DraftPick with _$DraftPick {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DraftPick({
    required String leagueId,
    required int pickNumber,
    required String fantasyTeamId,
    required String playerId,
    required DateTime pickTime,
  }) = _DraftPick;

  factory DraftPick.fromJson(Map<String, dynamic> json) => _$DraftPickFromJson(json);
}
