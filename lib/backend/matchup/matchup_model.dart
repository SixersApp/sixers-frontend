import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';

part 'matchup_model.freezed.dart';
part 'matchup_model.g.dart';

@freezed
sealed class Matchup with _$Matchup {
  const factory Matchup({
    required String id,
    @JsonKey(name: 'league_id') required String leagueId,
    @JsonKey(name: 'match_num') required int matchNum,
    @JsonKey(name: 'scheduled_time') DateTime? scheduledTime,
    @JsonKey(name: 'team1_score') double? team1Score,
    @JsonKey(name: 'team2_score') double? team2Score,
    @JsonKey(name: 'winner_team_id') String? winnerTeamId,
    @JsonKey(name: 'created_at') DateTime? createdAt,

    /// Supabase deep-select returns nested objects keyed as `team1` and `team2`.
    /// Those map to the FantasyTeamInstance model below.
    @JsonKey(name: 'team1') FantasyTeamInstance? team1,
    @JsonKey(name: 'team2') FantasyTeamInstance? team2,
  }) = _Matchup;

  factory Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);
}

@freezed
sealed class FantasyTeamInstance with _$FantasyTeamInstance {
  const factory FantasyTeamInstance({
    required String id,

    /// This is the FK to the underlying fantasy team row
    @JsonKey(name: 'fantasy_team_id') required String fantasyTeamId,
    @JsonKey(name: 'is_locked') bool? isLocked,
    @JsonKey(name: 'created_at') DateTime? createdAt,

    /// Supabase uses `fantasy_team` for the nested team object in our deep-select
    @JsonKey(name: 'fantasy_team') FantasyTeam? fantasyTeam,
  }) = _FantasyTeamInstance;

  factory FantasyTeamInstance.fromJson(Map<String, dynamic> json) => _$FantasyTeamInstanceFromJson(json);
}
