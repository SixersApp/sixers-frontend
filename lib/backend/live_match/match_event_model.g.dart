// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PerformanceDelta _$PerformanceDeltaFromJson(Map<String, dynamic> json) =>
    _PerformanceDelta(
      playerId: json['player_id'] as String,
      changes: Map<String, int>.from(json['changes'] as Map),
      notOut: json['not_out'] as bool?,
    );

Map<String, dynamic> _$PerformanceDeltaToJson(_PerformanceDelta instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'changes': instance.changes,
      'not_out': instance.notOut,
    };

_MatchEvent _$MatchEventFromJson(Map<String, dynamic> json) => _MatchEvent(
  type: json['type'] as String,
  matchId: json['matchId'] as String,
  eventNum: (json['eventNum'] as num).toInt(),
  matchConfig: json['matchConfig'] as Map<String, dynamic>?,
  matchInfoDeltas: json['matchInfoDeltas'] as Map<String, dynamic>?,
  performanceDeltas: (json['performanceDeltas'] as List<dynamic>?)
      ?.map((e) => PerformanceDelta.fromJson(e as Map<String, dynamic>))
      .toList(),
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$MatchEventToJson(_MatchEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'matchId': instance.matchId,
      'eventNum': instance.eventNum,
      'matchConfig': instance.matchConfig,
      'matchInfoDeltas': instance.matchInfoDeltas,
      'performanceDeltas': instance.performanceDeltas,
      'data': instance.data,
    };
