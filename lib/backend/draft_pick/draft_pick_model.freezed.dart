// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_pick_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftPick {

 String get leagueId; int get pickNumber; String get teamId; String get playerId; int get roundNumber; String? get timestamp;
/// Create a copy of DraftPick
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftPickCopyWith<DraftPick> get copyWith => _$DraftPickCopyWithImpl<DraftPick>(this as DraftPick, _$identity);

  /// Serializes this DraftPick to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPick&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.pickNumber, pickNumber) || other.pickNumber == pickNumber)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,pickNumber,teamId,playerId,roundNumber,timestamp);

@override
String toString() {
  return 'DraftPick(leagueId: $leagueId, pickNumber: $pickNumber, teamId: $teamId, playerId: $playerId, roundNumber: $roundNumber, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $DraftPickCopyWith<$Res>  {
  factory $DraftPickCopyWith(DraftPick value, $Res Function(DraftPick) _then) = _$DraftPickCopyWithImpl;
@useResult
$Res call({
 String leagueId, int pickNumber, String teamId, String playerId, int roundNumber, String? timestamp
});




}
/// @nodoc
class _$DraftPickCopyWithImpl<$Res>
    implements $DraftPickCopyWith<$Res> {
  _$DraftPickCopyWithImpl(this._self, this._then);

  final DraftPick _self;
  final $Res Function(DraftPick) _then;

/// Create a copy of DraftPick
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? pickNumber = null,Object? teamId = null,Object? playerId = null,Object? roundNumber = null,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,pickNumber: null == pickNumber ? _self.pickNumber : pickNumber // ignore: cast_nullable_to_non_nullable
as int,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftPick].
extension DraftPickPatterns on DraftPick {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftPick value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftPick() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftPick value)  $default,){
final _that = this;
switch (_that) {
case _DraftPick():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftPick value)?  $default,){
final _that = this;
switch (_that) {
case _DraftPick() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  int pickNumber,  String teamId,  String playerId,  int roundNumber,  String? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftPick() when $default != null:
return $default(_that.leagueId,_that.pickNumber,_that.teamId,_that.playerId,_that.roundNumber,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  int pickNumber,  String teamId,  String playerId,  int roundNumber,  String? timestamp)  $default,) {final _that = this;
switch (_that) {
case _DraftPick():
return $default(_that.leagueId,_that.pickNumber,_that.teamId,_that.playerId,_that.roundNumber,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  int pickNumber,  String teamId,  String playerId,  int roundNumber,  String? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _DraftPick() when $default != null:
return $default(_that.leagueId,_that.pickNumber,_that.teamId,_that.playerId,_that.roundNumber,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftPick implements DraftPick {
  const _DraftPick({required this.leagueId, required this.pickNumber, required this.teamId, required this.playerId, required this.roundNumber, this.timestamp});
  factory _DraftPick.fromJson(Map<String, dynamic> json) => _$DraftPickFromJson(json);

@override final  String leagueId;
@override final  int pickNumber;
@override final  String teamId;
@override final  String playerId;
@override final  int roundNumber;
@override final  String? timestamp;

/// Create a copy of DraftPick
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftPickCopyWith<_DraftPick> get copyWith => __$DraftPickCopyWithImpl<_DraftPick>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftPickToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftPick&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.pickNumber, pickNumber) || other.pickNumber == pickNumber)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,pickNumber,teamId,playerId,roundNumber,timestamp);

@override
String toString() {
  return 'DraftPick(leagueId: $leagueId, pickNumber: $pickNumber, teamId: $teamId, playerId: $playerId, roundNumber: $roundNumber, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$DraftPickCopyWith<$Res> implements $DraftPickCopyWith<$Res> {
  factory _$DraftPickCopyWith(_DraftPick value, $Res Function(_DraftPick) _then) = __$DraftPickCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, int pickNumber, String teamId, String playerId, int roundNumber, String? timestamp
});




}
/// @nodoc
class __$DraftPickCopyWithImpl<$Res>
    implements _$DraftPickCopyWith<$Res> {
  __$DraftPickCopyWithImpl(this._self, this._then);

  final _DraftPick _self;
  final $Res Function(_DraftPick) _then;

/// Create a copy of DraftPick
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? pickNumber = null,Object? teamId = null,Object? playerId = null,Object? roundNumber = null,Object? timestamp = freezed,}) {
  return _then(_DraftPick(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,pickNumber: null == pickNumber ? _self.pickNumber : pickNumber // ignore: cast_nullable_to_non_nullable
as int,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
