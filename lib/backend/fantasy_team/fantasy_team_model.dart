
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_model.freezed.dart';
part 'fantasy_team_model.g.dart';

@freezed
sealed class FantasyTeam with _$FantasyTeam {
  const factory FantasyTeam({
    required String id,
    @JsonKey(name: 'league_id') required String leagueId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'team_name') required String teamName,
    @JsonKey(name: 'aka_name') required String akaName,
    @JsonKey(name: 'draft_order') int? draftOrder,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _FantasyTeam;

  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);
}
