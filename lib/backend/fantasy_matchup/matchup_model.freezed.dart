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
mixin _$MatchupPlayerPerformance {

@JsonKey(name: 'runs_scored') int? get runsScored;@JsonKey(name: 'balls_faced') int? get ballsFaced; int? get fours; int? get sixes;@JsonKey(name: 'balls_bowled') int? get ballsBowled;@JsonKey(name: 'runs_conceded') int? get runsConceded;@JsonKey(name: 'wickets_taken') int? get wicketsTaken; int? get catches;@JsonKey(name: 'run_outs') int? get runOuts;@JsonKey(name: 'catches_dropped') int? get catchesDropped;@JsonKey(name: 'not_out') bool? get notOut;
/// Create a copy of MatchupPlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupPlayerPerformanceCopyWith<MatchupPlayerPerformance> get copyWith => _$MatchupPlayerPerformanceCopyWithImpl<MatchupPlayerPerformance>(this as MatchupPlayerPerformance, _$identity);

  /// Serializes this MatchupPlayerPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchupPlayerPerformance&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut);

@override
String toString() {
  return 'MatchupPlayerPerformance(runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class $MatchupPlayerPerformanceCopyWith<$Res>  {
  factory $MatchupPlayerPerformanceCopyWith(MatchupPlayerPerformance value, $Res Function(MatchupPlayerPerformance) _then) = _$MatchupPlayerPerformanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'runs_scored') int? runsScored,@JsonKey(name: 'balls_faced') int? ballsFaced, int? fours, int? sixes,@JsonKey(name: 'balls_bowled') int? ballsBowled,@JsonKey(name: 'runs_conceded') int? runsConceded,@JsonKey(name: 'wickets_taken') int? wicketsTaken, int? catches,@JsonKey(name: 'run_outs') int? runOuts,@JsonKey(name: 'catches_dropped') int? catchesDropped,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class _$MatchupPlayerPerformanceCopyWithImpl<$Res>
    implements $MatchupPlayerPerformanceCopyWith<$Res> {
  _$MatchupPlayerPerformanceCopyWithImpl(this._self, this._then);

  final MatchupPlayerPerformance _self;
  final $Res Function(MatchupPlayerPerformance) _then;

/// Create a copy of MatchupPlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? runsScored = freezed,Object? ballsFaced = freezed,Object? fours = freezed,Object? sixes = freezed,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = freezed,Object? runOuts = freezed,Object? catchesDropped = freezed,Object? notOut = freezed,}) {
  return _then(_self.copyWith(
runsScored: freezed == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int?,ballsFaced: freezed == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int?,fours: freezed == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int?,sixes: freezed == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int?,ballsBowled: freezed == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int?,runsConceded: freezed == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int?,wicketsTaken: freezed == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int?,catches: freezed == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int?,runOuts: freezed == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int?,catchesDropped: freezed == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int?,notOut: freezed == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchupPlayerPerformance].
extension MatchupPlayerPerformancePatterns on MatchupPlayerPerformance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchupPlayerPerformance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchupPlayerPerformance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchupPlayerPerformance value)  $default,){
final _that = this;
switch (_that) {
case _MatchupPlayerPerformance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchupPlayerPerformance value)?  $default,){
final _that = this;
switch (_that) {
case _MatchupPlayerPerformance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchupPlayerPerformance() when $default != null:
return $default(_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)  $default,) {final _that = this;
switch (_that) {
case _MatchupPlayerPerformance():
return $default(_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)?  $default,) {final _that = this;
switch (_that) {
case _MatchupPlayerPerformance() when $default != null:
return $default(_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchupPlayerPerformance implements MatchupPlayerPerformance {
  const _MatchupPlayerPerformance({@JsonKey(name: 'runs_scored') this.runsScored, @JsonKey(name: 'balls_faced') this.ballsFaced, this.fours, this.sixes, @JsonKey(name: 'balls_bowled') this.ballsBowled, @JsonKey(name: 'runs_conceded') this.runsConceded, @JsonKey(name: 'wickets_taken') this.wicketsTaken, this.catches, @JsonKey(name: 'run_outs') this.runOuts, @JsonKey(name: 'catches_dropped') this.catchesDropped, @JsonKey(name: 'not_out') this.notOut});
  factory _MatchupPlayerPerformance.fromJson(Map<String, dynamic> json) => _$MatchupPlayerPerformanceFromJson(json);

@override@JsonKey(name: 'runs_scored') final  int? runsScored;
@override@JsonKey(name: 'balls_faced') final  int? ballsFaced;
@override final  int? fours;
@override final  int? sixes;
@override@JsonKey(name: 'balls_bowled') final  int? ballsBowled;
@override@JsonKey(name: 'runs_conceded') final  int? runsConceded;
@override@JsonKey(name: 'wickets_taken') final  int? wicketsTaken;
@override final  int? catches;
@override@JsonKey(name: 'run_outs') final  int? runOuts;
@override@JsonKey(name: 'catches_dropped') final  int? catchesDropped;
@override@JsonKey(name: 'not_out') final  bool? notOut;

/// Create a copy of MatchupPlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupPlayerPerformanceCopyWith<_MatchupPlayerPerformance> get copyWith => __$MatchupPlayerPerformanceCopyWithImpl<_MatchupPlayerPerformance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupPlayerPerformanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchupPlayerPerformance&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut);

@override
String toString() {
  return 'MatchupPlayerPerformance(runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class _$MatchupPlayerPerformanceCopyWith<$Res> implements $MatchupPlayerPerformanceCopyWith<$Res> {
  factory _$MatchupPlayerPerformanceCopyWith(_MatchupPlayerPerformance value, $Res Function(_MatchupPlayerPerformance) _then) = __$MatchupPlayerPerformanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'runs_scored') int? runsScored,@JsonKey(name: 'balls_faced') int? ballsFaced, int? fours, int? sixes,@JsonKey(name: 'balls_bowled') int? ballsBowled,@JsonKey(name: 'runs_conceded') int? runsConceded,@JsonKey(name: 'wickets_taken') int? wicketsTaken, int? catches,@JsonKey(name: 'run_outs') int? runOuts,@JsonKey(name: 'catches_dropped') int? catchesDropped,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class __$MatchupPlayerPerformanceCopyWithImpl<$Res>
    implements _$MatchupPlayerPerformanceCopyWith<$Res> {
  __$MatchupPlayerPerformanceCopyWithImpl(this._self, this._then);

  final _MatchupPlayerPerformance _self;
  final $Res Function(_MatchupPlayerPerformance) _then;

/// Create a copy of MatchupPlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? runsScored = freezed,Object? ballsFaced = freezed,Object? fours = freezed,Object? sixes = freezed,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = freezed,Object? runOuts = freezed,Object? catchesDropped = freezed,Object? notOut = freezed,}) {
  return _then(_MatchupPlayerPerformance(
runsScored: freezed == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int?,ballsFaced: freezed == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int?,fours: freezed == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int?,sixes: freezed == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int?,ballsBowled: freezed == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int?,runsConceded: freezed == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int?,wicketsTaken: freezed == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int?,catches: freezed == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int?,runOuts: freezed == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int?,catchesDropped: freezed == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int?,notOut: freezed == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$MatchupPlayer {

 String get playerId; String? get performanceId; String? get matchId; String get name;@JsonKey(name: 'full_name') String? get fullName; String get image; String get role; String get slot; String get teamName; String get teamImage; String? get teamAbbreviation;@JsonKey(name: 'projectedPoints') double get projectedPpg; double? get fantasyPoints; MatchupPlayerPerformance? get performance;
/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupPlayerCopyWith<MatchupPlayer> get copyWith => _$MatchupPlayerCopyWithImpl<MatchupPlayer>(this as MatchupPlayer, _$identity);

  /// Serializes this MatchupPlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchupPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.projectedPpg, projectedPpg) || other.projectedPpg == projectedPpg)&&(identical(other.fantasyPoints, fantasyPoints) || other.fantasyPoints == fantasyPoints)&&(identical(other.performance, performance) || other.performance == performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,performanceId,matchId,name,fullName,image,role,slot,teamName,teamImage,teamAbbreviation,projectedPpg,fantasyPoints,performance);

@override
String toString() {
  return 'MatchupPlayer(playerId: $playerId, performanceId: $performanceId, matchId: $matchId, name: $name, fullName: $fullName, image: $image, role: $role, slot: $slot, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, projectedPpg: $projectedPpg, fantasyPoints: $fantasyPoints, performance: $performance)';
}


}

/// @nodoc
abstract mixin class $MatchupPlayerCopyWith<$Res>  {
  factory $MatchupPlayerCopyWith(MatchupPlayer value, $Res Function(MatchupPlayer) _then) = _$MatchupPlayerCopyWithImpl;
@useResult
$Res call({
 String playerId, String? performanceId, String? matchId, String name,@JsonKey(name: 'full_name') String? fullName, String image, String role, String slot, String teamName, String teamImage, String? teamAbbreviation,@JsonKey(name: 'projectedPoints') double projectedPpg, double? fantasyPoints, MatchupPlayerPerformance? performance
});


$MatchupPlayerPerformanceCopyWith<$Res>? get performance;

}
/// @nodoc
class _$MatchupPlayerCopyWithImpl<$Res>
    implements $MatchupPlayerCopyWith<$Res> {
  _$MatchupPlayerCopyWithImpl(this._self, this._then);

  final MatchupPlayer _self;
  final $Res Function(MatchupPlayer) _then;

/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? performanceId = freezed,Object? matchId = freezed,Object? name = null,Object? fullName = freezed,Object? image = null,Object? role = null,Object? slot = null,Object? teamName = null,Object? teamImage = null,Object? teamAbbreviation = freezed,Object? projectedPpg = null,Object? fantasyPoints = freezed,Object? performance = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,performanceId: freezed == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as String?,matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: null == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,projectedPpg: null == projectedPpg ? _self.projectedPpg : projectedPpg // ignore: cast_nullable_to_non_nullable
as double,fantasyPoints: freezed == fantasyPoints ? _self.fantasyPoints : fantasyPoints // ignore: cast_nullable_to_non_nullable
as double?,performance: freezed == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as MatchupPlayerPerformance?,
  ));
}
/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupPlayerPerformanceCopyWith<$Res>? get performance {
    if (_self.performance == null) {
    return null;
  }

  return $MatchupPlayerPerformanceCopyWith<$Res>(_self.performance!, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchupPlayer].
extension MatchupPlayerPatterns on MatchupPlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchupPlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchupPlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchupPlayer value)  $default,){
final _that = this;
switch (_that) {
case _MatchupPlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchupPlayer value)?  $default,){
final _that = this;
switch (_that) {
case _MatchupPlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playerId,  String? performanceId,  String? matchId,  String name, @JsonKey(name: 'full_name')  String? fullName,  String image,  String role,  String slot,  String teamName,  String teamImage,  String? teamAbbreviation, @JsonKey(name: 'projectedPoints')  double projectedPpg,  double? fantasyPoints,  MatchupPlayerPerformance? performance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchupPlayer() when $default != null:
return $default(_that.playerId,_that.performanceId,_that.matchId,_that.name,_that.fullName,_that.image,_that.role,_that.slot,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.projectedPpg,_that.fantasyPoints,_that.performance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playerId,  String? performanceId,  String? matchId,  String name, @JsonKey(name: 'full_name')  String? fullName,  String image,  String role,  String slot,  String teamName,  String teamImage,  String? teamAbbreviation, @JsonKey(name: 'projectedPoints')  double projectedPpg,  double? fantasyPoints,  MatchupPlayerPerformance? performance)  $default,) {final _that = this;
switch (_that) {
case _MatchupPlayer():
return $default(_that.playerId,_that.performanceId,_that.matchId,_that.name,_that.fullName,_that.image,_that.role,_that.slot,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.projectedPpg,_that.fantasyPoints,_that.performance);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playerId,  String? performanceId,  String? matchId,  String name, @JsonKey(name: 'full_name')  String? fullName,  String image,  String role,  String slot,  String teamName,  String teamImage,  String? teamAbbreviation, @JsonKey(name: 'projectedPoints')  double projectedPpg,  double? fantasyPoints,  MatchupPlayerPerformance? performance)?  $default,) {final _that = this;
switch (_that) {
case _MatchupPlayer() when $default != null:
return $default(_that.playerId,_that.performanceId,_that.matchId,_that.name,_that.fullName,_that.image,_that.role,_that.slot,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.projectedPpg,_that.fantasyPoints,_that.performance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchupPlayer implements MatchupPlayer {
  const _MatchupPlayer({required this.playerId, this.performanceId, this.matchId, required this.name, @JsonKey(name: 'full_name') this.fullName, required this.image, required this.role, this.slot = '', required this.teamName, required this.teamImage, this.teamAbbreviation, @JsonKey(name: 'projectedPoints') this.projectedPpg = 0, this.fantasyPoints, this.performance});
  factory _MatchupPlayer.fromJson(Map<String, dynamic> json) => _$MatchupPlayerFromJson(json);

@override final  String playerId;
@override final  String? performanceId;
@override final  String? matchId;
@override final  String name;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String image;
@override final  String role;
@override@JsonKey() final  String slot;
@override final  String teamName;
@override final  String teamImage;
@override final  String? teamAbbreviation;
@override@JsonKey(name: 'projectedPoints') final  double projectedPpg;
@override final  double? fantasyPoints;
@override final  MatchupPlayerPerformance? performance;

/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupPlayerCopyWith<_MatchupPlayer> get copyWith => __$MatchupPlayerCopyWithImpl<_MatchupPlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupPlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchupPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.projectedPpg, projectedPpg) || other.projectedPpg == projectedPpg)&&(identical(other.fantasyPoints, fantasyPoints) || other.fantasyPoints == fantasyPoints)&&(identical(other.performance, performance) || other.performance == performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,performanceId,matchId,name,fullName,image,role,slot,teamName,teamImage,teamAbbreviation,projectedPpg,fantasyPoints,performance);

@override
String toString() {
  return 'MatchupPlayer(playerId: $playerId, performanceId: $performanceId, matchId: $matchId, name: $name, fullName: $fullName, image: $image, role: $role, slot: $slot, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, projectedPpg: $projectedPpg, fantasyPoints: $fantasyPoints, performance: $performance)';
}


}

/// @nodoc
abstract mixin class _$MatchupPlayerCopyWith<$Res> implements $MatchupPlayerCopyWith<$Res> {
  factory _$MatchupPlayerCopyWith(_MatchupPlayer value, $Res Function(_MatchupPlayer) _then) = __$MatchupPlayerCopyWithImpl;
@override @useResult
$Res call({
 String playerId, String? performanceId, String? matchId, String name,@JsonKey(name: 'full_name') String? fullName, String image, String role, String slot, String teamName, String teamImage, String? teamAbbreviation,@JsonKey(name: 'projectedPoints') double projectedPpg, double? fantasyPoints, MatchupPlayerPerformance? performance
});


@override $MatchupPlayerPerformanceCopyWith<$Res>? get performance;

}
/// @nodoc
class __$MatchupPlayerCopyWithImpl<$Res>
    implements _$MatchupPlayerCopyWith<$Res> {
  __$MatchupPlayerCopyWithImpl(this._self, this._then);

  final _MatchupPlayer _self;
  final $Res Function(_MatchupPlayer) _then;

/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? performanceId = freezed,Object? matchId = freezed,Object? name = null,Object? fullName = freezed,Object? image = null,Object? role = null,Object? slot = null,Object? teamName = null,Object? teamImage = null,Object? teamAbbreviation = freezed,Object? projectedPpg = null,Object? fantasyPoints = freezed,Object? performance = freezed,}) {
  return _then(_MatchupPlayer(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,performanceId: freezed == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as String?,matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: null == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,projectedPpg: null == projectedPpg ? _self.projectedPpg : projectedPpg // ignore: cast_nullable_to_non_nullable
as double,fantasyPoints: freezed == fantasyPoints ? _self.fantasyPoints : fantasyPoints // ignore: cast_nullable_to_non_nullable
as double?,performance: freezed == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as MatchupPlayerPerformance?,
  ));
}

/// Create a copy of MatchupPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupPlayerPerformanceCopyWith<$Res>? get performance {
    if (_self.performance == null) {
    return null;
  }

  return $MatchupPlayerPerformanceCopyWith<$Res>(_self.performance!, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}


/// @nodoc
mixin _$MatchupTeam {

 String get fantasyTeamId; String get fantasyTeamInstanceId; String? get captain; String? get viceCaptain; List<MatchupPlayer> get players;
/// Create a copy of MatchupTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupTeamCopyWith<MatchupTeam> get copyWith => _$MatchupTeamCopyWithImpl<MatchupTeam>(this as MatchupTeam, _$identity);

  /// Serializes this MatchupTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchupTeam&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.fantasyTeamInstanceId, fantasyTeamInstanceId) || other.fantasyTeamInstanceId == fantasyTeamInstanceId)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.viceCaptain, viceCaptain) || other.viceCaptain == viceCaptain)&&const DeepCollectionEquality().equals(other.players, players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fantasyTeamId,fantasyTeamInstanceId,captain,viceCaptain,const DeepCollectionEquality().hash(players));

@override
String toString() {
  return 'MatchupTeam(fantasyTeamId: $fantasyTeamId, fantasyTeamInstanceId: $fantasyTeamInstanceId, captain: $captain, viceCaptain: $viceCaptain, players: $players)';
}


}

/// @nodoc
abstract mixin class $MatchupTeamCopyWith<$Res>  {
  factory $MatchupTeamCopyWith(MatchupTeam value, $Res Function(MatchupTeam) _then) = _$MatchupTeamCopyWithImpl;
@useResult
$Res call({
 String fantasyTeamId, String fantasyTeamInstanceId, String? captain, String? viceCaptain, List<MatchupPlayer> players
});




}
/// @nodoc
class _$MatchupTeamCopyWithImpl<$Res>
    implements $MatchupTeamCopyWith<$Res> {
  _$MatchupTeamCopyWithImpl(this._self, this._then);

  final MatchupTeam _self;
  final $Res Function(MatchupTeam) _then;

/// Create a copy of MatchupTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fantasyTeamId = null,Object? fantasyTeamInstanceId = null,Object? captain = freezed,Object? viceCaptain = freezed,Object? players = null,}) {
  return _then(_self.copyWith(
fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstanceId: null == fantasyTeamInstanceId ? _self.fantasyTeamInstanceId : fantasyTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,viceCaptain: freezed == viceCaptain ? _self.viceCaptain : viceCaptain // ignore: cast_nullable_to_non_nullable
as String?,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<MatchupPlayer>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchupTeam].
extension MatchupTeamPatterns on MatchupTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchupTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchupTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchupTeam value)  $default,){
final _that = this;
switch (_that) {
case _MatchupTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchupTeam value)?  $default,){
final _that = this;
switch (_that) {
case _MatchupTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fantasyTeamId,  String fantasyTeamInstanceId,  String? captain,  String? viceCaptain,  List<MatchupPlayer> players)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchupTeam() when $default != null:
return $default(_that.fantasyTeamId,_that.fantasyTeamInstanceId,_that.captain,_that.viceCaptain,_that.players);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fantasyTeamId,  String fantasyTeamInstanceId,  String? captain,  String? viceCaptain,  List<MatchupPlayer> players)  $default,) {final _that = this;
switch (_that) {
case _MatchupTeam():
return $default(_that.fantasyTeamId,_that.fantasyTeamInstanceId,_that.captain,_that.viceCaptain,_that.players);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fantasyTeamId,  String fantasyTeamInstanceId,  String? captain,  String? viceCaptain,  List<MatchupPlayer> players)?  $default,) {final _that = this;
switch (_that) {
case _MatchupTeam() when $default != null:
return $default(_that.fantasyTeamId,_that.fantasyTeamInstanceId,_that.captain,_that.viceCaptain,_that.players);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchupTeam implements MatchupTeam {
  const _MatchupTeam({required this.fantasyTeamId, required this.fantasyTeamInstanceId, this.captain, this.viceCaptain, final  List<MatchupPlayer> players = const []}): _players = players;
  factory _MatchupTeam.fromJson(Map<String, dynamic> json) => _$MatchupTeamFromJson(json);

@override final  String fantasyTeamId;
@override final  String fantasyTeamInstanceId;
@override final  String? captain;
@override final  String? viceCaptain;
 final  List<MatchupPlayer> _players;
@override@JsonKey() List<MatchupPlayer> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}


/// Create a copy of MatchupTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupTeamCopyWith<_MatchupTeam> get copyWith => __$MatchupTeamCopyWithImpl<_MatchupTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchupTeam&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.fantasyTeamInstanceId, fantasyTeamInstanceId) || other.fantasyTeamInstanceId == fantasyTeamInstanceId)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.viceCaptain, viceCaptain) || other.viceCaptain == viceCaptain)&&const DeepCollectionEquality().equals(other._players, _players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fantasyTeamId,fantasyTeamInstanceId,captain,viceCaptain,const DeepCollectionEquality().hash(_players));

@override
String toString() {
  return 'MatchupTeam(fantasyTeamId: $fantasyTeamId, fantasyTeamInstanceId: $fantasyTeamInstanceId, captain: $captain, viceCaptain: $viceCaptain, players: $players)';
}


}

/// @nodoc
abstract mixin class _$MatchupTeamCopyWith<$Res> implements $MatchupTeamCopyWith<$Res> {
  factory _$MatchupTeamCopyWith(_MatchupTeam value, $Res Function(_MatchupTeam) _then) = __$MatchupTeamCopyWithImpl;
@override @useResult
$Res call({
 String fantasyTeamId, String fantasyTeamInstanceId, String? captain, String? viceCaptain, List<MatchupPlayer> players
});




}
/// @nodoc
class __$MatchupTeamCopyWithImpl<$Res>
    implements _$MatchupTeamCopyWith<$Res> {
  __$MatchupTeamCopyWithImpl(this._self, this._then);

  final _MatchupTeam _self;
  final $Res Function(_MatchupTeam) _then;

/// Create a copy of MatchupTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fantasyTeamId = null,Object? fantasyTeamInstanceId = null,Object? captain = freezed,Object? viceCaptain = freezed,Object? players = null,}) {
  return _then(_MatchupTeam(
fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamInstanceId: null == fantasyTeamInstanceId ? _self.fantasyTeamInstanceId : fantasyTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,viceCaptain: freezed == viceCaptain ? _self.viceCaptain : viceCaptain // ignore: cast_nullable_to_non_nullable
as String?,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<MatchupPlayer>,
  ));
}


}


/// @nodoc
mixin _$Matchup {

 String get id; int get matchNum; MatchupTeam get team1; MatchupTeam get team2;
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupCopyWith<Matchup> get copyWith => _$MatchupCopyWithImpl<Matchup>(this as Matchup, _$identity);

  /// Serializes this Matchup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchNum,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, matchNum: $matchNum, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class $MatchupCopyWith<$Res>  {
  factory $MatchupCopyWith(Matchup value, $Res Function(Matchup) _then) = _$MatchupCopyWithImpl;
@useResult
$Res call({
 String id, int matchNum, MatchupTeam team1, MatchupTeam team2
});


$MatchupTeamCopyWith<$Res> get team1;$MatchupTeamCopyWith<$Res> get team2;

}
/// @nodoc
class _$MatchupCopyWithImpl<$Res>
    implements $MatchupCopyWith<$Res> {
  _$MatchupCopyWithImpl(this._self, this._then);

  final Matchup _self;
  final $Res Function(Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? matchNum = null,Object? team1 = null,Object? team2 = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,team1: null == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
as MatchupTeam,team2: null == team2 ? _self.team2 : team2 // ignore: cast_nullable_to_non_nullable
as MatchupTeam,
  ));
}
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupTeamCopyWith<$Res> get team1 {
  
  return $MatchupTeamCopyWith<$Res>(_self.team1, (value) {
    return _then(_self.copyWith(team1: value));
  });
}/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupTeamCopyWith<$Res> get team2 {
  
  return $MatchupTeamCopyWith<$Res>(_self.team2, (value) {
    return _then(_self.copyWith(team2: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int matchNum,  MatchupTeam team1,  MatchupTeam team2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.matchNum,_that.team1,_that.team2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int matchNum,  MatchupTeam team1,  MatchupTeam team2)  $default,) {final _that = this;
switch (_that) {
case _Matchup():
return $default(_that.id,_that.matchNum,_that.team1,_that.team2);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int matchNum,  MatchupTeam team1,  MatchupTeam team2)?  $default,) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.matchNum,_that.team1,_that.team2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matchup implements Matchup {
  const _Matchup({required this.id, required this.matchNum, required this.team1, required this.team2});
  factory _Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);

@override final  String id;
@override final  int matchNum;
@override final  MatchupTeam team1;
@override final  MatchupTeam team2;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchNum,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, matchNum: $matchNum, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class _$MatchupCopyWith<$Res> implements $MatchupCopyWith<$Res> {
  factory _$MatchupCopyWith(_Matchup value, $Res Function(_Matchup) _then) = __$MatchupCopyWithImpl;
@override @useResult
$Res call({
 String id, int matchNum, MatchupTeam team1, MatchupTeam team2
});


@override $MatchupTeamCopyWith<$Res> get team1;@override $MatchupTeamCopyWith<$Res> get team2;

}
/// @nodoc
class __$MatchupCopyWithImpl<$Res>
    implements _$MatchupCopyWith<$Res> {
  __$MatchupCopyWithImpl(this._self, this._then);

  final _Matchup _self;
  final $Res Function(_Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? matchNum = null,Object? team1 = null,Object? team2 = null,}) {
  return _then(_Matchup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,team1: null == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
as MatchupTeam,team2: null == team2 ? _self.team2 : team2 // ignore: cast_nullable_to_non_nullable
as MatchupTeam,
  ));
}

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupTeamCopyWith<$Res> get team1 {
  
  return $MatchupTeamCopyWith<$Res>(_self.team1, (value) {
    return _then(_self.copyWith(team1: value));
  });
}/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupTeamCopyWith<$Res> get team2 {
  
  return $MatchupTeamCopyWith<$Res>(_self.team2, (value) {
    return _then(_self.copyWith(team2: value));
  });
}
}


/// @nodoc
mixin _$LeagueMatchupGroup {

 String get leagueId; List<Matchup> get matchups;
/// Create a copy of LeagueMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueMatchupGroupCopyWith<LeagueMatchupGroup> get copyWith => _$LeagueMatchupGroupCopyWithImpl<LeagueMatchupGroup>(this as LeagueMatchupGroup, _$identity);

  /// Serializes this LeagueMatchupGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueMatchupGroup&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&const DeepCollectionEquality().equals(other.matchups, matchups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,const DeepCollectionEquality().hash(matchups));

@override
String toString() {
  return 'LeagueMatchupGroup(leagueId: $leagueId, matchups: $matchups)';
}


}

/// @nodoc
abstract mixin class $LeagueMatchupGroupCopyWith<$Res>  {
  factory $LeagueMatchupGroupCopyWith(LeagueMatchupGroup value, $Res Function(LeagueMatchupGroup) _then) = _$LeagueMatchupGroupCopyWithImpl;
@useResult
$Res call({
 String leagueId, List<Matchup> matchups
});




}
/// @nodoc
class _$LeagueMatchupGroupCopyWithImpl<$Res>
    implements $LeagueMatchupGroupCopyWith<$Res> {
  _$LeagueMatchupGroupCopyWithImpl(this._self, this._then);

  final LeagueMatchupGroup _self;
  final $Res Function(LeagueMatchupGroup) _then;

/// Create a copy of LeagueMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? matchups = null,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchups: null == matchups ? _self.matchups : matchups // ignore: cast_nullable_to_non_nullable
as List<Matchup>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueMatchupGroup].
extension LeagueMatchupGroupPatterns on LeagueMatchupGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueMatchupGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueMatchupGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueMatchupGroup value)  $default,){
final _that = this;
switch (_that) {
case _LeagueMatchupGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueMatchupGroup value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueMatchupGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  List<Matchup> matchups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueMatchupGroup() when $default != null:
return $default(_that.leagueId,_that.matchups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  List<Matchup> matchups)  $default,) {final _that = this;
switch (_that) {
case _LeagueMatchupGroup():
return $default(_that.leagueId,_that.matchups);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  List<Matchup> matchups)?  $default,) {final _that = this;
switch (_that) {
case _LeagueMatchupGroup() when $default != null:
return $default(_that.leagueId,_that.matchups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueMatchupGroup implements LeagueMatchupGroup {
  const _LeagueMatchupGroup({required this.leagueId, final  List<Matchup> matchups = const []}): _matchups = matchups;
  factory _LeagueMatchupGroup.fromJson(Map<String, dynamic> json) => _$LeagueMatchupGroupFromJson(json);

@override final  String leagueId;
 final  List<Matchup> _matchups;
@override@JsonKey() List<Matchup> get matchups {
  if (_matchups is EqualUnmodifiableListView) return _matchups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchups);
}


/// Create a copy of LeagueMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueMatchupGroupCopyWith<_LeagueMatchupGroup> get copyWith => __$LeagueMatchupGroupCopyWithImpl<_LeagueMatchupGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueMatchupGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueMatchupGroup&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&const DeepCollectionEquality().equals(other._matchups, _matchups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,const DeepCollectionEquality().hash(_matchups));

@override
String toString() {
  return 'LeagueMatchupGroup(leagueId: $leagueId, matchups: $matchups)';
}


}

/// @nodoc
abstract mixin class _$LeagueMatchupGroupCopyWith<$Res> implements $LeagueMatchupGroupCopyWith<$Res> {
  factory _$LeagueMatchupGroupCopyWith(_LeagueMatchupGroup value, $Res Function(_LeagueMatchupGroup) _then) = __$LeagueMatchupGroupCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, List<Matchup> matchups
});




}
/// @nodoc
class __$LeagueMatchupGroupCopyWithImpl<$Res>
    implements _$LeagueMatchupGroupCopyWith<$Res> {
  __$LeagueMatchupGroupCopyWithImpl(this._self, this._then);

  final _LeagueMatchupGroup _self;
  final $Res Function(_LeagueMatchupGroup) _then;

/// Create a copy of LeagueMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? matchups = null,}) {
  return _then(_LeagueMatchupGroup(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchups: null == matchups ? _self._matchups : matchups // ignore: cast_nullable_to_non_nullable
as List<Matchup>,
  ));
}


}


/// @nodoc
mixin _$WeekMatchupGroup {

 String get leagueId; int get matchNum; String get status; List<Matchup> get matchups;
/// Create a copy of WeekMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekMatchupGroupCopyWith<WeekMatchupGroup> get copyWith => _$WeekMatchupGroupCopyWithImpl<WeekMatchupGroup>(this as WeekMatchupGroup, _$identity);

  /// Serializes this WeekMatchupGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekMatchupGroup&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.matchups, matchups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,matchNum,status,const DeepCollectionEquality().hash(matchups));

@override
String toString() {
  return 'WeekMatchupGroup(leagueId: $leagueId, matchNum: $matchNum, status: $status, matchups: $matchups)';
}


}

/// @nodoc
abstract mixin class $WeekMatchupGroupCopyWith<$Res>  {
  factory $WeekMatchupGroupCopyWith(WeekMatchupGroup value, $Res Function(WeekMatchupGroup) _then) = _$WeekMatchupGroupCopyWithImpl;
@useResult
$Res call({
 String leagueId, int matchNum, String status, List<Matchup> matchups
});




}
/// @nodoc
class _$WeekMatchupGroupCopyWithImpl<$Res>
    implements $WeekMatchupGroupCopyWith<$Res> {
  _$WeekMatchupGroupCopyWithImpl(this._self, this._then);

  final WeekMatchupGroup _self;
  final $Res Function(WeekMatchupGroup) _then;

/// Create a copy of WeekMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? matchNum = null,Object? status = null,Object? matchups = null,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,matchups: null == matchups ? _self.matchups : matchups // ignore: cast_nullable_to_non_nullable
as List<Matchup>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeekMatchupGroup].
extension WeekMatchupGroupPatterns on WeekMatchupGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekMatchupGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekMatchupGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekMatchupGroup value)  $default,){
final _that = this;
switch (_that) {
case _WeekMatchupGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekMatchupGroup value)?  $default,){
final _that = this;
switch (_that) {
case _WeekMatchupGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  int matchNum,  String status,  List<Matchup> matchups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekMatchupGroup() when $default != null:
return $default(_that.leagueId,_that.matchNum,_that.status,_that.matchups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  int matchNum,  String status,  List<Matchup> matchups)  $default,) {final _that = this;
switch (_that) {
case _WeekMatchupGroup():
return $default(_that.leagueId,_that.matchNum,_that.status,_that.matchups);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  int matchNum,  String status,  List<Matchup> matchups)?  $default,) {final _that = this;
switch (_that) {
case _WeekMatchupGroup() when $default != null:
return $default(_that.leagueId,_that.matchNum,_that.status,_that.matchups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeekMatchupGroup implements WeekMatchupGroup {
  const _WeekMatchupGroup({required this.leagueId, required this.matchNum, required this.status, final  List<Matchup> matchups = const []}): _matchups = matchups;
  factory _WeekMatchupGroup.fromJson(Map<String, dynamic> json) => _$WeekMatchupGroupFromJson(json);

@override final  String leagueId;
@override final  int matchNum;
@override final  String status;
 final  List<Matchup> _matchups;
@override@JsonKey() List<Matchup> get matchups {
  if (_matchups is EqualUnmodifiableListView) return _matchups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchups);
}


/// Create a copy of WeekMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekMatchupGroupCopyWith<_WeekMatchupGroup> get copyWith => __$WeekMatchupGroupCopyWithImpl<_WeekMatchupGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekMatchupGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekMatchupGroup&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._matchups, _matchups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,matchNum,status,const DeepCollectionEquality().hash(_matchups));

@override
String toString() {
  return 'WeekMatchupGroup(leagueId: $leagueId, matchNum: $matchNum, status: $status, matchups: $matchups)';
}


}

/// @nodoc
abstract mixin class _$WeekMatchupGroupCopyWith<$Res> implements $WeekMatchupGroupCopyWith<$Res> {
  factory _$WeekMatchupGroupCopyWith(_WeekMatchupGroup value, $Res Function(_WeekMatchupGroup) _then) = __$WeekMatchupGroupCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, int matchNum, String status, List<Matchup> matchups
});




}
/// @nodoc
class __$WeekMatchupGroupCopyWithImpl<$Res>
    implements _$WeekMatchupGroupCopyWith<$Res> {
  __$WeekMatchupGroupCopyWithImpl(this._self, this._then);

  final _WeekMatchupGroup _self;
  final $Res Function(_WeekMatchupGroup) _then;

/// Create a copy of WeekMatchupGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? matchNum = null,Object? status = null,Object? matchups = null,}) {
  return _then(_WeekMatchupGroup(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,matchups: null == matchups ? _self._matchups : matchups // ignore: cast_nullable_to_non_nullable
as List<Matchup>,
  ));
}


}

// dart format on
