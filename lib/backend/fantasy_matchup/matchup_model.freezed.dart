// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Matchup {

 String get id; String get leagueId; int get matchNum; String get fantasyTeamInstance1Id; String get fantasyTeamInstance2Id; double? get fantasyTeamInstance1Score; double? get fantasyTeamInstance2Score; String? get fantasyWinnerTeamInstanceId; String get createdAt;
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupCopyWith<Matchup> get copyWith => _$MatchupCopyWithImpl<Matchup>(this as Matchup, _$identity);

  /// Serializes this Matchup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.fantasyTeamInstance1Id, fantasyTeamInstance1Id) || other.fantasyTeamInstance1Id == fantasyTeamInstance1Id)&&(identical(other.fantasyTeamInstance2Id, fantasyTeamInstance2Id) || other.fantasyTeamInstance2Id == fantasyTeamInstance2Id)&&(identical(other.fantasyTeamInstance1Score, fantasyTeamInstance1Score) || other.fantasyTeamInstance1Score == fantasyTeamInstance1Score)&&(identical(other.fantasyTeamInstance2Score, fantasyTeamInstance2Score) || other.fantasyTeamInstance2Score == fantasyTeamInstance2Score)&&(identical(other.fantasyWinnerTeamInstanceId, fantasyWinnerTeamInstanceId) || other.fantasyWinnerTeamInstanceId == fantasyWinnerTeamInstanceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,fantasyTeamInstance1Id,fantasyTeamInstance2Id,fantasyTeamInstance1Score,fantasyTeamInstance2Score,fantasyWinnerTeamInstanceId,createdAt);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, fantasyTeamInstance1Id: $fantasyTeamInstance1Id, fantasyTeamInstance2Id: $fantasyTeamInstance2Id, fantasyTeamInstance1Score: $fantasyTeamInstance1Score, fantasyTeamInstance2Score: $fantasyTeamInstance2Score, fantasyWinnerTeamInstanceId: $fantasyWinnerTeamInstanceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MatchupCopyWith<$Res>  {
  factory $MatchupCopyWith(Matchup value, $Res Function(Matchup) _then) = _$MatchupCopyWithImpl;
