import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_model.freezed.dart';
part 'fantasy_team_model.g.dart';

/// Postgres `numeric` columns are serialized as JSON strings by the pg driver,
/// while plain integers come through as numbers. These converters accept either
/// form so we don't silently break when a value is non-zero.
class _NumericToDouble implements JsonConverter<double, Object> {
  const _NumericToDouble();

  @override
  double fromJson(Object json) {
    if (json is num) return json.toDouble();
    return double.parse(json as String);
  }

  @override
  Object toJson(double object) => object;
}

class _NumericToNullableDouble implements JsonConverter<double?, Object?> {
  const _NumericToNullableDouble();

  @override
  double? fromJson(Object? json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    return double.tryParse(json as String);
  }

  @override
  Object? toJson(double? object) => object;
}

@freezed
sealed class MatchScore with _$MatchScore {
  const factory MatchScore({
    @JsonKey(name: "match_num") required int matchNum,
    // pg `numeric` → string; parse either form.
    @_NumericToDouble() @JsonKey(name: "points") required double points,
  }) = _MatchScore;

  factory MatchScore.fromJson(Map<String, dynamic> json) =>
      _$MatchScoreFromJson(json);
}

@freezed
sealed class FantasyTeam with _$FantasyTeam {
  const factory FantasyTeam({
    @JsonKey(name: "id")
    required String id,

    @JsonKey(name: "league_id")
    required String leagueId,

    @JsonKey(name: "user_id")
    required String userId,

    @JsonKey(name: "team_name")
    required String teamName,

    @JsonKey(name: "user_name")
    String? userName,

    // ❗ These can be null in your API → MUST be nullable
    @JsonKey(name: "draft_order")
    int? draftOrder,

    @JsonKey(name: "team_color")
    String? teamColor,

    @JsonKey(name: "team_icon")
    String? teamIcon,

    @JsonKey(name: "abbreviation")
    String? teamAbbreviation,

    @JsonKey(name: "created_at")
    String? createdAt,

    // Leaderboard fields — a *superset* present only on GET /leagues/:leagueId.
    // The list endpoint (GET /leagues) omits them, so they stay nullable on this
    // shared type; the league screen merges the real values in from the detail
    // endpoint, where they are always present.
    @JsonKey(name: "wins") int? wins,
    @JsonKey(name: "losses") int? losses,
    @JsonKey(name: "matches_completed") int? matchesCompleted,
    // pg `numeric` → string; parse either form.
    @_NumericToNullableDouble()
    @JsonKey(name: "avg_points_per_game")
    double? avgPointsPerGame,
    @JsonKey(name: "match_scores") List<MatchScore>? matchScores,
  }) = _FantasyTeam;

  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);
}
