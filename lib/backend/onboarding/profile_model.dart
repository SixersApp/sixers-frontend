import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/utils/convertors.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
sealed class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    // Required fields (No defaults needed)
    @JsonKey(name: 'user_id') 
    required String userId,

    @JsonKey(name: 'created_at')
    @PostgresTimestampConverter()
    required DateTime createdAt,

    // --- Fields with Defaults ---

    // 1. String Default: Empty String
    @JsonKey(name: 'full_name')
    @Default('') 
    String fullName,

    // 2. String Default: Empty String
    // (No @JsonKey needed if variable name matches JSON key exactly)
    @Default('') 
    String country,

    // 3. Int Default: 0
    @JsonKey(name: 'onboarding_stage')
    @Default(0)
    int onboardingStage,

    // 4. Int Default: 0
    @Default(0)
    int experience,

    // 5. Date Default: 1900-01-01
    // handled inside PostgresDateConverter
    @JsonKey(name: 'dob')
    @PostgresDateConverter()
    required DateTime dob,

  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}