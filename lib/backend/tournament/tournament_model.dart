import 'package:json_annotation/json_annotation.dart';

part 'tournament_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tournament {
  final String id;
  final String name;
  final int season;
  final DateTime? startDate; // PG date
  final DateTime createdAt;
  final int numMatches; // smallint -> int in Dart

  const Tournament({
    required this.id,
    required this.name,
    required this.season,
    this.startDate,
    required this.createdAt,
    required this.numMatches,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}
