// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftPick _$DraftPickFromJson(Map<String, dynamic> json) => _DraftPick(
  leagueId: json['league_id'] as String,
  pickNumber: (json['pick_number'] as num).toInt(),
  teamId: json['fantasy_team_id'] as String,
  playerId: json['player_id'] as String,
  pickTime: json['pick_time'] == null
      ? null
      : DateTime.parse(json['pick_time'] as String),
);

Map<String, dynamic> _$DraftPickToJson(_DraftPick instance) =>
    <String, dynamic>{
      'league_id': instance.leagueId,
      'pick_number': instance.pickNumber,
      'fantasy_team_id': instance.teamId,
      'player_id': instance.playerId,
      'pick_time': instance.pickTime?.toIso8601String(),
    };
