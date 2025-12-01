import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_model.freezed.dart';
part 'league_model.g.dart';

enum LeagueStatus {
  draft_pending,
  draft_in_progress,
  active,
  completed,
  unknown;

  static LeagueStatus fromString(String value) {
    final v = value.toLowerCase();

    switch (v) {
      case 'draft_pending':
        return LeagueStatus.draft_pending;
      case 'draft_in_progress':
        return LeagueStatus.draft_in_progress;
      case 'active':
        return LeagueStatus.active;
      case 'completed':
        return LeagueStatus.completed;
      default:
        return LeagueStatus.unknown;
    }
  }
}

class LeagueStatusConverter implements JsonConverter<LeagueStatus, String> {
  const LeagueStatusConverter();

  @override
  LeagueStatus fromJson(String json) => LeagueStatus.fromString(json);

  @override
  String toJson(LeagueStatus object) => object.name;
}

@freezed
sealed class League with _$League {
  const factory League({
    required String id,
    required String name,
    @JsonKey(name: "tournament_id") required String tournamentId,
    @JsonKey(name: "creator_id") required String creatorId,
    @LeagueStatusConverter()
    @JsonKey(name: "status")
    required LeagueStatus status,
    @JsonKey(name: "max_teams") required int maxTeams,
    @JsonKey(name: "join_code") required String joinCode,
    @JsonKey(name: "season_id") required String seasonId,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);
}