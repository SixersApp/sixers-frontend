// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftPickResult _$DraftPickResultFromJson(Map<String, dynamic> json) =>
    _DraftPickResult(
      pick: DraftPick.fromJson(json['pick'] as Map<String, dynamic>),
      nextTeamId: json['nextTeamId'] as String?,
      nextPickExpiresAt: json['nextPickExpiresAt'] as String?,
    );

Map<String, dynamic> _$DraftPickResultToJson(_DraftPickResult instance) =>
    <String, dynamic>{
      'pick': instance.pick,
      'nextTeamId': instance.nextTeamId,
      'nextPickExpiresAt': instance.nextPickExpiresAt,
    };
