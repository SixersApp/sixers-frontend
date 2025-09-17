import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_team_model.freezed.dart';
part 'real_team_model.g.dart';

@freezed
sealed class RealTeam with _$RealTeam {
  const factory RealTeam({
    required String id,
    @JsonKey(name: 'tournament_id') required String tournamentId,
    required String name,
  }) = _RealTeam;

  factory RealTeam.fromJson(Map<String, dynamic> json) => _$RealTeamFromJson(json);
}