@useResult
$Res call({
 String id, String leagueId, int matchNum, String fantasyTeamInstance1Id, String fantasyTeamInstance2Id, double? fantasyTeamInstance1Score, double? fantasyTeamInstance2Score, String? fantasyWinnerTeamInstanceId, String createdAt
});




}
/// @nodoc
class _$MatchupCopyWithImpl<$Res>
    implements $MatchupCopyWith<$Res> {
  _$MatchupCopyWithImpl(this._self, this._then);

  final Matchup _self;
  final $Res Function(Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? fantasyTeamInstance1Id = null,Object? fantasyTeamInstance2Id = null,Object? fantasyTeamInstance1Score = freezed,Object? fantasyTeamInstance2Score = freezed,Object? fantasyWinnerTeamInstanceId = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,fantasyTeamInstance1Id: null == fantasyTeamInstance1Id ? _self.fantasyTeamInstance1Id : fantasyTeamInstance1Id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstance2Id: null == fantasyTeamInstance2Id ? _self.fantasyTeamInstance2Id : fantasyTeamInstance2Id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstance1Score: freezed == fantasyTeamInstance1Score ? _self.fantasyTeamInstance1Score : fantasyTeamInstance1Score // ignore: cast_nullable_to_non_nullable
as double?,fantasyTeamInstance2Score: freezed == fantasyTeamInstance2Score ? _self.fantasyTeamInstance2Score : fantasyTeamInstance2Score // ignore: cast_nullable_to_non_nullable
as double?,fantasyWinnerTeamInstanceId: freezed == fantasyWinnerTeamInstanceId ? _self.fantasyWinnerTeamInstanceId : fantasyWinnerTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Matchup].
extension MatchupPatterns on Matchup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Matchup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Matchup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Matchup value)  $default,){
final _that = this;
switch (_that) {
case _Matchup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Matchup value)?  $default,){
final _that = this;
switch (_that) {
case _Matchup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String leagueId,  int matchNum,  String fantasyTeamInstance1Id,  String fantasyTeamInstance2Id,  double? fantasyTeamInstance1Score,  double? fantasyTeamInstance2Score,  String? fantasyWinnerTeamInstanceId,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.fantasyTeamInstance1Id,_that.fantasyTeamInstance2Id,_that.fantasyTeamInstance1Score,_that.fantasyTeamInstance2Score,_that.fantasyWinnerTeamInstanceId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String leagueId,  int matchNum,  String fantasyTeamInstance1Id,  String fantasyTeamInstance2Id,  double? fantasyTeamInstance1Score,  double? fantasyTeamInstance2Score,  String? fantasyWinnerTeamInstanceId,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Matchup():
return $default(_that.id,_that.leagueId,_that.matchNum,_that.fantasyTeamInstance1Id,_that.fantasyTeamInstance2Id,_that.fantasyTeamInstance1Score,_that.fantasyTeamInstance2Score,_that.fantasyWinnerTeamInstanceId,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String leagueId,  int matchNum,  String fantasyTeamInstance1Id,  String fantasyTeamInstance2Id,  double? fantasyTeamInstance1Score,  double? fantasyTeamInstance2Score,  String? fantasyWinnerTeamInstanceId,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.fantasyTeamInstance1Id,_that.fantasyTeamInstance2Id,_that.fantasyTeamInstance1Score,_that.fantasyTeamInstance2Score,_that.fantasyWinnerTeamInstanceId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matchup implements Matchup {
  const _Matchup({required this.id, required this.leagueId, required this.matchNum, required this.fantasyTeamInstance1Id, required this.fantasyTeamInstance2Id, this.fantasyTeamInstance1Score, this.fantasyTeamInstance2Score, this.fantasyWinnerTeamInstanceId, required this.createdAt});
  factory _Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);

@override final  String id;
@override final  String leagueId;
@override final  int matchNum;
@override final  String fantasyTeamInstance1Id;
@override final  String fantasyTeamInstance2Id;
@override final  double? fantasyTeamInstance1Score;
@override final  double? fantasyTeamInstance2Score;
@override final  String? fantasyWinnerTeamInstanceId;
@override final  String createdAt;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupCopyWith<_Matchup> get copyWith => __$MatchupCopyWithImpl<_Matchup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.fantasyTeamInstance1Id, fantasyTeamInstance1Id) || other.fantasyTeamInstance1Id == fantasyTeamInstance1Id)&&(identical(other.fantasyTeamInstance2Id, fantasyTeamInstance2Id) || other.fantasyTeamInstance2Id == fantasyTeamInstance2Id)&&(identical(other.fantasyTeamInstance1Score, fantasyTeamInstance1Score) || other.fantasyTeamInstance1Score == fantasyTeamInstance1Score)&&(identical(other.fantasyTeamInstance2Score, fantasyTeamInstance2Score) || other.fantasyTeamInstance2Score == fantasyTeamInstance2Score)&&(identical(other.fantasyWinnerTeamInstanceId, fantasyWinnerTeamInstanceId) || other.fantasyWinnerTeamInstanceId == fantasyWinnerTeamInstanceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,fantasyTeamInstance1Id,fantasyTeamInstance2Id,fantasyTeamInstance1Score,fantasyTeamInstance2Score,fantasyWinnerTeamInstanceId,createdAt);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, fantasyTeamInstance1Id: $fantasyTeamInstance1Id, fantasyTeamInstance2Id: $fantasyTeamInstance2Id, fantasyTeamInstance1Score: $fantasyTeamInstance1Score, fantasyTeamInstance2Score: $fantasyTeamInstance2Score, fantasyWinnerTeamInstanceId: $fantasyWinnerTeamInstanceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MatchupCopyWith<$Res> implements $MatchupCopyWith<$Res> {
  factory _$MatchupCopyWith(_Matchup value, $Res Function(_Matchup) _then) = __$MatchupCopyWithImpl;
@override @useResult
$Res call({
 String id, String leagueId, int matchNum, String fantasyTeamInstance1Id, String fantasyTeamInstance2Id, double? fantasyTeamInstance1Score, double? fantasyTeamInstance2Score, String? fantasyWinnerTeamInstanceId, String createdAt
});




}
/// @nodoc
class __$MatchupCopyWithImpl<$Res>
    implements _$MatchupCopyWith<$Res> {
  __$MatchupCopyWithImpl(this._self, this._then);

  final _Matchup _self;
  final $Res Function(_Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? fantasyTeamInstance1Id = null,Object? fantasyTeamInstance2Id = null,Object? fantasyTeamInstance1Score = freezed,Object? fantasyTeamInstance2Score = freezed,Object? fantasyWinnerTeamInstanceId = freezed,Object? createdAt = null,}) {
  return _then(_Matchup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,fantasyTeamInstance1Id: null == fantasyTeamInstance1Id ? _self.fantasyTeamInstance1Id : fantasyTeamInstance1Id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstance2Id: null == fantasyTeamInstance2Id ? _self.fantasyTeamInstance2Id : fantasyTeamInstance2Id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstance1Score: freezed == fantasyTeamInstance1Score ? _self.fantasyTeamInstance1Score : fantasyTeamInstance1Score // ignore: cast_nullable_to_non_nullable
as double?,fantasyTeamInstance2Score: freezed == fantasyTeamInstance2Score ? _self.fantasyTeamInstance2Score : fantasyTeamInstance2Score // ignore: cast_nullable_to_non_nullable
as double?,fantasyWinnerTeamInstanceId: freezed == fantasyWinnerTeamInstanceId ? _self.fantasyWinnerTeamInstanceId : fantasyWinnerTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
