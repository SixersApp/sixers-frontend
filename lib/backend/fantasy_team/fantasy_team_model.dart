import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_model.freezed.dart';
part 'fantasy_team_model.g.dart';

@freezed
sealed class FantasyTeam with _$FantasyTeam {
  const factory FantasyTeam({
    @JsonKey(name: "id")
    required String id,

    @JsonKey(name: "league_id")
    required String leagueId,

    @JsonKey(name: "user_id")
    required String userId,

    @JsonKey(name: "team_name")
    required String teamName,

    @JsonKey(name: "user_name")
    String? userName,

    // ❗ These can be null in your API → MUST be nullable
    @JsonKey(name: "draft_order")
    int? draftOrder,

    @JsonKey(name: "team_color")
    String? teamColor,

    @JsonKey(name: "team_icon")
    String? teamIcon,

    @JsonKey(name: "created_at")
    String? createdAt,
  }) = _FantasyTeam;

  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);
}