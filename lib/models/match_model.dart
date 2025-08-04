import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MatchModel({
    required String id,
    required String tournamentId,
    required String realTeam1Id,
    required String realTeam2Id,
    DateTime? startTime,
    required String status,
    String? streamingUrl,
    required DateTime createdAt,
    int? matchNumber,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
