// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftState _$DraftStateFromJson(Map<String, dynamic> json) => _DraftState(
  leagueId: json['leagueId'] as String,
  currentTeamId: json['currentTeamId'] as String,
  currentRound: (json['currentRound'] as num).toInt(),
  currentPick: (json['currentPick'] as num).toInt(),
  pickExpiresAt: json['pickExpiresAt'] as String,
  status: json['status'] as String,
  picks:
      (json['picks'] as List<dynamic>?)
          ?.map((e) => DraftPick.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DraftStateToJson(_DraftState instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'currentTeamId': instance.currentTeamId,
      'currentRound': instance.currentRound,
      'currentPick': instance.currentPick,
      'pickExpiresAt': instance.pickExpiresAt,
      'status': instance.status,
      'picks': instance.picks,
    };
