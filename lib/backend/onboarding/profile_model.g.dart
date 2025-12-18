// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      userId: json['user_id'] as String,
      createdAt: const PostgresTimestampConverter().fromJson(
        json['created_at'] as String,
      ),
      fullName: json['full_name'] as String? ?? '',
      country: json['country'] as String? ?? '',
      onboardingStage: (json['onboarding_stage'] as num?)?.toInt() ?? 0,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      dob: const PostgresDateConverter().fromJson(json['dob'] as String?),
    );

Map<String, dynamic> _$ProfileModelToJson(
  _ProfileModel instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'created_at': const PostgresTimestampConverter().toJson(instance.createdAt),
  'full_name': instance.fullName,
  'country': instance.country,
  'onboarding_stage': instance.onboardingStage,
  'experience': instance.experience,
  'dob': const PostgresDateConverter().toJson(instance.dob),
};
