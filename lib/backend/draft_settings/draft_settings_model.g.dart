// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraftSettings _$DraftSettingsFromJson(Map<String, dynamic> json) =>
    _DraftSettings(
      leagueId: json['league_id'] as String,
      timePerPick: (json['time_per_pick'] as num).toInt(),
      autoPickEnabled: json['auto_pick_enabled'] as bool,
      pickWarningSeconds: (json['pick_warning_seconds'] as num?)?.toInt(),
      snakeDraft: json['snake_draft'] as bool?,
    );

Map<String, dynamic> _$DraftSettingsToJson(_DraftSettings instance) =>
    <String, dynamic>{
      'league_id': instance.leagueId,
      'time_per_pick': instance.timePerPick,
      'auto_pick_enabled': instance.autoPickEnabled,
      'pick_warning_seconds': instance.pickWarningSeconds,
      'snake_draft': instance.snakeDraft,
    };
