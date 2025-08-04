import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_instance.freezed.dart';
part 'fantasy_team_instance.g.dart';

@freezed
class FantasyTeamInstance with _$FantasyTeamInstance {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FantasyTeamInstance({
    required int matchNum,
    required String fantasyTeamId,
    required String id,
  }) = _FantasyTeamInstance;

  factory FantasyTeamInstance.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamInstanceFromJson(json);
}
