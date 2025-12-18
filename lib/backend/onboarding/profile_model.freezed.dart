// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

// Required fields (No defaults needed)
@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'created_at')@PostgresTimestampConverter() DateTime get createdAt;// --- Fields with Defaults ---
// 1. String Default: Empty String
@JsonKey(name: 'full_name') String get fullName;// 2. String Default: Empty String
// (No @JsonKey needed if variable name matches JSON key exactly)
 String get country;// 3. Int Default: 0
@JsonKey(name: 'onboarding_stage') int get onboardingStage;// 4. Int Default: 0
 int get experience;// 5. Date Default: 1900-01-01
// handled inside PostgresDateConverter
@JsonKey(name: 'dob')@PostgresDateConverter() DateTime get dob;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.country, country) || other.country == country)&&(identical(other.onboardingStage, onboardingStage) || other.onboardingStage == onboardingStage)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,createdAt,fullName,country,onboardingStage,experience,dob);

@override
String toString() {
  return 'ProfileModel(userId: $userId, createdAt: $createdAt, fullName: $fullName, country: $country, onboardingStage: $onboardingStage, experience: $experience, dob: $dob)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'created_at')@PostgresTimestampConverter() DateTime createdAt,@JsonKey(name: 'full_name') String fullName, String country,@JsonKey(name: 'onboarding_stage') int onboardingStage, int experience,@JsonKey(name: 'dob')@PostgresDateConverter() DateTime dob
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? createdAt = null,Object? fullName = null,Object? country = null,Object? onboardingStage = null,Object? experience = null,Object? dob = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,onboardingStage: null == onboardingStage ? _self.onboardingStage : onboardingStage // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at')@PostgresTimestampConverter()  DateTime createdAt, @JsonKey(name: 'full_name')  String fullName,  String country, @JsonKey(name: 'onboarding_stage')  int onboardingStage,  int experience, @JsonKey(name: 'dob')@PostgresDateConverter()  DateTime dob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.userId,_that.createdAt,_that.fullName,_that.country,_that.onboardingStage,_that.experience,_that.dob);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at')@PostgresTimestampConverter()  DateTime createdAt, @JsonKey(name: 'full_name')  String fullName,  String country, @JsonKey(name: 'onboarding_stage')  int onboardingStage,  int experience, @JsonKey(name: 'dob')@PostgresDateConverter()  DateTime dob)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.userId,_that.createdAt,_that.fullName,_that.country,_that.onboardingStage,_that.experience,_that.dob);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at')@PostgresTimestampConverter()  DateTime createdAt, @JsonKey(name: 'full_name')  String fullName,  String country, @JsonKey(name: 'onboarding_stage')  int onboardingStage,  int experience, @JsonKey(name: 'dob')@PostgresDateConverter()  DateTime dob)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.userId,_that.createdAt,_that.fullName,_that.country,_that.onboardingStage,_that.experience,_that.dob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'created_at')@PostgresTimestampConverter() required this.createdAt, @JsonKey(name: 'full_name') this.fullName = '', this.country = '', @JsonKey(name: 'onboarding_stage') this.onboardingStage = 0, this.experience = 0, @JsonKey(name: 'dob')@PostgresDateConverter() required this.dob});
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

// Required fields (No defaults needed)
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'created_at')@PostgresTimestampConverter() final  DateTime createdAt;
// --- Fields with Defaults ---
// 1. String Default: Empty String
@override@JsonKey(name: 'full_name') final  String fullName;
// 2. String Default: Empty String
// (No @JsonKey needed if variable name matches JSON key exactly)
@override@JsonKey() final  String country;
// 3. Int Default: 0
@override@JsonKey(name: 'onboarding_stage') final  int onboardingStage;
// 4. Int Default: 0
@override@JsonKey() final  int experience;
// 5. Date Default: 1900-01-01
// handled inside PostgresDateConverter
@override@JsonKey(name: 'dob')@PostgresDateConverter() final  DateTime dob;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.country, country) || other.country == country)&&(identical(other.onboardingStage, onboardingStage) || other.onboardingStage == onboardingStage)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,createdAt,fullName,country,onboardingStage,experience,dob);

@override
String toString() {
  return 'ProfileModel(userId: $userId, createdAt: $createdAt, fullName: $fullName, country: $country, onboardingStage: $onboardingStage, experience: $experience, dob: $dob)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'created_at')@PostgresTimestampConverter() DateTime createdAt,@JsonKey(name: 'full_name') String fullName, String country,@JsonKey(name: 'onboarding_stage') int onboardingStage, int experience,@JsonKey(name: 'dob')@PostgresDateConverter() DateTime dob
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? createdAt = null,Object? fullName = null,Object? country = null,Object? onboardingStage = null,Object? experience = null,Object? dob = null,}) {
  return _then(_ProfileModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,onboardingStage: null == onboardingStage ? _self.onboardingStage : onboardingStage // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
