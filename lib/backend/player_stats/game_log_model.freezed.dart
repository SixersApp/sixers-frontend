// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameLogPerformance {

@JsonKey(name: 'matchId') String get matchId;@JsonKey(name: 'matchDate') String get matchDate;@JsonKey(name: 'matchStatus') String get matchStatus;@JsonKey(name: 'homeTeamName') String? get homeTeamName;@JsonKey(name: 'homeTeamImage') String? get homeTeamImage;@JsonKey(name: 'homeTeamAbbreviation') String? get homeTeamAbbreviation;@JsonKey(name: 'awayTeamName') String? get awayTeamName;@JsonKey(name: 'awayTeamImage') String? get awayTeamImage;@JsonKey(name: 'awayTeamAbbreviation') String? get awayTeamAbbreviation; int get runsScored; int get ballsFaced; int get fours; int get sixes; int? get ballsBowled; int? get runsConceded; int? get wicketsTaken; int get catches; int get runOuts; int get catchesDropped; bool get notOut;
/// Create a copy of GameLogPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameLogPerformanceCopyWith<GameLogPerformance> get copyWith => _$GameLogPerformanceCopyWithImpl<GameLogPerformance>(this as GameLogPerformance, _$identity);

  /// Serializes this GameLogPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameLogPerformance&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.homeTeamAbbreviation, homeTeamAbbreviation) || other.homeTeamAbbreviation == homeTeamAbbreviation)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.awayTeamAbbreviation, awayTeamAbbreviation) || other.awayTeamAbbreviation == awayTeamAbbreviation)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,matchId,matchDate,matchStatus,homeTeamName,homeTeamImage,homeTeamAbbreviation,awayTeamName,awayTeamImage,awayTeamAbbreviation,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut]);

