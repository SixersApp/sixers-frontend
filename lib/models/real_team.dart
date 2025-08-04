import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_team.freezed.dart';
part 'real_team.g.dart';

@freezed
class RealTeam with _$RealTeam {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RealTeam({
    required String id,
    required String tournamentId,
    required String name,
  }) = _RealTeam;

  factory RealTeam.fromJson(Map<String, dynamic> json) => _$RealTeamFromJson(json);
}
