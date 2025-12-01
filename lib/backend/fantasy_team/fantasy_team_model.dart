import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_model.freezed.dart';
part 'fantasy_team_model.g.dart';

@freezed
sealed class FantasyTeam with _$FantasyTeam {
  const factory FantasyTeam({
    required String id,
    required String leagueId,
    required String userId,
    required String teamName,
    required int draftOrder,
    required String teamColor,
    required String teamIcon,
    required DateTime createdAt,
  }) = _FantasyTeam;

  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);
}