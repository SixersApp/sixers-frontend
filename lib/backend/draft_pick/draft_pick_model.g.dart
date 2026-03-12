// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftPick _$DraftPickFromJson(Map<String, dynamic> json) => _DraftPick(
  leagueId: json['leagueId'] as String,
  pickNumber: (json['pickNumber'] as num).toInt(),
  teamId: json['teamId'] as String,
  playerId: json['playerId'] as String,
  roundNumber: (json['roundNumber'] as num).toInt(),
  timestamp: json['timestamp'] as String?,
);

Map<String, dynamic> _$DraftPickToJson(_DraftPick instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'pickNumber': instance.pickNumber,
      'teamId': instance.teamId,
      'playerId': instance.playerId,
      'roundNumber': instance.roundNumber,
      'timestamp': instance.timestamp,
    };
