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

 String get leagueId; String get currentTeamId; int get currentRound; int get currentPick; String get pickExpiresAt; String get status; List<DraftPick> get picks;
/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStateCopyWith<DraftState> get copyWith => _$DraftStateCopyWithImpl<DraftState>(this as DraftState, _$identity);

  /// Serializes this DraftState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftState&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.currentPick, currentPick) || other.currentPick == currentPick)&&(identical(other.pickExpiresAt, pickExpiresAt) || other.pickExpiresAt == pickExpiresAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.picks, picks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,currentTeamId,currentRound,currentPick,pickExpiresAt,status,const DeepCollectionEquality().hash(picks));

@override
String toString() {
  return 'DraftState(leagueId: $leagueId, currentTeamId: $currentTeamId, currentRound: $currentRound, currentPick: $currentPick, pickExpiresAt: $pickExpiresAt, status: $status, picks: $picks)';
}


}

/// @nodoc
abstract mixin class $DraftStateCopyWith<$Res>  {
  factory $DraftStateCopyWith(DraftState value, $Res Function(DraftState) _then) = _$DraftStateCopyWithImpl;
@useResult
$Res call({
 String leagueId, String currentTeamId, int currentRound, int currentPick, String pickExpiresAt, String status, List<DraftPick> picks
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
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? currentTeamId = null,Object? currentRound = null,Object? currentPick = null,Object? pickExpiresAt = null,Object? status = null,Object? picks = null,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,currentPick: null == currentPick ? _self.currentPick : currentPick // ignore: cast_nullable_to_non_nullable
as int,pickExpiresAt: null == pickExpiresAt ? _self.pickExpiresAt : pickExpiresAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as List<DraftPick>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  String status,  List<DraftPick> picks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.status,_that.picks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  String status,  List<DraftPick> picks)  $default,) {final _that = this;
switch (_that) {
case _DraftState():
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.status,_that.picks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  String status,  List<DraftPick> picks)?  $default,) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.status,_that.picks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftState implements DraftState {
  const _DraftState({required this.leagueId, required this.currentTeamId, required this.currentRound, required this.currentPick, required this.pickExpiresAt, required this.status, final  List<DraftPick> picks = const []}): _picks = picks;
  factory _DraftState.fromJson(Map<String, dynamic> json) => _$DraftStateFromJson(json);

@override final  String leagueId;
@override final  String currentTeamId;
@override final  int currentRound;
@override final  int currentPick;
@override final  String pickExpiresAt;
@override final  String status;
 final  List<DraftPick> _picks;
@override@JsonKey() List<DraftPick> get picks {
  if (_picks is EqualUnmodifiableListView) return _picks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_picks);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftState&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.currentPick, currentPick) || other.currentPick == currentPick)&&(identical(other.pickExpiresAt, pickExpiresAt) || other.pickExpiresAt == pickExpiresAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._picks, _picks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,currentTeamId,currentRound,currentPick,pickExpiresAt,status,const DeepCollectionEquality().hash(_picks));

@override
String toString() {
  return 'DraftState(leagueId: $leagueId, currentTeamId: $currentTeamId, currentRound: $currentRound, currentPick: $currentPick, pickExpiresAt: $pickExpiresAt, status: $status, picks: $picks)';
}


}

/// @nodoc
abstract mixin class _$DraftStateCopyWith<$Res> implements $DraftStateCopyWith<$Res> {
  factory _$DraftStateCopyWith(_DraftState value, $Res Function(_DraftState) _then) = __$DraftStateCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, String currentTeamId, int currentRound, int currentPick, String pickExpiresAt, String status, List<DraftPick> picks
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
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? currentTeamId = null,Object? currentRound = null,Object? currentPick = null,Object? pickExpiresAt = null,Object? status = null,Object? picks = null,}) {
  return _then(_DraftState(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,currentPick: null == currentPick ? _self.currentPick : currentPick // ignore: cast_nullable_to_non_nullable
as int,pickExpiresAt: null == pickExpiresAt ? _self.pickExpiresAt : pickExpiresAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self._picks : picks // ignore: cast_nullable_to_non_nullable
as List<DraftPick>,
  ));
}


}

// dart format on
