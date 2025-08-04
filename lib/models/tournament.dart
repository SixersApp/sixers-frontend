import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.freezed.dart';
part 'tournament.g.dart';

@freezed
class Tournament with _$Tournament {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Tournament({
    required String id,
    required String name,
    required int season,
    DateTime? startDate,
    required DateTime createdAt,
    required int numMatches,
  }) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(json);
}
