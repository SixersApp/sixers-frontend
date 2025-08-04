import 'package:freezed_annotation/freezed_annotation.dart';

part 'league.freezed.dart';
part 'league.g.dart';

@freezed
class League with _$League {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory League({
    required String id,
    required String name,
    required String tournamentId,
    required String creatorId,
    required String status,
    required int maxTeams,
    required DateTime createdAt,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}
