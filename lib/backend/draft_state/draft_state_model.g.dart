// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftState _$DraftStateFromJson(Map<String, dynamic> json) => _DraftState(
  leagueId: json['league_id'] as String,
  pickNumber: (json['current_pick_number'] as num).toInt(),
  currentTeamId: json['current_team_id'] as String,
  roundNumber: (json['round_number'] as num).toInt(),
  pickDeadline: DateTime.parse(json['pick_deadline'] as String),
  direction: $enumDecode(_$DraftDirectionEnumMap, json['direction']),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DraftStateToJson(_DraftState instance) =>
    <String, dynamic>{
      'league_id': instance.leagueId,
      'current_pick_number': instance.pickNumber,
      'current_team_id': instance.currentTeamId,
      'round_number': instance.roundNumber,
      'pick_deadline': instance.pickDeadline.toIso8601String(),
      'direction': _$DraftDirectionEnumMap[instance.direction]!,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$DraftDirectionEnumMap = {
  DraftDirection.forward: 'forward',
  DraftDirection.reverse: 'reverse',
};
