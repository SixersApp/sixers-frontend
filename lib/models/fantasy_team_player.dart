import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_player.freezed.dart';
part 'fantasy_team_player.g.dart';

@freezed
class FantasyTeamPlayer with _$FantasyTeamPlayer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FantasyTeamPlayer({
    required String leagueId,
    required String playerId,
    required DateTime pickedAt,
    required int fantasyScore,
    required String fantasyTeamInstanceId,
    required String id,
    int? positionOrder,
  }) = _FantasyTeamPlayer;

  factory FantasyTeamPlayer.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamPlayerFromJson(json);
}
