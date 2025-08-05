// lib/leagues/league_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_model.freezed.dart'; // 👈 required for Freezed
part 'league_model.g.dart'; // 👈 required for json_serializable

enum LeagueStatus { draft_pending, draft_in_progress, active, completed }

@freezed
sealed class League with _$League {
  const factory League({
    required String id,
    required String name,
    @JsonKey(name: 'tournament_id') required String tournamentId,
    @JsonKey(name: 'creator_id') required String creatorId,
    required LeagueStatus status,
    @JsonKey(name: 'max_teams') required int maxTeams,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}
