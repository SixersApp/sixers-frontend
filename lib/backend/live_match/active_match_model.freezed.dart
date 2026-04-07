// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerPerformance {

@JsonKey(name: 'player_performance_id') String get playerPerformanceId;@JsonKey(name: 'player_id') String get playerId;@JsonKey(name: 'team_id') String get teamId;@JsonKey(name: 'runs_scored') int? get runsScored;@JsonKey(name: 'balls_faced') int? get ballsFaced; int? get fours; int? get sixes;@JsonKey(name: 'balls_bowled') int? get ballsBowled;@JsonKey(name: 'runs_conceded') int? get runsConceded;@JsonKey(name: 'wickets_taken') int? get wicketsTaken; int? get catches;@JsonKey(name: 'run_outs') int? get runOuts;@JsonKey(name: 'catches_dropped') int? get catchesDropped;@JsonKey(name: 'not_out') bool? get notOut;
/// Create a copy of PlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPerformanceCopyWith<PlayerPerformance> get copyWith => _$PlayerPerformanceCopyWithImpl<PlayerPerformance>(this as PlayerPerformance, _$identity);

  /// Serializes this PlayerPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPerformance&&(identical(other.playerPerformanceId, playerPerformanceId) || other.playerPerformanceId == playerPerformanceId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerPerformanceId,playerId,teamId,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut);

