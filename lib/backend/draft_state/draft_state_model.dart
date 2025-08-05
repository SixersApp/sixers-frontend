import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_state_model.freezed.dart';
part 'draft_state_model.g.dart';

enum DraftDirection { forward, reverse }

@freezed
sealed class DraftState with _$DraftState {
  const factory DraftState({
    @JsonKey(name: 'league_id') required String leagueId,
    @JsonKey(name: 'current_pick_number') required int pickNumber,
    @JsonKey(name: 'current_team_id') required String currentTeamId,
    @JsonKey(name: 'round_number') required int roundNumber,
    @JsonKey(name: 'pick_deadline') required DateTime pickDeadline,
    required DraftDirection direction,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DraftState;

  factory DraftState.fromJson(Map<String, dynamic> json) =>
      _$DraftStateFromJson(json);
}
