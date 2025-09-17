import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_pick_model.freezed.dart';
part 'draft_pick_model.g.dart';

@freezed
sealed class DraftPick with _$DraftPick {
  const factory DraftPick({
    @JsonKey(name: 'league_id') required String leagueId,
    @JsonKey(name: 'pick_number') required int pickNumber,
    @JsonKey(name: 'fantasy_team_id') required String teamId,
    @JsonKey(name: 'player_id') required String playerId,
    @JsonKey(name: 'pick_time') DateTime? pickTime,
  }) = _DraftPick;

  factory DraftPick.fromJson(Map<String, dynamic> json) => _$DraftPickFromJson(json);
}
