import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_draft_state.freezed.dart';
part 'league_draft_state.g.dart';

@freezed
class LeagueDraftState with _$LeagueDraftState {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LeagueDraftState({
    required String leagueId,
    required int currentPickNumber,
    required String currentTeamId,
    required int roundNumber,
    required DateTime pickDeadline,
    required String direction,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _LeagueDraftState;

  factory LeagueDraftState.fromJson(Map<String, dynamic> json) =>
      _$LeagueDraftStateFromJson(json);
}
