// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftState {

@JsonKey(name: 'league_id') String get leagueId;@JsonKey(name: 'current_pick_number') int get pickNumber;@JsonKey(name: 'current_team_id') String get currentTeamId;@JsonKey(name: 'round_number') int get roundNumber;@JsonKey(name: 'pick_deadline') DateTime get pickDeadline; DraftDirection get direction;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStateCopyWith<DraftState> get copyWith => _$DraftStateCopyWithImpl<DraftState>(this as DraftState, _$identity);

  /// Serializes this DraftState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftState&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.pickNumber, pickNumber) || other.pickNumber == pickNumber)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.pickDeadline, pickDeadline) || other.pickDeadline == pickDeadline)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,pickNumber,currentTeamId,roundNumber,pickDeadline,direction,updatedAt);

@override
String toString() {
  return 'DraftState(leagueId: $leagueId, pickNumber: $pickNumber, currentTeamId: $currentTeamId, roundNumber: $roundNumber, pickDeadline: $pickDeadline, direction: $direction, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DraftStateCopyWith<$Res>  {
  factory $DraftStateCopyWith(DraftState value, $Res Function(DraftState) _then) = _$DraftStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'current_pick_number') int pickNumber,@JsonKey(name: 'current_team_id') String currentTeamId,@JsonKey(name: 'round_number') int roundNumber,@JsonKey(name: 'pick_deadline') DateTime pickDeadline, DraftDirection direction,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$DraftStateCopyWithImpl<$Res>
    implements $DraftStateCopyWith<$Res> {
  _$DraftStateCopyWithImpl(this._self, this._then);

  final DraftState _self;
  final $Res Function(DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? pickNumber = null,Object? currentTeamId = null,Object? roundNumber = null,Object? pickDeadline = null,Object? direction = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,pickNumber: null == pickNumber ? _self.pickNumber : pickNumber // ignore: cast_nullable_to_non_nullable
as int,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,pickDeadline: null == pickDeadline ? _self.pickDeadline : pickDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as DraftDirection,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftState].
extension DraftStatePatterns on DraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftState value)  $default,){
final _that = this;
switch (_that) {
case _DraftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftState value)?  $default,){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'current_pick_number')  int pickNumber, @JsonKey(name: 'current_team_id')  String currentTeamId, @JsonKey(name: 'round_number')  int roundNumber, @JsonKey(name: 'pick_deadline')  DateTime pickDeadline,  DraftDirection direction, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.leagueId,_that.pickNumber,_that.currentTeamId,_that.roundNumber,_that.pickDeadline,_that.direction,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'current_pick_number')  int pickNumber, @JsonKey(name: 'current_team_id')  String currentTeamId, @JsonKey(name: 'round_number')  int roundNumber, @JsonKey(name: 'pick_deadline')  DateTime pickDeadline,  DraftDirection direction, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DraftState():
return $default(_that.leagueId,_that.pickNumber,_that.currentTeamId,_that.roundNumber,_that.pickDeadline,_that.direction,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'current_pick_number')  int pickNumber, @JsonKey(name: 'current_team_id')  String currentTeamId, @JsonKey(name: 'round_number')  int roundNumber, @JsonKey(name: 'pick_deadline')  DateTime pickDeadline,  DraftDirection direction, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.leagueId,_that.pickNumber,_that.currentTeamId,_that.roundNumber,_that.pickDeadline,_that.direction,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftState implements DraftState {
  const _DraftState({@JsonKey(name: 'league_id') required this.leagueId, @JsonKey(name: 'current_pick_number') required this.pickNumber, @JsonKey(name: 'current_team_id') required this.currentTeamId, @JsonKey(name: 'round_number') required this.roundNumber, @JsonKey(name: 'pick_deadline') required this.pickDeadline, required this.direction, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _DraftState.fromJson(Map<String, dynamic> json) => _$DraftStateFromJson(json);

@override@JsonKey(name: 'league_id') final  String leagueId;
@override@JsonKey(name: 'current_pick_number') final  int pickNumber;
@override@JsonKey(name: 'current_team_id') final  String currentTeamId;
@override@JsonKey(name: 'round_number') final  int roundNumber;
@override@JsonKey(name: 'pick_deadline') final  DateTime pickDeadline;
@override final  DraftDirection direction;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftStateCopyWith<_DraftState> get copyWith => __$DraftStateCopyWithImpl<_DraftState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftState&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.pickNumber, pickNumber) || other.pickNumber == pickNumber)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.pickDeadline, pickDeadline) || other.pickDeadline == pickDeadline)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,pickNumber,currentTeamId,roundNumber,pickDeadline,direction,updatedAt);

@override
String toString() {
  return 'DraftState(leagueId: $leagueId, pickNumber: $pickNumber, currentTeamId: $currentTeamId, roundNumber: $roundNumber, pickDeadline: $pickDeadline, direction: $direction, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DraftStateCopyWith<$Res> implements $DraftStateCopyWith<$Res> {
  factory _$DraftStateCopyWith(_DraftState value, $Res Function(_DraftState) _then) = __$DraftStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'current_pick_number') int pickNumber,@JsonKey(name: 'current_team_id') String currentTeamId,@JsonKey(name: 'round_number') int roundNumber,@JsonKey(name: 'pick_deadline') DateTime pickDeadline, DraftDirection direction,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$DraftStateCopyWithImpl<$Res>
    implements _$DraftStateCopyWith<$Res> {
  __$DraftStateCopyWithImpl(this._self, this._then);

  final _DraftState _self;
  final $Res Function(_DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? pickNumber = null,Object? currentTeamId = null,Object? roundNumber = null,Object? pickDeadline = null,Object? direction = null,Object? updatedAt = freezed,}) {
  return _then(_DraftState(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,pickNumber: null == pickNumber ? _self.pickNumber : pickNumber // ignore: cast_nullable_to_non_nullable
as int,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,pickDeadline: null == pickDeadline ? _self.pickDeadline : pickDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as DraftDirection,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
