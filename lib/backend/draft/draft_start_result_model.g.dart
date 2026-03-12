// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_start_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftOrderEntry _$DraftOrderEntryFromJson(Map<String, dynamic> json) =>
    _DraftOrderEntry(
      teamId: json['teamId'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$DraftOrderEntryToJson(_DraftOrderEntry instance) =>
    <String, dynamic>{'teamId': instance.teamId, 'order': instance.order};

_DraftStartResult _$DraftStartResultFromJson(Map<String, dynamic> json) =>
    _DraftStartResult(
      leagueId: json['leagueId'] as String,
      currentTeamId: json['currentTeamId'] as String,
      currentRound: (json['currentRound'] as num).toInt(),
      currentPick: (json['currentPick'] as num).toInt(),
      pickExpiresAt: json['pickExpiresAt'] as String,
      draftOrder: (json['draftOrder'] as List<dynamic>)
          .map((e) => DraftOrderEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DraftStartResultToJson(_DraftStartResult instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'currentTeamId': instance.currentTeamId,
      'currentRound': instance.currentRound,
      'currentPick': instance.currentPick,
      'pickExpiresAt': instance.pickExpiresAt,
      'draftOrder': instance.draftOrder,
    };
