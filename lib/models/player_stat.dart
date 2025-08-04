import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stat.freezed.dart';
part 'player_stat.g.dart';

@freezed
class PlayerStat with _$PlayerStat {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PlayerStat({
    required String id,
    required String matchId,
    required String playerId,
    required int matchNum,
    required int runs,
    required int wickets,
    required int catches,
    required DateTime updatedAt,
  }) = _PlayerStat;

  factory PlayerStat.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatFromJson(json);
}
