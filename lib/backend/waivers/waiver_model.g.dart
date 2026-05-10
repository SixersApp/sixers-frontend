// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaiverPlayer _$WaiverPlayerFromJson(Map<String, dynamic> json) =>
    _WaiverPlayer(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      matchStatus: json['match_status'] as String? ?? 'NS',
    );

Map<String, dynamic> _$WaiverPlayerToJson(_WaiverPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'match_status': instance.matchStatus,
    };
