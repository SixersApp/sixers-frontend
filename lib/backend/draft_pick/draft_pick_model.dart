import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_pick_model.freezed.dart';
part 'draft_pick_model.g.dart';

@freezed
sealed class DraftPick with _$DraftPick {
  const factory DraftPick({
    required String leagueId,
    required int pickNumber,
    required String teamId,
    required String playerId,
    required int roundNumber,
    String? timestamp,
  }) = _DraftPick;

  factory DraftPick.fromJson(Map<String, dynamic> json) =>
      _$DraftPickFromJson(json);

  /// Parse from GraphQL camelCase or Supabase snake_case responses.
  factory DraftPick.fromGraphQL(Map<String, dynamic> json) => DraftPick(
        leagueId: json['leagueId'] as String,
        pickNumber: json['pickNumber'] as int,
        teamId: json['teamId'] as String,
        playerId: json['playerId'] as String,
        roundNumber: json['roundNumber'] as int,
        timestamp: json['timestamp'] as String?,
      );
}
