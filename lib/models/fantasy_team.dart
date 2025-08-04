import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team.freezed.dart';
part 'fantasy_team.g.dart';

@freezed
class FantasyTeam with _$FantasyTeam {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FantasyTeam({
    required String id,
    required String leagueId,
    required String userId,
    required String teamName,
    int? draftOrder,
    required DateTime createdAt,
  }) = _FantasyTeam;

  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);
}
