// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_pick_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftPickResult {

 DraftPick get pick; String? get leagueId; String? get nextTeamId; String? get nextPickExpiresAt;
/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftPickResultCopyWith<DraftPickResult> get copyWith => _$DraftPickResultCopyWithImpl<DraftPickResult>(this as DraftPickResult, _$identity);

  /// Serializes this DraftPickResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPickResult&&(identical(other.pick, pick) || other.pick == pick)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.nextTeamId, nextTeamId) || other.nextTeamId == nextTeamId)&&(identical(other.nextPickExpiresAt, nextPickExpiresAt) || other.nextPickExpiresAt == nextPickExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pick,leagueId,nextTeamId,nextPickExpiresAt);

@override
String toString() {
  return 'DraftPickResult(pick: $pick, leagueId: $leagueId, nextTeamId: $nextTeamId, nextPickExpiresAt: $nextPickExpiresAt)';
}


}

/// @nodoc
abstract mixin class $DraftPickResultCopyWith<$Res>  {
  factory $DraftPickResultCopyWith(DraftPickResult value, $Res Function(DraftPickResult) _then) = _$DraftPickResultCopyWithImpl;
@useResult
$Res call({
 DraftPick pick, String? leagueId, String? nextTeamId, String? nextPickExpiresAt
});


$DraftPickCopyWith<$Res> get pick;

}
/// @nodoc
class _$DraftPickResultCopyWithImpl<$Res>
    implements $DraftPickResultCopyWith<$Res> {
  _$DraftPickResultCopyWithImpl(this._self, this._then);

  final DraftPickResult _self;
  final $Res Function(DraftPickResult) _then;

/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pick = null,Object? leagueId = freezed,Object? nextTeamId = freezed,Object? nextPickExpiresAt = freezed,}) {
  return _then(_self.copyWith(
pick: null == pick ? _self.pick : pick // ignore: cast_nullable_to_non_nullable
as DraftPick,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,nextTeamId: freezed == nextTeamId ? _self.nextTeamId : nextTeamId // ignore: cast_nullable_to_non_nullable
as String?,nextPickExpiresAt: freezed == nextPickExpiresAt ? _self.nextPickExpiresAt : nextPickExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftPickCopyWith<$Res> get pick {
  
  return $DraftPickCopyWith<$Res>(_self.pick, (value) {
    return _then(_self.copyWith(pick: value));
  });
}
}


/// Adds pattern-matching-related methods to [DraftPickResult].
extension DraftPickResultPatterns on DraftPickResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftPickResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftPickResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftPickResult value)  $default,){
final _that = this;
switch (_that) {
case _DraftPickResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftPickResult value)?  $default,){
final _that = this;
switch (_that) {
case _DraftPickResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DraftPick pick,  String? leagueId,  String? nextTeamId,  String? nextPickExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftPickResult() when $default != null:
return $default(_that.pick,_that.leagueId,_that.nextTeamId,_that.nextPickExpiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DraftPick pick,  String? leagueId,  String? nextTeamId,  String? nextPickExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _DraftPickResult():
return $default(_that.pick,_that.leagueId,_that.nextTeamId,_that.nextPickExpiresAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DraftPick pick,  String? leagueId,  String? nextTeamId,  String? nextPickExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _DraftPickResult() when $default != null:
return $default(_that.pick,_that.leagueId,_that.nextTeamId,_that.nextPickExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftPickResult implements DraftPickResult {
  const _DraftPickResult({required this.pick, this.leagueId, this.nextTeamId, this.nextPickExpiresAt});
  factory _DraftPickResult.fromJson(Map<String, dynamic> json) => _$DraftPickResultFromJson(json);

@override final  DraftPick pick;
@override final  String? leagueId;
@override final  String? nextTeamId;
@override final  String? nextPickExpiresAt;

/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftPickResultCopyWith<_DraftPickResult> get copyWith => __$DraftPickResultCopyWithImpl<_DraftPickResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftPickResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftPickResult&&(identical(other.pick, pick) || other.pick == pick)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.nextTeamId, nextTeamId) || other.nextTeamId == nextTeamId)&&(identical(other.nextPickExpiresAt, nextPickExpiresAt) || other.nextPickExpiresAt == nextPickExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pick,leagueId,nextTeamId,nextPickExpiresAt);

@override
String toString() {
  return 'DraftPickResult(pick: $pick, leagueId: $leagueId, nextTeamId: $nextTeamId, nextPickExpiresAt: $nextPickExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$DraftPickResultCopyWith<$Res> implements $DraftPickResultCopyWith<$Res> {
  factory _$DraftPickResultCopyWith(_DraftPickResult value, $Res Function(_DraftPickResult) _then) = __$DraftPickResultCopyWithImpl;
@override @useResult
$Res call({
 DraftPick pick, String? leagueId, String? nextTeamId, String? nextPickExpiresAt
});


@override $DraftPickCopyWith<$Res> get pick;

}
/// @nodoc
class __$DraftPickResultCopyWithImpl<$Res>
    implements _$DraftPickResultCopyWith<$Res> {
  __$DraftPickResultCopyWithImpl(this._self, this._then);

  final _DraftPickResult _self;
  final $Res Function(_DraftPickResult) _then;

/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pick = null,Object? leagueId = freezed,Object? nextTeamId = freezed,Object? nextPickExpiresAt = freezed,}) {
  return _then(_DraftPickResult(
pick: null == pick ? _self.pick : pick // ignore: cast_nullable_to_non_nullable
as DraftPick,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,nextTeamId: freezed == nextTeamId ? _self.nextTeamId : nextTeamId // ignore: cast_nullable_to_non_nullable
as String?,nextPickExpiresAt: freezed == nextPickExpiresAt ? _self.nextPickExpiresAt : nextPickExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DraftPickResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftPickCopyWith<$Res> get pick {
  
  return $DraftPickCopyWith<$Res>(_self.pick, (value) {
    return _then(_self.copyWith(pick: value));
  });
}
}

// dart format on
