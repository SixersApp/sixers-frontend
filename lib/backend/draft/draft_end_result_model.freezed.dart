// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_end_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftEndResult {

 String get leagueId; String get status;
/// Create a copy of DraftEndResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftEndResultCopyWith<DraftEndResult> get copyWith => _$DraftEndResultCopyWithImpl<DraftEndResult>(this as DraftEndResult, _$identity);

  /// Serializes this DraftEndResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftEndResult&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,status);

@override
String toString() {
  return 'DraftEndResult(leagueId: $leagueId, status: $status)';
}


}

/// @nodoc
abstract mixin class $DraftEndResultCopyWith<$Res>  {
  factory $DraftEndResultCopyWith(DraftEndResult value, $Res Function(DraftEndResult) _then) = _$DraftEndResultCopyWithImpl;
@useResult
$Res call({
 String leagueId, String status
});




}
/// @nodoc
class _$DraftEndResultCopyWithImpl<$Res>
    implements $DraftEndResultCopyWith<$Res> {
  _$DraftEndResultCopyWithImpl(this._self, this._then);

  final DraftEndResult _self;
  final $Res Function(DraftEndResult) _then;

/// Create a copy of DraftEndResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? status = null,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftEndResult].
extension DraftEndResultPatterns on DraftEndResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftEndResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftEndResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftEndResult value)  $default,){
final _that = this;
switch (_that) {
case _DraftEndResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftEndResult value)?  $default,){
final _that = this;
switch (_that) {
case _DraftEndResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftEndResult() when $default != null:
return $default(_that.leagueId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  String status)  $default,) {final _that = this;
switch (_that) {
case _DraftEndResult():
return $default(_that.leagueId,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _DraftEndResult() when $default != null:
return $default(_that.leagueId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftEndResult implements DraftEndResult {
  const _DraftEndResult({required this.leagueId, required this.status});
  factory _DraftEndResult.fromJson(Map<String, dynamic> json) => _$DraftEndResultFromJson(json);

@override final  String leagueId;
@override final  String status;

/// Create a copy of DraftEndResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftEndResultCopyWith<_DraftEndResult> get copyWith => __$DraftEndResultCopyWithImpl<_DraftEndResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftEndResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftEndResult&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,status);

@override
String toString() {
  return 'DraftEndResult(leagueId: $leagueId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DraftEndResultCopyWith<$Res> implements $DraftEndResultCopyWith<$Res> {
  factory _$DraftEndResultCopyWith(_DraftEndResult value, $Res Function(_DraftEndResult) _then) = __$DraftEndResultCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, String status
});




}
/// @nodoc
class __$DraftEndResultCopyWithImpl<$Res>
    implements _$DraftEndResultCopyWith<$Res> {
  __$DraftEndResultCopyWithImpl(this._self, this._then);

  final _DraftEndResult _self;
  final $Res Function(_DraftEndResult) _then;

/// Create a copy of DraftEndResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? status = null,}) {
  return _then(_DraftEndResult(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