@override
String toString() {
  return 'GameLogPerformance(matchId: $matchId, matchDate: $matchDate, matchStatus: $matchStatus, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, homeTeamAbbreviation: $homeTeamAbbreviation, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, awayTeamAbbreviation: $awayTeamAbbreviation, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class $GameLogPerformanceCopyWith<$Res>  {
  factory $GameLogPerformanceCopyWith(GameLogPerformance value, $Res Function(GameLogPerformance) _then) = _$GameLogPerformanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'matchId') String matchId,@JsonKey(name: 'matchDate') String matchDate,@JsonKey(name: 'matchStatus') String matchStatus,@JsonKey(name: 'homeTeamName') String? homeTeamName,@JsonKey(name: 'homeTeamImage') String? homeTeamImage,@JsonKey(name: 'homeTeamAbbreviation') String? homeTeamAbbreviation,@JsonKey(name: 'awayTeamName') String? awayTeamName,@JsonKey(name: 'awayTeamImage') String? awayTeamImage,@JsonKey(name: 'awayTeamAbbreviation') String? awayTeamAbbreviation, int runsScored, int ballsFaced, int fours, int sixes, int? ballsBowled, int? runsConceded, int? wicketsTaken, int catches, int runOuts, int catchesDropped, bool notOut
});




}
/// @nodoc
class _$GameLogPerformanceCopyWithImpl<$Res>
    implements $GameLogPerformanceCopyWith<$Res> {
  _$GameLogPerformanceCopyWithImpl(this._self, this._then);

  final GameLogPerformance _self;
  final $Res Function(GameLogPerformance) _then;

/// Create a copy of GameLogPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? matchDate = null,Object? matchStatus = null,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? homeTeamAbbreviation = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? awayTeamAbbreviation = freezed,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = null,Object? runOuts = null,Object? catchesDropped = null,Object? notOut = null,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,matchDate: null == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamAbbreviation: freezed == homeTeamAbbreviation ? _self.homeTeamAbbreviation : homeTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamAbbreviation: freezed == awayTeamAbbreviation ? _self.awayTeamAbbreviation : awayTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: freezed == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int?,runsConceded: freezed == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int?,wicketsTaken: freezed == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int?,catches: null == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int,runOuts: null == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int,catchesDropped: null == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int,notOut: null == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GameLogPerformance].
extension GameLogPerformancePatterns on GameLogPerformance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameLogPerformance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameLogPerformance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameLogPerformance value)  $default,){
final _that = this;
switch (_that) {
case _GameLogPerformance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameLogPerformance value)?  $default,){
final _that = this;
switch (_that) {
case _GameLogPerformance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'matchId')  String matchId, @JsonKey(name: 'matchDate')  String matchDate, @JsonKey(name: 'matchStatus')  String matchStatus, @JsonKey(name: 'homeTeamName')  String? homeTeamName, @JsonKey(name: 'homeTeamImage')  String? homeTeamImage, @JsonKey(name: 'homeTeamAbbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'awayTeamName')  String? awayTeamName, @JsonKey(name: 'awayTeamImage')  String? awayTeamImage, @JsonKey(name: 'awayTeamAbbreviation')  String? awayTeamAbbreviation,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int? ballsBowled,  int? runsConceded,  int? wicketsTaken,  int catches,  int runOuts,  int catchesDropped,  bool notOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameLogPerformance() when $default != null:
return $default(_that.matchId,_that.matchDate,_that.matchStatus,_that.homeTeamName,_that.homeTeamImage,_that.homeTeamAbbreviation,_that.awayTeamName,_that.awayTeamImage,_that.awayTeamAbbreviation,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'matchId')  String matchId, @JsonKey(name: 'matchDate')  String matchDate, @JsonKey(name: 'matchStatus')  String matchStatus, @JsonKey(name: 'homeTeamName')  String? homeTeamName, @JsonKey(name: 'homeTeamImage')  String? homeTeamImage, @JsonKey(name: 'homeTeamAbbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'awayTeamName')  String? awayTeamName, @JsonKey(name: 'awayTeamImage')  String? awayTeamImage, @JsonKey(name: 'awayTeamAbbreviation')  String? awayTeamAbbreviation,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int? ballsBowled,  int? runsConceded,  int? wicketsTaken,  int catches,  int runOuts,  int catchesDropped,  bool notOut)  $default,) {final _that = this;
switch (_that) {
case _GameLogPerformance():
return $default(_that.matchId,_that.matchDate,_that.matchStatus,_that.homeTeamName,_that.homeTeamImage,_that.homeTeamAbbreviation,_that.awayTeamName,_that.awayTeamImage,_that.awayTeamAbbreviation,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'matchId')  String matchId, @JsonKey(name: 'matchDate')  String matchDate, @JsonKey(name: 'matchStatus')  String matchStatus, @JsonKey(name: 'homeTeamName')  String? homeTeamName, @JsonKey(name: 'homeTeamImage')  String? homeTeamImage, @JsonKey(name: 'homeTeamAbbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'awayTeamName')  String? awayTeamName, @JsonKey(name: 'awayTeamImage')  String? awayTeamImage, @JsonKey(name: 'awayTeamAbbreviation')  String? awayTeamAbbreviation,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int? ballsBowled,  int? runsConceded,  int? wicketsTaken,  int catches,  int runOuts,  int catchesDropped,  bool notOut)?  $default,) {final _that = this;
switch (_that) {
case _GameLogPerformance() when $default != null:
return $default(_that.matchId,_that.matchDate,_that.matchStatus,_that.homeTeamName,_that.homeTeamImage,_that.homeTeamAbbreviation,_that.awayTeamName,_that.awayTeamImage,_that.awayTeamAbbreviation,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameLogPerformance implements GameLogPerformance {
  const _GameLogPerformance({@JsonKey(name: 'matchId') required this.matchId, @JsonKey(name: 'matchDate') required this.matchDate, @JsonKey(name: 'matchStatus') required this.matchStatus, @JsonKey(name: 'homeTeamName') this.homeTeamName, @JsonKey(name: 'homeTeamImage') this.homeTeamImage, @JsonKey(name: 'homeTeamAbbreviation') this.homeTeamAbbreviation, @JsonKey(name: 'awayTeamName') this.awayTeamName, @JsonKey(name: 'awayTeamImage') this.awayTeamImage, @JsonKey(name: 'awayTeamAbbreviation') this.awayTeamAbbreviation, this.runsScored = 0, this.ballsFaced = 0, this.fours = 0, this.sixes = 0, this.ballsBowled, this.runsConceded, this.wicketsTaken, this.catches = 0, this.runOuts = 0, this.catchesDropped = 0, this.notOut = false});
  factory _GameLogPerformance.fromJson(Map<String, dynamic> json) => _$GameLogPerformanceFromJson(json);

@override@JsonKey(name: 'matchId') final  String matchId;
@override@JsonKey(name: 'matchDate') final  String matchDate;
@override@JsonKey(name: 'matchStatus') final  String matchStatus;
@override@JsonKey(name: 'homeTeamName') final  String? homeTeamName;
@override@JsonKey(name: 'homeTeamImage') final  String? homeTeamImage;
@override@JsonKey(name: 'homeTeamAbbreviation') final  String? homeTeamAbbreviation;
@override@JsonKey(name: 'awayTeamName') final  String? awayTeamName;
@override@JsonKey(name: 'awayTeamImage') final  String? awayTeamImage;
@override@JsonKey(name: 'awayTeamAbbreviation') final  String? awayTeamAbbreviation;
@override@JsonKey() final  int runsScored;
@override@JsonKey() final  int ballsFaced;
@override@JsonKey() final  int fours;
@override@JsonKey() final  int sixes;
@override final  int? ballsBowled;
@override final  int? runsConceded;
@override final  int? wicketsTaken;
@override@JsonKey() final  int catches;
@override@JsonKey() final  int runOuts;
@override@JsonKey() final  int catchesDropped;
@override@JsonKey() final  bool notOut;

/// Create a copy of GameLogPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameLogPerformanceCopyWith<_GameLogPerformance> get copyWith => __$GameLogPerformanceCopyWithImpl<_GameLogPerformance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameLogPerformanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameLogPerformance&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.homeTeamAbbreviation, homeTeamAbbreviation) || other.homeTeamAbbreviation == homeTeamAbbreviation)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.awayTeamAbbreviation, awayTeamAbbreviation) || other.awayTeamAbbreviation == awayTeamAbbreviation)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,matchId,matchDate,matchStatus,homeTeamName,homeTeamImage,homeTeamAbbreviation,awayTeamName,awayTeamImage,awayTeamAbbreviation,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut]);

@override
String toString() {
  return 'GameLogPerformance(matchId: $matchId, matchDate: $matchDate, matchStatus: $matchStatus, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, homeTeamAbbreviation: $homeTeamAbbreviation, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, awayTeamAbbreviation: $awayTeamAbbreviation, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class _$GameLogPerformanceCopyWith<$Res> implements $GameLogPerformanceCopyWith<$Res> {
  factory _$GameLogPerformanceCopyWith(_GameLogPerformance value, $Res Function(_GameLogPerformance) _then) = __$GameLogPerformanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'matchId') String matchId,@JsonKey(name: 'matchDate') String matchDate,@JsonKey(name: 'matchStatus') String matchStatus,@JsonKey(name: 'homeTeamName') String? homeTeamName,@JsonKey(name: 'homeTeamImage') String? homeTeamImage,@JsonKey(name: 'homeTeamAbbreviation') String? homeTeamAbbreviation,@JsonKey(name: 'awayTeamName') String? awayTeamName,@JsonKey(name: 'awayTeamImage') String? awayTeamImage,@JsonKey(name: 'awayTeamAbbreviation') String? awayTeamAbbreviation, int runsScored, int ballsFaced, int fours, int sixes, int? ballsBowled, int? runsConceded, int? wicketsTaken, int catches, int runOuts, int catchesDropped, bool notOut
});




}
/// @nodoc
class __$GameLogPerformanceCopyWithImpl<$Res>
    implements _$GameLogPerformanceCopyWith<$Res> {
  __$GameLogPerformanceCopyWithImpl(this._self, this._then);

  final _GameLogPerformance _self;
  final $Res Function(_GameLogPerformance) _then;

/// Create a copy of GameLogPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? matchDate = null,Object? matchStatus = null,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? homeTeamAbbreviation = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? awayTeamAbbreviation = freezed,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = null,Object? runOuts = null,Object? catchesDropped = null,Object? notOut = null,}) {
  return _then(_GameLogPerformance(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,matchDate: null == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamAbbreviation: freezed == homeTeamAbbreviation ? _self.homeTeamAbbreviation : homeTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamAbbreviation: freezed == awayTeamAbbreviation ? _self.awayTeamAbbreviation : awayTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: freezed == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int?,runsConceded: freezed == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int?,wicketsTaken: freezed == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int?,catches: null == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int,runOuts: null == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int,catchesDropped: null == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int,notOut: null == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GameLogResponse {

 String get playerId; String get name; String get image; String get role; String get seasonId; int? get endYear; String? get tournamentName; String? get tournamentAbbreviation; String get teamName; String? get teamImage; String? get teamAbbreviation; List<GameLogPerformance> get performances;
/// Create a copy of GameLogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameLogResponseCopyWith<GameLogResponse> get copyWith => _$GameLogResponseCopyWithImpl<GameLogResponse>(this as GameLogResponse, _$identity);

  /// Serializes this GameLogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameLogResponse&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.endYear, endYear) || other.endYear == endYear)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentAbbreviation, tournamentAbbreviation) || other.tournamentAbbreviation == tournamentAbbreviation)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&const DeepCollectionEquality().equals(other.performances, performances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,image,role,seasonId,endYear,tournamentName,tournamentAbbreviation,teamName,teamImage,teamAbbreviation,const DeepCollectionEquality().hash(performances));

@override
String toString() {
  return 'GameLogResponse(playerId: $playerId, name: $name, image: $image, role: $role, seasonId: $seasonId, endYear: $endYear, tournamentName: $tournamentName, tournamentAbbreviation: $tournamentAbbreviation, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, performances: $performances)';
}


}

/// @nodoc
abstract mixin class $GameLogResponseCopyWith<$Res>  {
  factory $GameLogResponseCopyWith(GameLogResponse value, $Res Function(GameLogResponse) _then) = _$GameLogResponseCopyWithImpl;
@useResult
$Res call({
 String playerId, String name, String image, String role, String seasonId, int? endYear, String? tournamentName, String? tournamentAbbreviation, String teamName, String? teamImage, String? teamAbbreviation, List<GameLogPerformance> performances
});




}
/// @nodoc
class _$GameLogResponseCopyWithImpl<$Res>
    implements $GameLogResponseCopyWith<$Res> {
  _$GameLogResponseCopyWithImpl(this._self, this._then);

  final GameLogResponse _self;
  final $Res Function(GameLogResponse) _then;

/// Create a copy of GameLogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? name = null,Object? image = null,Object? role = null,Object? seasonId = null,Object? endYear = freezed,Object? tournamentName = freezed,Object? tournamentAbbreviation = freezed,Object? teamName = null,Object? teamImage = freezed,Object? teamAbbreviation = freezed,Object? performances = null,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,endYear: freezed == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int?,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,tournamentAbbreviation: freezed == tournamentAbbreviation ? _self.tournamentAbbreviation : tournamentAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: freezed == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,performances: null == performances ? _self.performances : performances // ignore: cast_nullable_to_non_nullable
as List<GameLogPerformance>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameLogResponse].
extension GameLogResponsePatterns on GameLogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameLogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameLogResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameLogResponse value)  $default,){
final _that = this;
switch (_that) {
case _GameLogResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameLogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GameLogResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playerId,  String name,  String image,  String role,  String seasonId,  int? endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  List<GameLogPerformance> performances)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameLogResponse() when $default != null:
return $default(_that.playerId,_that.name,_that.image,_that.role,_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.performances);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playerId,  String name,  String image,  String role,  String seasonId,  int? endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  List<GameLogPerformance> performances)  $default,) {final _that = this;
switch (_that) {
case _GameLogResponse():
return $default(_that.playerId,_that.name,_that.image,_that.role,_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.performances);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playerId,  String name,  String image,  String role,  String seasonId,  int? endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  List<GameLogPerformance> performances)?  $default,) {final _that = this;
switch (_that) {
case _GameLogResponse() when $default != null:
return $default(_that.playerId,_that.name,_that.image,_that.role,_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.performances);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameLogResponse implements GameLogResponse {
  const _GameLogResponse({required this.playerId, this.name = '', this.image = '', this.role = '', required this.seasonId, this.endYear, this.tournamentName, this.tournamentAbbreviation, this.teamName = '', this.teamImage, this.teamAbbreviation, final  List<GameLogPerformance> performances = const []}): _performances = performances;
  factory _GameLogResponse.fromJson(Map<String, dynamic> json) => _$GameLogResponseFromJson(json);

@override final  String playerId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String image;
@override@JsonKey() final  String role;
@override final  String seasonId;
@override final  int? endYear;
@override final  String? tournamentName;
@override final  String? tournamentAbbreviation;
@override@JsonKey() final  String teamName;
@override final  String? teamImage;
@override final  String? teamAbbreviation;
 final  List<GameLogPerformance> _performances;
@override@JsonKey() List<GameLogPerformance> get performances {
  if (_performances is EqualUnmodifiableListView) return _performances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_performances);
}


/// Create a copy of GameLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameLogResponseCopyWith<_GameLogResponse> get copyWith => __$GameLogResponseCopyWithImpl<_GameLogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameLogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameLogResponse&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.endYear, endYear) || other.endYear == endYear)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentAbbreviation, tournamentAbbreviation) || other.tournamentAbbreviation == tournamentAbbreviation)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&const DeepCollectionEquality().equals(other._performances, _performances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,image,role,seasonId,endYear,tournamentName,tournamentAbbreviation,teamName,teamImage,teamAbbreviation,const DeepCollectionEquality().hash(_performances));

@override
String toString() {
  return 'GameLogResponse(playerId: $playerId, name: $name, image: $image, role: $role, seasonId: $seasonId, endYear: $endYear, tournamentName: $tournamentName, tournamentAbbreviation: $tournamentAbbreviation, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, performances: $performances)';
}


}

/// @nodoc
abstract mixin class _$GameLogResponseCopyWith<$Res> implements $GameLogResponseCopyWith<$Res> {
  factory _$GameLogResponseCopyWith(_GameLogResponse value, $Res Function(_GameLogResponse) _then) = __$GameLogResponseCopyWithImpl;
@override @useResult
$Res call({
 String playerId, String name, String image, String role, String seasonId, int? endYear, String? tournamentName, String? tournamentAbbreviation, String teamName, String? teamImage, String? teamAbbreviation, List<GameLogPerformance> performances
});




}
/// @nodoc
class __$GameLogResponseCopyWithImpl<$Res>
    implements _$GameLogResponseCopyWith<$Res> {
  __$GameLogResponseCopyWithImpl(this._self, this._then);

  final _GameLogResponse _self;
  final $Res Function(_GameLogResponse) _then;

/// Create a copy of GameLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? name = null,Object? image = null,Object? role = null,Object? seasonId = null,Object? endYear = freezed,Object? tournamentName = freezed,Object? tournamentAbbreviation = freezed,Object? teamName = null,Object? teamImage = freezed,Object? teamAbbreviation = freezed,Object? performances = null,}) {
  return _then(_GameLogResponse(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,endYear: freezed == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int?,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,tournamentAbbreviation: freezed == tournamentAbbreviation ? _self.tournamentAbbreviation : tournamentAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: freezed == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,performances: null == performances ? _self._performances : performances // ignore: cast_nullable_to_non_nullable
as List<GameLogPerformance>,
  ));
}


}

// dart format on