@override
String toString() {
  return 'PlayerPerformance(playerPerformanceId: $playerPerformanceId, playerId: $playerId, teamId: $teamId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class $PlayerPerformanceCopyWith<$Res>  {
  factory $PlayerPerformanceCopyWith(PlayerPerformance value, $Res Function(PlayerPerformance) _then) = _$PlayerPerformanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_performance_id') String playerPerformanceId,@JsonKey(name: 'player_id') String playerId,@JsonKey(name: 'team_id') String teamId,@JsonKey(name: 'runs_scored') int? runsScored,@JsonKey(name: 'balls_faced') int? ballsFaced, int? fours, int? sixes,@JsonKey(name: 'balls_bowled') int? ballsBowled,@JsonKey(name: 'runs_conceded') int? runsConceded,@JsonKey(name: 'wickets_taken') int? wicketsTaken, int? catches,@JsonKey(name: 'run_outs') int? runOuts,@JsonKey(name: 'catches_dropped') int? catchesDropped,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class _$PlayerPerformanceCopyWithImpl<$Res>
    implements $PlayerPerformanceCopyWith<$Res> {
  _$PlayerPerformanceCopyWithImpl(this._self, this._then);

  final PlayerPerformance _self;
  final $Res Function(PlayerPerformance) _then;

/// Create a copy of PlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerPerformanceId = null,Object? playerId = null,Object? teamId = null,Object? runsScored = freezed,Object? ballsFaced = freezed,Object? fours = freezed,Object? sixes = freezed,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = freezed,Object? runOuts = freezed,Object? catchesDropped = freezed,Object? notOut = freezed,}) {
  return _then(_self.copyWith(
playerPerformanceId: null == playerPerformanceId ? _self.playerPerformanceId : playerPerformanceId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,runsScored: freezed == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [PlayerPerformance].
extension PlayerPerformancePatterns on PlayerPerformance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerPerformance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerPerformance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerPerformance value)  $default,){
final _that = this;
switch (_that) {
case _PlayerPerformance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerPerformance value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerPerformance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_performance_id')  String playerPerformanceId, @JsonKey(name: 'player_id')  String playerId, @JsonKey(name: 'team_id')  String teamId, @JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerPerformance() when $default != null:
return $default(_that.playerPerformanceId,_that.playerId,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_performance_id')  String playerPerformanceId, @JsonKey(name: 'player_id')  String playerId, @JsonKey(name: 'team_id')  String teamId, @JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)  $default,) {final _that = this;
switch (_that) {
case _PlayerPerformance():
return $default(_that.playerPerformanceId,_that.playerId,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_performance_id')  String playerPerformanceId, @JsonKey(name: 'player_id')  String playerId, @JsonKey(name: 'team_id')  String teamId, @JsonKey(name: 'runs_scored')  int? runsScored, @JsonKey(name: 'balls_faced')  int? ballsFaced,  int? fours,  int? sixes, @JsonKey(name: 'balls_bowled')  int? ballsBowled, @JsonKey(name: 'runs_conceded')  int? runsConceded, @JsonKey(name: 'wickets_taken')  int? wicketsTaken,  int? catches, @JsonKey(name: 'run_outs')  int? runOuts, @JsonKey(name: 'catches_dropped')  int? catchesDropped, @JsonKey(name: 'not_out')  bool? notOut)?  $default,) {final _that = this;
switch (_that) {
case _PlayerPerformance() when $default != null:
return $default(_that.playerPerformanceId,_that.playerId,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.ballsBowled,_that.runsConceded,_that.wicketsTaken,_that.catches,_that.runOuts,_that.catchesDropped,_that.notOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerPerformance implements PlayerPerformance {
  const _PlayerPerformance({@JsonKey(name: 'player_performance_id') required this.playerPerformanceId, @JsonKey(name: 'player_id') required this.playerId, @JsonKey(name: 'team_id') required this.teamId, @JsonKey(name: 'runs_scored') this.runsScored, @JsonKey(name: 'balls_faced') this.ballsFaced, this.fours, this.sixes, @JsonKey(name: 'balls_bowled') this.ballsBowled, @JsonKey(name: 'runs_conceded') this.runsConceded, @JsonKey(name: 'wickets_taken') this.wicketsTaken, this.catches, @JsonKey(name: 'run_outs') this.runOuts, @JsonKey(name: 'catches_dropped') this.catchesDropped, @JsonKey(name: 'not_out') this.notOut});
  factory _PlayerPerformance.fromJson(Map<String, dynamic> json) => _$PlayerPerformanceFromJson(json);

@override@JsonKey(name: 'player_performance_id') final  String playerPerformanceId;
@override@JsonKey(name: 'player_id') final  String playerId;
@override@JsonKey(name: 'team_id') final  String teamId;
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

/// Create a copy of PlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPerformanceCopyWith<_PlayerPerformance> get copyWith => __$PlayerPerformanceCopyWithImpl<_PlayerPerformance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerPerformanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerPerformance&&(identical(other.playerPerformanceId, playerPerformanceId) || other.playerPerformanceId == playerPerformanceId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerPerformanceId,playerId,teamId,runsScored,ballsFaced,fours,sixes,ballsBowled,runsConceded,wicketsTaken,catches,runOuts,catchesDropped,notOut);

@override
String toString() {
  return 'PlayerPerformance(playerPerformanceId: $playerPerformanceId, playerId: $playerId, teamId: $teamId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, ballsBowled: $ballsBowled, runsConceded: $runsConceded, wicketsTaken: $wicketsTaken, catches: $catches, runOuts: $runOuts, catchesDropped: $catchesDropped, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class _$PlayerPerformanceCopyWith<$Res> implements $PlayerPerformanceCopyWith<$Res> {
  factory _$PlayerPerformanceCopyWith(_PlayerPerformance value, $Res Function(_PlayerPerformance) _then) = __$PlayerPerformanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_performance_id') String playerPerformanceId,@JsonKey(name: 'player_id') String playerId,@JsonKey(name: 'team_id') String teamId,@JsonKey(name: 'runs_scored') int? runsScored,@JsonKey(name: 'balls_faced') int? ballsFaced, int? fours, int? sixes,@JsonKey(name: 'balls_bowled') int? ballsBowled,@JsonKey(name: 'runs_conceded') int? runsConceded,@JsonKey(name: 'wickets_taken') int? wicketsTaken, int? catches,@JsonKey(name: 'run_outs') int? runOuts,@JsonKey(name: 'catches_dropped') int? catchesDropped,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class __$PlayerPerformanceCopyWithImpl<$Res>
    implements _$PlayerPerformanceCopyWith<$Res> {
  __$PlayerPerformanceCopyWithImpl(this._self, this._then);

  final _PlayerPerformance _self;
  final $Res Function(_PlayerPerformance) _then;

/// Create a copy of PlayerPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerPerformanceId = null,Object? playerId = null,Object? teamId = null,Object? runsScored = freezed,Object? ballsFaced = freezed,Object? fours = freezed,Object? sixes = freezed,Object? ballsBowled = freezed,Object? runsConceded = freezed,Object? wicketsTaken = freezed,Object? catches = freezed,Object? runOuts = freezed,Object? catchesDropped = freezed,Object? notOut = freezed,}) {
  return _then(_PlayerPerformance(
playerPerformanceId: null == playerPerformanceId ? _self.playerPerformanceId : playerPerformanceId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,runsScored: freezed == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
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
mixin _$ActiveMatch {

 String get id;@JsonKey(name: 'match_date') String get matchDate;@JsonKey(name: 'tournament_id') String get tournamentId;@JsonKey(name: 'season_id') String get seasonId;@JsonKey(name: 'venue_id') String? get venueId;@JsonKey(name: 'home_team_id') String get homeTeamId;@JsonKey(name: 'away_team_id') String get awayTeamId;@JsonKey(name: 'home_team_name') String? get homeTeamName;@JsonKey(name: 'home_team_image') String? get homeTeamImage;@JsonKey(name: 'away_team_name') String? get awayTeamName;@JsonKey(name: 'away_team_image') String? get awayTeamImage;@JsonKey(name: 'home_team_abbreviation') String? get homeTeamAbbreviation;@JsonKey(name: 'away_team_abbreviation') String? get awayTeamAbbreviation;@JsonKey(name: 'tournament_name') String? get tournamentName;@JsonKey(name: 'abbreviation') String? get abbreviation;@JsonKey(name: 'home_team_score') int? get homeTeamScore;@JsonKey(name: 'away_team_score') int? get awayTeamScore;@JsonKey(name: 'home_team_wickets') int? get homeTeamWickets;@JsonKey(name: 'away_team_wickets') int? get awayTeamWickets;@JsonKey(name: 'home_team_balls') int? get homeTeamBalls;@JsonKey(name: 'away_team_balls') int? get awayTeamBalls;@JsonKey(name: 'home_match_num') int get homeMatchNum;@JsonKey(name: 'away_match_num') int get awayMatchNum; int? get dls; String get status; String? get result;@JsonKey(name: 'event_num') int? get eventNum;@JsonKey(name: 'player_performances') List<PlayerPerformance> get playerPerformances;
/// Create a copy of ActiveMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveMatchCopyWith<ActiveMatch> get copyWith => _$ActiveMatchCopyWithImpl<ActiveMatch>(this as ActiveMatch, _$identity);

  /// Serializes this ActiveMatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveMatch&&(identical(other.id, id) || other.id == id)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.homeTeamAbbreviation, homeTeamAbbreviation) || other.homeTeamAbbreviation == homeTeamAbbreviation)&&(identical(other.awayTeamAbbreviation, awayTeamAbbreviation) || other.awayTeamAbbreviation == awayTeamAbbreviation)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&(identical(other.homeTeamScore, homeTeamScore) || other.homeTeamScore == homeTeamScore)&&(identical(other.awayTeamScore, awayTeamScore) || other.awayTeamScore == awayTeamScore)&&(identical(other.homeTeamWickets, homeTeamWickets) || other.homeTeamWickets == homeTeamWickets)&&(identical(other.awayTeamWickets, awayTeamWickets) || other.awayTeamWickets == awayTeamWickets)&&(identical(other.homeTeamBalls, homeTeamBalls) || other.homeTeamBalls == homeTeamBalls)&&(identical(other.awayTeamBalls, awayTeamBalls) || other.awayTeamBalls == awayTeamBalls)&&(identical(other.homeMatchNum, homeMatchNum) || other.homeMatchNum == homeMatchNum)&&(identical(other.awayMatchNum, awayMatchNum) || other.awayMatchNum == awayMatchNum)&&(identical(other.dls, dls) || other.dls == dls)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.eventNum, eventNum) || other.eventNum == eventNum)&&const DeepCollectionEquality().equals(other.playerPerformances, playerPerformances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,matchDate,tournamentId,seasonId,venueId,homeTeamId,awayTeamId,homeTeamName,homeTeamImage,awayTeamName,awayTeamImage,homeTeamAbbreviation,awayTeamAbbreviation,tournamentName,abbreviation,homeTeamScore,awayTeamScore,homeTeamWickets,awayTeamWickets,homeTeamBalls,awayTeamBalls,homeMatchNum,awayMatchNum,dls,status,result,eventNum,const DeepCollectionEquality().hash(playerPerformances)]);

@override
String toString() {
  return 'ActiveMatch(id: $id, matchDate: $matchDate, tournamentId: $tournamentId, seasonId: $seasonId, venueId: $venueId, homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, homeTeamAbbreviation: $homeTeamAbbreviation, awayTeamAbbreviation: $awayTeamAbbreviation, tournamentName: $tournamentName, abbreviation: $abbreviation, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore, homeTeamWickets: $homeTeamWickets, awayTeamWickets: $awayTeamWickets, homeTeamBalls: $homeTeamBalls, awayTeamBalls: $awayTeamBalls, homeMatchNum: $homeMatchNum, awayMatchNum: $awayMatchNum, dls: $dls, status: $status, result: $result, eventNum: $eventNum, playerPerformances: $playerPerformances)';
}


}

/// @nodoc
abstract mixin class $ActiveMatchCopyWith<$Res>  {
  factory $ActiveMatchCopyWith(ActiveMatch value, $Res Function(ActiveMatch) _then) = _$ActiveMatchCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'match_date') String matchDate,@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'season_id') String seasonId,@JsonKey(name: 'venue_id') String? venueId,@JsonKey(name: 'home_team_id') String homeTeamId,@JsonKey(name: 'away_team_id') String awayTeamId,@JsonKey(name: 'home_team_name') String? homeTeamName,@JsonKey(name: 'home_team_image') String? homeTeamImage,@JsonKey(name: 'away_team_name') String? awayTeamName,@JsonKey(name: 'away_team_image') String? awayTeamImage,@JsonKey(name: 'home_team_abbreviation') String? homeTeamAbbreviation,@JsonKey(name: 'away_team_abbreviation') String? awayTeamAbbreviation,@JsonKey(name: 'tournament_name') String? tournamentName,@JsonKey(name: 'abbreviation') String? abbreviation,@JsonKey(name: 'home_team_score') int? homeTeamScore,@JsonKey(name: 'away_team_score') int? awayTeamScore,@JsonKey(name: 'home_team_wickets') int? homeTeamWickets,@JsonKey(name: 'away_team_wickets') int? awayTeamWickets,@JsonKey(name: 'home_team_balls') int? homeTeamBalls,@JsonKey(name: 'away_team_balls') int? awayTeamBalls,@JsonKey(name: 'home_match_num') int homeMatchNum,@JsonKey(name: 'away_match_num') int awayMatchNum, int? dls, String status, String? result,@JsonKey(name: 'event_num') int? eventNum,@JsonKey(name: 'player_performances') List<PlayerPerformance> playerPerformances
});




}
/// @nodoc
class _$ActiveMatchCopyWithImpl<$Res>
    implements $ActiveMatchCopyWith<$Res> {
  _$ActiveMatchCopyWithImpl(this._self, this._then);

  final ActiveMatch _self;
  final $Res Function(ActiveMatch) _then;

/// Create a copy of ActiveMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? matchDate = null,Object? tournamentId = null,Object? seasonId = null,Object? venueId = freezed,Object? homeTeamId = null,Object? awayTeamId = null,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? homeTeamAbbreviation = freezed,Object? awayTeamAbbreviation = freezed,Object? tournamentName = freezed,Object? abbreviation = freezed,Object? homeTeamScore = freezed,Object? awayTeamScore = freezed,Object? homeTeamWickets = freezed,Object? awayTeamWickets = freezed,Object? homeTeamBalls = freezed,Object? awayTeamBalls = freezed,Object? homeMatchNum = null,Object? awayMatchNum = null,Object? dls = freezed,Object? status = null,Object? result = freezed,Object? eventNum = freezed,Object? playerPerformances = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchDate: null == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: null == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String,awayTeamId: null == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamAbbreviation: freezed == homeTeamAbbreviation ? _self.homeTeamAbbreviation : homeTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,awayTeamAbbreviation: freezed == awayTeamAbbreviation ? _self.awayTeamAbbreviation : awayTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,homeTeamScore: freezed == homeTeamScore ? _self.homeTeamScore : homeTeamScore // ignore: cast_nullable_to_non_nullable
as int?,awayTeamScore: freezed == awayTeamScore ? _self.awayTeamScore : awayTeamScore // ignore: cast_nullable_to_non_nullable
as int?,homeTeamWickets: freezed == homeTeamWickets ? _self.homeTeamWickets : homeTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,awayTeamWickets: freezed == awayTeamWickets ? _self.awayTeamWickets : awayTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBalls: freezed == homeTeamBalls ? _self.homeTeamBalls : homeTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamBalls: freezed == awayTeamBalls ? _self.awayTeamBalls : awayTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,homeMatchNum: null == homeMatchNum ? _self.homeMatchNum : homeMatchNum // ignore: cast_nullable_to_non_nullable
as int,awayMatchNum: null == awayMatchNum ? _self.awayMatchNum : awayMatchNum // ignore: cast_nullable_to_non_nullable
as int,dls: freezed == dls ? _self.dls : dls // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,eventNum: freezed == eventNum ? _self.eventNum : eventNum // ignore: cast_nullable_to_non_nullable
as int?,playerPerformances: null == playerPerformances ? _self.playerPerformances : playerPerformances // ignore: cast_nullable_to_non_nullable
as List<PlayerPerformance>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveMatch].
extension ActiveMatchPatterns on ActiveMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveMatch value)  $default,){
final _that = this;
switch (_that) {
case _ActiveMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveMatch value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'match_date')  String matchDate, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'season_id')  String seasonId, @JsonKey(name: 'venue_id')  String? venueId, @JsonKey(name: 'home_team_id')  String homeTeamId, @JsonKey(name: 'away_team_id')  String awayTeamId, @JsonKey(name: 'home_team_name')  String? homeTeamName, @JsonKey(name: 'home_team_image')  String? homeTeamImage, @JsonKey(name: 'away_team_name')  String? awayTeamName, @JsonKey(name: 'away_team_image')  String? awayTeamImage, @JsonKey(name: 'home_team_abbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'away_team_abbreviation')  String? awayTeamAbbreviation, @JsonKey(name: 'tournament_name')  String? tournamentName, @JsonKey(name: 'abbreviation')  String? abbreviation, @JsonKey(name: 'home_team_score')  int? homeTeamScore, @JsonKey(name: 'away_team_score')  int? awayTeamScore, @JsonKey(name: 'home_team_wickets')  int? homeTeamWickets, @JsonKey(name: 'away_team_wickets')  int? awayTeamWickets, @JsonKey(name: 'home_team_balls')  int? homeTeamBalls, @JsonKey(name: 'away_team_balls')  int? awayTeamBalls, @JsonKey(name: 'home_match_num')  int homeMatchNum, @JsonKey(name: 'away_match_num')  int awayMatchNum,  int? dls,  String status,  String? result, @JsonKey(name: 'event_num')  int? eventNum, @JsonKey(name: 'player_performances')  List<PlayerPerformance> playerPerformances)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveMatch() when $default != null:
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamAbbreviation,_that.awayTeamAbbreviation,_that.tournamentName,_that.abbreviation,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.homeMatchNum,_that.awayMatchNum,_that.dls,_that.status,_that.result,_that.eventNum,_that.playerPerformances);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'match_date')  String matchDate, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'season_id')  String seasonId, @JsonKey(name: 'venue_id')  String? venueId, @JsonKey(name: 'home_team_id')  String homeTeamId, @JsonKey(name: 'away_team_id')  String awayTeamId, @JsonKey(name: 'home_team_name')  String? homeTeamName, @JsonKey(name: 'home_team_image')  String? homeTeamImage, @JsonKey(name: 'away_team_name')  String? awayTeamName, @JsonKey(name: 'away_team_image')  String? awayTeamImage, @JsonKey(name: 'home_team_abbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'away_team_abbreviation')  String? awayTeamAbbreviation, @JsonKey(name: 'tournament_name')  String? tournamentName, @JsonKey(name: 'abbreviation')  String? abbreviation, @JsonKey(name: 'home_team_score')  int? homeTeamScore, @JsonKey(name: 'away_team_score')  int? awayTeamScore, @JsonKey(name: 'home_team_wickets')  int? homeTeamWickets, @JsonKey(name: 'away_team_wickets')  int? awayTeamWickets, @JsonKey(name: 'home_team_balls')  int? homeTeamBalls, @JsonKey(name: 'away_team_balls')  int? awayTeamBalls, @JsonKey(name: 'home_match_num')  int homeMatchNum, @JsonKey(name: 'away_match_num')  int awayMatchNum,  int? dls,  String status,  String? result, @JsonKey(name: 'event_num')  int? eventNum, @JsonKey(name: 'player_performances')  List<PlayerPerformance> playerPerformances)  $default,) {final _that = this;
switch (_that) {
case _ActiveMatch():
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamAbbreviation,_that.awayTeamAbbreviation,_that.tournamentName,_that.abbreviation,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.homeMatchNum,_that.awayMatchNum,_that.dls,_that.status,_that.result,_that.eventNum,_that.playerPerformances);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'match_date')  String matchDate, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'season_id')  String seasonId, @JsonKey(name: 'venue_id')  String? venueId, @JsonKey(name: 'home_team_id')  String homeTeamId, @JsonKey(name: 'away_team_id')  String awayTeamId, @JsonKey(name: 'home_team_name')  String? homeTeamName, @JsonKey(name: 'home_team_image')  String? homeTeamImage, @JsonKey(name: 'away_team_name')  String? awayTeamName, @JsonKey(name: 'away_team_image')  String? awayTeamImage, @JsonKey(name: 'home_team_abbreviation')  String? homeTeamAbbreviation, @JsonKey(name: 'away_team_abbreviation')  String? awayTeamAbbreviation, @JsonKey(name: 'tournament_name')  String? tournamentName, @JsonKey(name: 'abbreviation')  String? abbreviation, @JsonKey(name: 'home_team_score')  int? homeTeamScore, @JsonKey(name: 'away_team_score')  int? awayTeamScore, @JsonKey(name: 'home_team_wickets')  int? homeTeamWickets, @JsonKey(name: 'away_team_wickets')  int? awayTeamWickets, @JsonKey(name: 'home_team_balls')  int? homeTeamBalls, @JsonKey(name: 'away_team_balls')  int? awayTeamBalls, @JsonKey(name: 'home_match_num')  int homeMatchNum, @JsonKey(name: 'away_match_num')  int awayMatchNum,  int? dls,  String status,  String? result, @JsonKey(name: 'event_num')  int? eventNum, @JsonKey(name: 'player_performances')  List<PlayerPerformance> playerPerformances)?  $default,) {final _that = this;
switch (_that) {
case _ActiveMatch() when $default != null:
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamAbbreviation,_that.awayTeamAbbreviation,_that.tournamentName,_that.abbreviation,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.homeMatchNum,_that.awayMatchNum,_that.dls,_that.status,_that.result,_that.eventNum,_that.playerPerformances);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveMatch implements ActiveMatch {
  const _ActiveMatch({required this.id, @JsonKey(name: 'match_date') required this.matchDate, @JsonKey(name: 'tournament_id') required this.tournamentId, @JsonKey(name: 'season_id') required this.seasonId, @JsonKey(name: 'venue_id') this.venueId, @JsonKey(name: 'home_team_id') required this.homeTeamId, @JsonKey(name: 'away_team_id') required this.awayTeamId, @JsonKey(name: 'home_team_name') this.homeTeamName, @JsonKey(name: 'home_team_image') this.homeTeamImage, @JsonKey(name: 'away_team_name') this.awayTeamName, @JsonKey(name: 'away_team_image') this.awayTeamImage, @JsonKey(name: 'home_team_abbreviation') this.homeTeamAbbreviation, @JsonKey(name: 'away_team_abbreviation') this.awayTeamAbbreviation, @JsonKey(name: 'tournament_name') this.tournamentName, @JsonKey(name: 'abbreviation') this.abbreviation, @JsonKey(name: 'home_team_score') this.homeTeamScore, @JsonKey(name: 'away_team_score') this.awayTeamScore, @JsonKey(name: 'home_team_wickets') this.homeTeamWickets, @JsonKey(name: 'away_team_wickets') this.awayTeamWickets, @JsonKey(name: 'home_team_balls') this.homeTeamBalls, @JsonKey(name: 'away_team_balls') this.awayTeamBalls, @JsonKey(name: 'home_match_num') required this.homeMatchNum, @JsonKey(name: 'away_match_num') required this.awayMatchNum, this.dls, required this.status, this.result, @JsonKey(name: 'event_num') this.eventNum, @JsonKey(name: 'player_performances') final  List<PlayerPerformance> playerPerformances = const []}): _playerPerformances = playerPerformances;
  factory _ActiveMatch.fromJson(Map<String, dynamic> json) => _$ActiveMatchFromJson(json);

@override final  String id;
@override@JsonKey(name: 'match_date') final  String matchDate;
@override@JsonKey(name: 'tournament_id') final  String tournamentId;
@override@JsonKey(name: 'season_id') final  String seasonId;
@override@JsonKey(name: 'venue_id') final  String? venueId;
@override@JsonKey(name: 'home_team_id') final  String homeTeamId;
@override@JsonKey(name: 'away_team_id') final  String awayTeamId;
@override@JsonKey(name: 'home_team_name') final  String? homeTeamName;
@override@JsonKey(name: 'home_team_image') final  String? homeTeamImage;
@override@JsonKey(name: 'away_team_name') final  String? awayTeamName;
@override@JsonKey(name: 'away_team_image') final  String? awayTeamImage;
@override@JsonKey(name: 'home_team_abbreviation') final  String? homeTeamAbbreviation;
@override@JsonKey(name: 'away_team_abbreviation') final  String? awayTeamAbbreviation;
@override@JsonKey(name: 'tournament_name') final  String? tournamentName;
@override@JsonKey(name: 'abbreviation') final  String? abbreviation;
@override@JsonKey(name: 'home_team_score') final  int? homeTeamScore;
@override@JsonKey(name: 'away_team_score') final  int? awayTeamScore;
@override@JsonKey(name: 'home_team_wickets') final  int? homeTeamWickets;
@override@JsonKey(name: 'away_team_wickets') final  int? awayTeamWickets;
@override@JsonKey(name: 'home_team_balls') final  int? homeTeamBalls;
@override@JsonKey(name: 'away_team_balls') final  int? awayTeamBalls;
@override@JsonKey(name: 'home_match_num') final  int homeMatchNum;
@override@JsonKey(name: 'away_match_num') final  int awayMatchNum;
@override final  int? dls;
@override final  String status;
@override final  String? result;
@override@JsonKey(name: 'event_num') final  int? eventNum;
 final  List<PlayerPerformance> _playerPerformances;
@override@JsonKey(name: 'player_performances') List<PlayerPerformance> get playerPerformances {
  if (_playerPerformances is EqualUnmodifiableListView) return _playerPerformances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playerPerformances);
}


/// Create a copy of ActiveMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveMatchCopyWith<_ActiveMatch> get copyWith => __$ActiveMatchCopyWithImpl<_ActiveMatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveMatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveMatch&&(identical(other.id, id) || other.id == id)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.homeTeamAbbreviation, homeTeamAbbreviation) || other.homeTeamAbbreviation == homeTeamAbbreviation)&&(identical(other.awayTeamAbbreviation, awayTeamAbbreviation) || other.awayTeamAbbreviation == awayTeamAbbreviation)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&(identical(other.homeTeamScore, homeTeamScore) || other.homeTeamScore == homeTeamScore)&&(identical(other.awayTeamScore, awayTeamScore) || other.awayTeamScore == awayTeamScore)&&(identical(other.homeTeamWickets, homeTeamWickets) || other.homeTeamWickets == homeTeamWickets)&&(identical(other.awayTeamWickets, awayTeamWickets) || other.awayTeamWickets == awayTeamWickets)&&(identical(other.homeTeamBalls, homeTeamBalls) || other.homeTeamBalls == homeTeamBalls)&&(identical(other.awayTeamBalls, awayTeamBalls) || other.awayTeamBalls == awayTeamBalls)&&(identical(other.homeMatchNum, homeMatchNum) || other.homeMatchNum == homeMatchNum)&&(identical(other.awayMatchNum, awayMatchNum) || other.awayMatchNum == awayMatchNum)&&(identical(other.dls, dls) || other.dls == dls)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.eventNum, eventNum) || other.eventNum == eventNum)&&const DeepCollectionEquality().equals(other._playerPerformances, _playerPerformances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,matchDate,tournamentId,seasonId,venueId,homeTeamId,awayTeamId,homeTeamName,homeTeamImage,awayTeamName,awayTeamImage,homeTeamAbbreviation,awayTeamAbbreviation,tournamentName,abbreviation,homeTeamScore,awayTeamScore,homeTeamWickets,awayTeamWickets,homeTeamBalls,awayTeamBalls,homeMatchNum,awayMatchNum,dls,status,result,eventNum,const DeepCollectionEquality().hash(_playerPerformances)]);

@override
String toString() {
  return 'ActiveMatch(id: $id, matchDate: $matchDate, tournamentId: $tournamentId, seasonId: $seasonId, venueId: $venueId, homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, homeTeamAbbreviation: $homeTeamAbbreviation, awayTeamAbbreviation: $awayTeamAbbreviation, tournamentName: $tournamentName, abbreviation: $abbreviation, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore, homeTeamWickets: $homeTeamWickets, awayTeamWickets: $awayTeamWickets, homeTeamBalls: $homeTeamBalls, awayTeamBalls: $awayTeamBalls, homeMatchNum: $homeMatchNum, awayMatchNum: $awayMatchNum, dls: $dls, status: $status, result: $result, eventNum: $eventNum, playerPerformances: $playerPerformances)';
}


}

/// @nodoc
abstract mixin class _$ActiveMatchCopyWith<$Res> implements $ActiveMatchCopyWith<$Res> {
  factory _$ActiveMatchCopyWith(_ActiveMatch value, $Res Function(_ActiveMatch) _then) = __$ActiveMatchCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'match_date') String matchDate,@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'season_id') String seasonId,@JsonKey(name: 'venue_id') String? venueId,@JsonKey(name: 'home_team_id') String homeTeamId,@JsonKey(name: 'away_team_id') String awayTeamId,@JsonKey(name: 'home_team_name') String? homeTeamName,@JsonKey(name: 'home_team_image') String? homeTeamImage,@JsonKey(name: 'away_team_name') String? awayTeamName,@JsonKey(name: 'away_team_image') String? awayTeamImage,@JsonKey(name: 'home_team_abbreviation') String? homeTeamAbbreviation,@JsonKey(name: 'away_team_abbreviation') String? awayTeamAbbreviation,@JsonKey(name: 'tournament_name') String? tournamentName,@JsonKey(name: 'abbreviation') String? abbreviation,@JsonKey(name: 'home_team_score') int? homeTeamScore,@JsonKey(name: 'away_team_score') int? awayTeamScore,@JsonKey(name: 'home_team_wickets') int? homeTeamWickets,@JsonKey(name: 'away_team_wickets') int? awayTeamWickets,@JsonKey(name: 'home_team_balls') int? homeTeamBalls,@JsonKey(name: 'away_team_balls') int? awayTeamBalls,@JsonKey(name: 'home_match_num') int homeMatchNum,@JsonKey(name: 'away_match_num') int awayMatchNum, int? dls, String status, String? result,@JsonKey(name: 'event_num') int? eventNum,@JsonKey(name: 'player_performances') List<PlayerPerformance> playerPerformances
});




}
/// @nodoc
class __$ActiveMatchCopyWithImpl<$Res>
    implements _$ActiveMatchCopyWith<$Res> {
  __$ActiveMatchCopyWithImpl(this._self, this._then);

  final _ActiveMatch _self;
  final $Res Function(_ActiveMatch) _then;

/// Create a copy of ActiveMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? matchDate = null,Object? tournamentId = null,Object? seasonId = null,Object? venueId = freezed,Object? homeTeamId = null,Object? awayTeamId = null,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? homeTeamAbbreviation = freezed,Object? awayTeamAbbreviation = freezed,Object? tournamentName = freezed,Object? abbreviation = freezed,Object? homeTeamScore = freezed,Object? awayTeamScore = freezed,Object? homeTeamWickets = freezed,Object? awayTeamWickets = freezed,Object? homeTeamBalls = freezed,Object? awayTeamBalls = freezed,Object? homeMatchNum = null,Object? awayMatchNum = null,Object? dls = freezed,Object? status = null,Object? result = freezed,Object? eventNum = freezed,Object? playerPerformances = null,}) {
  return _then(_ActiveMatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchDate: null == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: null == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String,awayTeamId: null == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamAbbreviation: freezed == homeTeamAbbreviation ? _self.homeTeamAbbreviation : homeTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,awayTeamAbbreviation: freezed == awayTeamAbbreviation ? _self.awayTeamAbbreviation : awayTeamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,homeTeamScore: freezed == homeTeamScore ? _self.homeTeamScore : homeTeamScore // ignore: cast_nullable_to_non_nullable
as int?,awayTeamScore: freezed == awayTeamScore ? _self.awayTeamScore : awayTeamScore // ignore: cast_nullable_to_non_nullable
as int?,homeTeamWickets: freezed == homeTeamWickets ? _self.homeTeamWickets : homeTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,awayTeamWickets: freezed == awayTeamWickets ? _self.awayTeamWickets : awayTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBalls: freezed == homeTeamBalls ? _self.homeTeamBalls : homeTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamBalls: freezed == awayTeamBalls ? _self.awayTeamBalls : awayTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,homeMatchNum: null == homeMatchNum ? _self.homeMatchNum : homeMatchNum // ignore: cast_nullable_to_non_nullable
as int,awayMatchNum: null == awayMatchNum ? _self.awayMatchNum : awayMatchNum // ignore: cast_nullable_to_non_nullable
as int,dls: freezed == dls ? _self.dls : dls // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,eventNum: freezed == eventNum ? _self.eventNum : eventNum // ignore: cast_nullable_to_non_nullable
as int?,playerPerformances: null == playerPerformances ? _self._playerPerformances : playerPerformances // ignore: cast_nullable_to_non_nullable
as List<PlayerPerformance>,
  ));
}


}

// dart format on
