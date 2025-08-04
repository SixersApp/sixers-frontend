import 'package:freezed_annotation/freezed_annotation.dart';
import 'tournament.dart';
import 'real_team.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Player({
    required String id,
    required String name,
    required Tournament tournaments,
    required RealTeam realTeams,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
