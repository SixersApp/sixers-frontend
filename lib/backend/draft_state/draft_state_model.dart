import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';

part 'draft_state_model.freezed.dart';
part 'draft_state_model.g.dart';

@freezed
sealed class DraftState with _$DraftState {
  const factory DraftState({
    required String leagueId,
    required String currentTeamId,
    required int currentRound,
    required int currentPick,
    required String pickExpiresAt,
    required String status,
    @Default([]) List<DraftPick> picks,
  }) = _DraftState;

  factory DraftState.fromJson(Map<String, dynamic> json) =>
      _$DraftStateFromJson(json);

  /// Parse from GraphQL camelCase response.
  factory DraftState.fromGraphQL(Map<String, dynamic> json) => DraftState(
        leagueId: json['leagueId'] as String,
        currentTeamId: json['currentTeamId'] as String,
        currentRound: json['currentRound'] as int,
        currentPick: json['currentPick'] as int,
        pickExpiresAt: json['pickExpiresAt'] as String,
        status: json['status'] as String,
        picks: (json['picks'] as List<dynamic>?)
                ?.map(
                    (p) => DraftPick.fromGraphQL(p as Map<String, dynamic>))
                .toList() ??
            [],
      );
}
