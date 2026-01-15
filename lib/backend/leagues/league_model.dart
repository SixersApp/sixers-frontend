import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';

part 'league_model.freezed.dart';
part 'league_model.g.dart';

enum LeagueStatus {
  // ignore: constant_identifier_names
  draft_pending,
  // ignore: constant_identifier_names
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
sealed class DraftSettings with _$DraftSettings {
  const factory DraftSettings({
    @JsonKey(name: "time_per_pick") required int timePerPick,
    @JsonKey(name: "pick_warning_seconds") required int pickWarningSeconds,
    @JsonKey(name: "snake_draft") required bool snakeDraft,
  }) = _DraftSettings;

  factory DraftSettings.fromJson(Map<String, dynamic> json) =>
      _$DraftSettingsFromJson(json);
}

@freezed
sealed class League with _$League {
  const factory League({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "tournament_id") required String tournamentId,
    @JsonKey(name: "creator_id") required String creatorId,
    @JsonKey(name: "user_team_id", defaultValue: "")
    @Default("") String userTeamId,
    @LeagueStatusConverter()
    @JsonKey(name: "status")
    required LeagueStatus status,
    @JsonKey(name: "max_teams") required int maxTeams,
    @JsonKey(name: "join_code") required String joinCode,
    @JsonKey(name: "season_id") required String seasonId,
    @JsonKey(name: "latest_game") @Default(0) int latestGame,
    @JsonKey(name: "teams") required List<FantasyTeam> teams,
    @JsonKey(name: "tournament_abbr") required String? tournamentAbbr,
    @JsonKey(name: "season_year") required int seasonYear,
    @JsonKey(name: "draft_settings") DraftSettings? draftSettings,
    @JsonKey(name: "scoring_rules") @Default([]) List<LeagueScoringRule> scoringRules,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}
