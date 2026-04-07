import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_event_model.freezed.dart';
part 'match_event_model.g.dart';

@freezed
sealed class PerformanceDelta with _$PerformanceDelta {
  const factory PerformanceDelta({
    @JsonKey(name: 'player_id') required String playerId,
    required Map<String, int> changes,
    @JsonKey(name: 'not_out') bool? notOut,
  }) = _PerformanceDelta;

  factory PerformanceDelta.fromJson(Map<String, dynamic> json) =>
      _$PerformanceDeltaFromJson(json);
}

@freezed
sealed class MatchEvent with _$MatchEvent {
  const factory MatchEvent({
    required String type,
    required String matchId,
    required int eventNum,
    Map<String, dynamic>? matchConfig,
    Map<String, dynamic>? matchInfoDeltas,
    List<PerformanceDelta>? performanceDeltas,
    Map<String, dynamic>? data,
  }) = _MatchEvent;

  factory MatchEvent.fromJson(Map<String, dynamic> json) =>
      _$MatchEventFromJson(json);
}
