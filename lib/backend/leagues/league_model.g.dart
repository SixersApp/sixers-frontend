// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftSettings _$DraftSettingsFromJson(Map<String, dynamic> json) =>
    _DraftSettings(
      timePerPick: (json['time_per_pick'] as num).toInt(),
      pickWarningSeconds: (json['pick_warning_seconds'] as num).toInt(),
      snakeDraft: json['snake_draft'] as bool,
    );

Map<String, dynamic> _$DraftSettingsToJson(_DraftSettings instance) =>
    <String, dynamic>{
      'time_per_pick': instance.timePerPick,
      'pick_warning_seconds': instance.pickWarningSeconds,
      'snake_draft': instance.snakeDraft,
    };

_League _$LeagueFromJson(Map<String, dynamic> json) => _League(
  id: json['id'] as String,
  name: json['name'] as String,
  tournamentId: json['tournament_id'] as String,
  creatorId: json['creator_id'] as String,
  userTeamId: json['user_team_id'] as String? ?? '',
  status: const LeagueStatusConverter().fromJson(json['status'] as String),
  maxTeams: (json['max_teams'] as num).toInt(),
  joinCode: json['join_code'] as String,
  seasonId: json['season_id'] as String,
  latestGame: (json['latest_game'] as num?)?.toInt() ?? 0,
  teams: (json['teams'] as List<dynamic>)
      .map((e) => FantasyTeam.fromJson(e as Map<String, dynamic>))
      .toList(),
  tournamentAbbr: json['tournament_abbr'] as String?,
  seasonYear: (json['season_year'] as num).toInt(),
  draftSettings: json['draft_settings'] == null
      ? null
      : DraftSettings.fromJson(json['draft_settings'] as Map<String, dynamic>),
  scoringRules:
      (json['scoring_rules'] as List<dynamic>?)
          ?.map((e) => LeagueScoringRule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LeagueToJson(_League instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tournament_id': instance.tournamentId,
  'creator_id': instance.creatorId,
  'user_team_id': instance.userTeamId,
  'status': const LeagueStatusConverter().toJson(instance.status),
  'max_teams': instance.maxTeams,
  'join_code': instance.joinCode,
  'season_id': instance.seasonId,
  'latest_game': instance.latestGame,
  'teams': instance.teams,
  'tournament_abbr': instance.tournamentAbbr,
  'season_year': instance.seasonYear,
  'draft_settings': instance.draftSettings,
  'scoring_rules': instance.scoringRules,
};
