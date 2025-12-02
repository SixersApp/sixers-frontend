// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fantasy_player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FantasyPlayer {

@JsonKey(name: "player_season_id", defaultValue: "") String get playerSeasonId;@JsonKey(name: "player_id", defaultValue: "") String get playerId;@JsonKey(name: "performance_id", defaultValue: "") String get performanceId;@JsonKey(name: "runs_scored", defaultValue: 0) int get runsScored;@JsonKey(name: "balls_faced", defaultValue: 0) int get ballsFaced;@JsonKey(name: "fours", defaultValue: 0) int get fours;@JsonKey(name: "sixes", defaultValue: 0) int get sixes;@JsonKey(name: "runs_conceded", defaultValue: 0) int get runsConceded;@JsonKey(name: "balls_bowled", defaultValue: 0) int get ballsBowled;@JsonKey(name: "wickets_taken", defaultValue: 0) int get wicketsTaken;@JsonKey(name: "catches", defaultValue: 0) int get catches;@JsonKey(name: "dismissals", defaultValue: 0) int get dismissals;@JsonKey(name: "caught_behinds", defaultValue: 0) int get caughtBehinds;@JsonKey(name: "wides_bowled", defaultValue: 0) int get widesBowled;@JsonKey(name: "byes_bowled", defaultValue: 0) int get byesBowled;@JsonKey(name: "run_outs", defaultValue: 0) int get runOuts;@JsonKey(name: "no_balls_bowled", defaultValue: 0) int get noBallsBowled;@JsonKey(name: "catches_dropped", defaultValue: 0) int get catchesDropped;@JsonKey(name: "inserted_at") DateTime? get insertedAt;@JsonKey(name: "home_team_id", defaultValue: "") String get homeTeamId;@JsonKey(name: "home_team_name", defaultValue: "") String get homeTeamName;@JsonKey(name: "home_team_image", defaultValue: "") String get homeTeamImage;@JsonKey(name: "away_team_id", defaultValue: "") String get awayTeamId;@JsonKey(name: "away_team_name", defaultValue: "") String get awayTeamName;@JsonKey(name: "away_team_image", defaultValue: "") String get awayTeamImage;@JsonKey(name: "fantasy_points", defaultValue: 0) int get fantasyPoints;
/// Create a copy of FantasyPlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyPlayerCopyWith<FantasyPlayer> get copyWith => _$FantasyPlayerCopyWithImpl<FantasyPlayer>(this as FantasyPlayer, _$identity);

  /// Serializes this FantasyPlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyPlayer&&(identical(other.playerSeasonId, playerSeasonId) || other.playerSeasonId == playerSeasonId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.dismissals, dismissals) || other.dismissals == dismissals)&&(identical(other.caughtBehinds, caughtBehinds) || other.caughtBehinds == caughtBehinds)&&(identical(other.widesBowled, widesBowled) || other.widesBowled == widesBowled)&&(identical(other.byesBowled, byesBowled) || other.byesBowled == byesBowled)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.noBallsBowled, noBallsBowled) || other.noBallsBowled == noBallsBowled)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.insertedAt, insertedAt) || other.insertedAt == insertedAt)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.fantasyPoints, fantasyPoints) || other.fantasyPoints == fantasyPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerSeasonId,playerId,performanceId,runsScored,ballsFaced,fours,sixes,runsConceded,ballsBowled,wicketsTaken,catches,dismissals,caughtBehinds,widesBowled,byesBowled,runOuts,noBallsBowled,catchesDropped,insertedAt,homeTeamId,homeTeamName,homeTeamImage,awayTeamId,awayTeamName,awayTeamImage,fantasyPoints]);

@override
String toString() {
  return 'FantasyPlayer(playerSeasonId: $playerSeasonId, playerId: $playerId, performanceId: $performanceId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, runsConceded: $runsConceded, ballsBowled: $ballsBowled, wicketsTaken: $wicketsTaken, catches: $catches, dismissals: $dismissals, caughtBehinds: $caughtBehinds, widesBowled: $widesBowled, byesBowled: $byesBowled, runOuts: $runOuts, noBallsBowled: $noBallsBowled, catchesDropped: $catchesDropped, insertedAt: $insertedAt, homeTeamId: $homeTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamId: $awayTeamId, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, fantasyPoints: $fantasyPoints)';
}


}

/// @nodoc
abstract mixin class $FantasyPlayerCopyWith<$Res>  {
  factory $FantasyPlayerCopyWith(FantasyPlayer value, $Res Function(FantasyPlayer) _then) = _$FantasyPlayerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "player_season_id", defaultValue: "") String playerSeasonId,@JsonKey(name: "player_id", defaultValue: "") String playerId,@JsonKey(name: "performance_id", defaultValue: "") String performanceId,@JsonKey(name: "runs_scored", defaultValue: 0) int runsScored,@JsonKey(name: "balls_faced", defaultValue: 0) int ballsFaced,@JsonKey(name: "fours", defaultValue: 0) int fours,@JsonKey(name: "sixes", defaultValue: 0) int sixes,@JsonKey(name: "runs_conceded", defaultValue: 0) int runsConceded,@JsonKey(name: "balls_bowled", defaultValue: 0) int ballsBowled,@JsonKey(name: "wickets_taken", defaultValue: 0) int wicketsTaken,@JsonKey(name: "catches", defaultValue: 0) int catches,@JsonKey(name: "dismissals", defaultValue: 0) int dismissals,@JsonKey(name: "caught_behinds", defaultValue: 0) int caughtBehinds,@JsonKey(name: "wides_bowled", defaultValue: 0) int widesBowled,@JsonKey(name: "byes_bowled", defaultValue: 0) int byesBowled,@JsonKey(name: "run_outs", defaultValue: 0) int runOuts,@JsonKey(name: "no_balls_bowled", defaultValue: 0) int noBallsBowled,@JsonKey(name: "catches_dropped", defaultValue: 0) int catchesDropped,@JsonKey(name: "inserted_at") DateTime? insertedAt,@JsonKey(name: "home_team_id", defaultValue: "") String homeTeamId,@JsonKey(name: "home_team_name", defaultValue: "") String homeTeamName,@JsonKey(name: "home_team_image", defaultValue: "") String homeTeamImage,@JsonKey(name: "away_team_id", defaultValue: "") String awayTeamId,@JsonKey(name: "away_team_name", defaultValue: "") String awayTeamName,@JsonKey(name: "away_team_image", defaultValue: "") String awayTeamImage,@JsonKey(name: "fantasy_points", defaultValue: 0) int fantasyPoints
});




}
/// @nodoc
class _$FantasyPlayerCopyWithImpl<$Res>
    implements $FantasyPlayerCopyWith<$Res> {
  _$FantasyPlayerCopyWithImpl(this._self, this._then);

  final FantasyPlayer _self;
  final $Res Function(FantasyPlayer) _then;

/// Create a copy of FantasyPlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerSeasonId = null,Object? playerId = null,Object? performanceId = null,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? runsConceded = null,Object? ballsBowled = null,Object? wicketsTaken = null,Object? catches = null,Object? dismissals = null,Object? caughtBehinds = null,Object? widesBowled = null,Object? byesBowled = null,Object? runOuts = null,Object? noBallsBowled = null,Object? catchesDropped = null,Object? insertedAt = freezed,Object? homeTeamId = null,Object? homeTeamName = null,Object? homeTeamImage = null,Object? awayTeamId = null,Object? awayTeamName = null,Object? awayTeamImage = null,Object? fantasyPoints = null,}) {
  return _then(_self.copyWith(
playerSeasonId: null == playerSeasonId ? _self.playerSeasonId : playerSeasonId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,performanceId: null == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as String,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,runsConceded: null == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: null == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int,wicketsTaken: null == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int,catches: null == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int,dismissals: null == dismissals ? _self.dismissals : dismissals // ignore: cast_nullable_to_non_nullable
as int,caughtBehinds: null == caughtBehinds ? _self.caughtBehinds : caughtBehinds // ignore: cast_nullable_to_non_nullable
as int,widesBowled: null == widesBowled ? _self.widesBowled : widesBowled // ignore: cast_nullable_to_non_nullable
as int,byesBowled: null == byesBowled ? _self.byesBowled : byesBowled // ignore: cast_nullable_to_non_nullable
as int,runOuts: null == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int,noBallsBowled: null == noBallsBowled ? _self.noBallsBowled : noBallsBowled // ignore: cast_nullable_to_non_nullable
as int,catchesDropped: null == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int,insertedAt: freezed == insertedAt ? _self.insertedAt : insertedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,homeTeamId: null == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: null == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String,homeTeamImage: null == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String,awayTeamId: null == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String,awayTeamName: null == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String,awayTeamImage: null == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String,fantasyPoints: null == fantasyPoints ? _self.fantasyPoints : fantasyPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FantasyPlayer].
extension FantasyPlayerPatterns on FantasyPlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FantasyPlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FantasyPlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FantasyPlayer value)  $default,){
final _that = this;
switch (_that) {
case _FantasyPlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FantasyPlayer value)?  $default,){
final _that = this;
switch (_that) {
case _FantasyPlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "player_season_id", defaultValue: "")  String playerSeasonId, @JsonKey(name: "player_id", defaultValue: "")  String playerId, @JsonKey(name: "performance_id", defaultValue: "")  String performanceId, @JsonKey(name: "runs_scored", defaultValue: 0)  int runsScored, @JsonKey(name: "balls_faced", defaultValue: 0)  int ballsFaced, @JsonKey(name: "fours", defaultValue: 0)  int fours, @JsonKey(name: "sixes", defaultValue: 0)  int sixes, @JsonKey(name: "runs_conceded", defaultValue: 0)  int runsConceded, @JsonKey(name: "balls_bowled", defaultValue: 0)  int ballsBowled, @JsonKey(name: "wickets_taken", defaultValue: 0)  int wicketsTaken, @JsonKey(name: "catches", defaultValue: 0)  int catches, @JsonKey(name: "dismissals", defaultValue: 0)  int dismissals, @JsonKey(name: "caught_behinds", defaultValue: 0)  int caughtBehinds, @JsonKey(name: "wides_bowled", defaultValue: 0)  int widesBowled, @JsonKey(name: "byes_bowled", defaultValue: 0)  int byesBowled, @JsonKey(name: "run_outs", defaultValue: 0)  int runOuts, @JsonKey(name: "no_balls_bowled", defaultValue: 0)  int noBallsBowled, @JsonKey(name: "catches_dropped", defaultValue: 0)  int catchesDropped, @JsonKey(name: "inserted_at")  DateTime? insertedAt, @JsonKey(name: "home_team_id", defaultValue: "")  String homeTeamId, @JsonKey(name: "home_team_name", defaultValue: "")  String homeTeamName, @JsonKey(name: "home_team_image", defaultValue: "")  String homeTeamImage, @JsonKey(name: "away_team_id", defaultValue: "")  String awayTeamId, @JsonKey(name: "away_team_name", defaultValue: "")  String awayTeamName, @JsonKey(name: "away_team_image", defaultValue: "")  String awayTeamImage, @JsonKey(name: "fantasy_points", defaultValue: 0)  int fantasyPoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyPlayer() when $default != null:
return $default(_that.playerSeasonId,_that.playerId,_that.performanceId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.runsConceded,_that.ballsBowled,_that.wicketsTaken,_that.catches,_that.dismissals,_that.caughtBehinds,_that.widesBowled,_that.byesBowled,_that.runOuts,_that.noBallsBowled,_that.catchesDropped,_that.insertedAt,_that.homeTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamId,_that.awayTeamName,_that.awayTeamImage,_that.fantasyPoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "player_season_id", defaultValue: "")  String playerSeasonId, @JsonKey(name: "player_id", defaultValue: "")  String playerId, @JsonKey(name: "performance_id", defaultValue: "")  String performanceId, @JsonKey(name: "runs_scored", defaultValue: 0)  int runsScored, @JsonKey(name: "balls_faced", defaultValue: 0)  int ballsFaced, @JsonKey(name: "fours", defaultValue: 0)  int fours, @JsonKey(name: "sixes", defaultValue: 0)  int sixes, @JsonKey(name: "runs_conceded", defaultValue: 0)  int runsConceded, @JsonKey(name: "balls_bowled", defaultValue: 0)  int ballsBowled, @JsonKey(name: "wickets_taken", defaultValue: 0)  int wicketsTaken, @JsonKey(name: "catches", defaultValue: 0)  int catches, @JsonKey(name: "dismissals", defaultValue: 0)  int dismissals, @JsonKey(name: "caught_behinds", defaultValue: 0)  int caughtBehinds, @JsonKey(name: "wides_bowled", defaultValue: 0)  int widesBowled, @JsonKey(name: "byes_bowled", defaultValue: 0)  int byesBowled, @JsonKey(name: "run_outs", defaultValue: 0)  int runOuts, @JsonKey(name: "no_balls_bowled", defaultValue: 0)  int noBallsBowled, @JsonKey(name: "catches_dropped", defaultValue: 0)  int catchesDropped, @JsonKey(name: "inserted_at")  DateTime? insertedAt, @JsonKey(name: "home_team_id", defaultValue: "")  String homeTeamId, @JsonKey(name: "home_team_name", defaultValue: "")  String homeTeamName, @JsonKey(name: "home_team_image", defaultValue: "")  String homeTeamImage, @JsonKey(name: "away_team_id", defaultValue: "")  String awayTeamId, @JsonKey(name: "away_team_name", defaultValue: "")  String awayTeamName, @JsonKey(name: "away_team_image", defaultValue: "")  String awayTeamImage, @JsonKey(name: "fantasy_points", defaultValue: 0)  int fantasyPoints)  $default,) {final _that = this;
switch (_that) {
case _FantasyPlayer():
return $default(_that.playerSeasonId,_that.playerId,_that.performanceId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.runsConceded,_that.ballsBowled,_that.wicketsTaken,_that.catches,_that.dismissals,_that.caughtBehinds,_that.widesBowled,_that.byesBowled,_that.runOuts,_that.noBallsBowled,_that.catchesDropped,_that.insertedAt,_that.homeTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamId,_that.awayTeamName,_that.awayTeamImage,_that.fantasyPoints);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "player_season_id", defaultValue: "")  String playerSeasonId, @JsonKey(name: "player_id", defaultValue: "")  String playerId, @JsonKey(name: "performance_id", defaultValue: "")  String performanceId, @JsonKey(name: "runs_scored", defaultValue: 0)  int runsScored, @JsonKey(name: "balls_faced", defaultValue: 0)  int ballsFaced, @JsonKey(name: "fours", defaultValue: 0)  int fours, @JsonKey(name: "sixes", defaultValue: 0)  int sixes, @JsonKey(name: "runs_conceded", defaultValue: 0)  int runsConceded, @JsonKey(name: "balls_bowled", defaultValue: 0)  int ballsBowled, @JsonKey(name: "wickets_taken", defaultValue: 0)  int wicketsTaken, @JsonKey(name: "catches", defaultValue: 0)  int catches, @JsonKey(name: "dismissals", defaultValue: 0)  int dismissals, @JsonKey(name: "caught_behinds", defaultValue: 0)  int caughtBehinds, @JsonKey(name: "wides_bowled", defaultValue: 0)  int widesBowled, @JsonKey(name: "byes_bowled", defaultValue: 0)  int byesBowled, @JsonKey(name: "run_outs", defaultValue: 0)  int runOuts, @JsonKey(name: "no_balls_bowled", defaultValue: 0)  int noBallsBowled, @JsonKey(name: "catches_dropped", defaultValue: 0)  int catchesDropped, @JsonKey(name: "inserted_at")  DateTime? insertedAt, @JsonKey(name: "home_team_id", defaultValue: "")  String homeTeamId, @JsonKey(name: "home_team_name", defaultValue: "")  String homeTeamName, @JsonKey(name: "home_team_image", defaultValue: "")  String homeTeamImage, @JsonKey(name: "away_team_id", defaultValue: "")  String awayTeamId, @JsonKey(name: "away_team_name", defaultValue: "")  String awayTeamName, @JsonKey(name: "away_team_image", defaultValue: "")  String awayTeamImage, @JsonKey(name: "fantasy_points", defaultValue: 0)  int fantasyPoints)?  $default,) {final _that = this;
switch (_that) {
case _FantasyPlayer() when $default != null:
return $default(_that.playerSeasonId,_that.playerId,_that.performanceId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.runsConceded,_that.ballsBowled,_that.wicketsTaken,_that.catches,_that.dismissals,_that.caughtBehinds,_that.widesBowled,_that.byesBowled,_that.runOuts,_that.noBallsBowled,_that.catchesDropped,_that.insertedAt,_that.homeTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamId,_that.awayTeamName,_that.awayTeamImage,_that.fantasyPoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyPlayer implements FantasyPlayer {
  const _FantasyPlayer({@JsonKey(name: "player_season_id", defaultValue: "") required this.playerSeasonId, @JsonKey(name: "player_id", defaultValue: "") required this.playerId, @JsonKey(name: "performance_id", defaultValue: "") required this.performanceId, @JsonKey(name: "runs_scored", defaultValue: 0) this.runsScored = 0, @JsonKey(name: "balls_faced", defaultValue: 0) this.ballsFaced = 0, @JsonKey(name: "fours", defaultValue: 0) this.fours = 0, @JsonKey(name: "sixes", defaultValue: 0) this.sixes = 0, @JsonKey(name: "runs_conceded", defaultValue: 0) this.runsConceded = 0, @JsonKey(name: "balls_bowled", defaultValue: 0) this.ballsBowled = 0, @JsonKey(name: "wickets_taken", defaultValue: 0) this.wicketsTaken = 0, @JsonKey(name: "catches", defaultValue: 0) this.catches = 0, @JsonKey(name: "dismissals", defaultValue: 0) this.dismissals = 0, @JsonKey(name: "caught_behinds", defaultValue: 0) this.caughtBehinds = 0, @JsonKey(name: "wides_bowled", defaultValue: 0) this.widesBowled = 0, @JsonKey(name: "byes_bowled", defaultValue: 0) this.byesBowled = 0, @JsonKey(name: "run_outs", defaultValue: 0) this.runOuts = 0, @JsonKey(name: "no_balls_bowled", defaultValue: 0) this.noBallsBowled = 0, @JsonKey(name: "catches_dropped", defaultValue: 0) this.catchesDropped = 0, @JsonKey(name: "inserted_at") this.insertedAt, @JsonKey(name: "home_team_id", defaultValue: "") this.homeTeamId = "", @JsonKey(name: "home_team_name", defaultValue: "") this.homeTeamName = "", @JsonKey(name: "home_team_image", defaultValue: "") this.homeTeamImage = "", @JsonKey(name: "away_team_id", defaultValue: "") this.awayTeamId = "", @JsonKey(name: "away_team_name", defaultValue: "") this.awayTeamName = "", @JsonKey(name: "away_team_image", defaultValue: "") this.awayTeamImage = "", @JsonKey(name: "fantasy_points", defaultValue: 0) this.fantasyPoints = 0});
  factory _FantasyPlayer.fromJson(Map<String, dynamic> json) => _$FantasyPlayerFromJson(json);

@override@JsonKey(name: "player_season_id", defaultValue: "") final  String playerSeasonId;
@override@JsonKey(name: "player_id", defaultValue: "") final  String playerId;
@override@JsonKey(name: "performance_id", defaultValue: "") final  String performanceId;
@override@JsonKey(name: "runs_scored", defaultValue: 0) final  int runsScored;
@override@JsonKey(name: "balls_faced", defaultValue: 0) final  int ballsFaced;
@override@JsonKey(name: "fours", defaultValue: 0) final  int fours;
@override@JsonKey(name: "sixes", defaultValue: 0) final  int sixes;
@override@JsonKey(name: "runs_conceded", defaultValue: 0) final  int runsConceded;
@override@JsonKey(name: "balls_bowled", defaultValue: 0) final  int ballsBowled;
@override@JsonKey(name: "wickets_taken", defaultValue: 0) final  int wicketsTaken;
@override@JsonKey(name: "catches", defaultValue: 0) final  int catches;
@override@JsonKey(name: "dismissals", defaultValue: 0) final  int dismissals;
@override@JsonKey(name: "caught_behinds", defaultValue: 0) final  int caughtBehinds;
@override@JsonKey(name: "wides_bowled", defaultValue: 0) final  int widesBowled;
@override@JsonKey(name: "byes_bowled", defaultValue: 0) final  int byesBowled;
@override@JsonKey(name: "run_outs", defaultValue: 0) final  int runOuts;
@override@JsonKey(name: "no_balls_bowled", defaultValue: 0) final  int noBallsBowled;
@override@JsonKey(name: "catches_dropped", defaultValue: 0) final  int catchesDropped;
@override@JsonKey(name: "inserted_at") final  DateTime? insertedAt;
@override@JsonKey(name: "home_team_id", defaultValue: "") final  String homeTeamId;
@override@JsonKey(name: "home_team_name", defaultValue: "") final  String homeTeamName;
@override@JsonKey(name: "home_team_image", defaultValue: "") final  String homeTeamImage;
@override@JsonKey(name: "away_team_id", defaultValue: "") final  String awayTeamId;
@override@JsonKey(name: "away_team_name", defaultValue: "") final  String awayTeamName;
@override@JsonKey(name: "away_team_image", defaultValue: "") final  String awayTeamImage;
@override@JsonKey(name: "fantasy_points", defaultValue: 0) final  int fantasyPoints;

/// Create a copy of FantasyPlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FantasyPlayerCopyWith<_FantasyPlayer> get copyWith => __$FantasyPlayerCopyWithImpl<_FantasyPlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FantasyPlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyPlayer&&(identical(other.playerSeasonId, playerSeasonId) || other.playerSeasonId == playerSeasonId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.catches, catches) || other.catches == catches)&&(identical(other.dismissals, dismissals) || other.dismissals == dismissals)&&(identical(other.caughtBehinds, caughtBehinds) || other.caughtBehinds == caughtBehinds)&&(identical(other.widesBowled, widesBowled) || other.widesBowled == widesBowled)&&(identical(other.byesBowled, byesBowled) || other.byesBowled == byesBowled)&&(identical(other.runOuts, runOuts) || other.runOuts == runOuts)&&(identical(other.noBallsBowled, noBallsBowled) || other.noBallsBowled == noBallsBowled)&&(identical(other.catchesDropped, catchesDropped) || other.catchesDropped == catchesDropped)&&(identical(other.insertedAt, insertedAt) || other.insertedAt == insertedAt)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.fantasyPoints, fantasyPoints) || other.fantasyPoints == fantasyPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerSeasonId,playerId,performanceId,runsScored,ballsFaced,fours,sixes,runsConceded,ballsBowled,wicketsTaken,catches,dismissals,caughtBehinds,widesBowled,byesBowled,runOuts,noBallsBowled,catchesDropped,insertedAt,homeTeamId,homeTeamName,homeTeamImage,awayTeamId,awayTeamName,awayTeamImage,fantasyPoints]);

@override
String toString() {
  return 'FantasyPlayer(playerSeasonId: $playerSeasonId, playerId: $playerId, performanceId: $performanceId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, runsConceded: $runsConceded, ballsBowled: $ballsBowled, wicketsTaken: $wicketsTaken, catches: $catches, dismissals: $dismissals, caughtBehinds: $caughtBehinds, widesBowled: $widesBowled, byesBowled: $byesBowled, runOuts: $runOuts, noBallsBowled: $noBallsBowled, catchesDropped: $catchesDropped, insertedAt: $insertedAt, homeTeamId: $homeTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamId: $awayTeamId, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, fantasyPoints: $fantasyPoints)';
}


}

/// @nodoc
abstract mixin class _$FantasyPlayerCopyWith<$Res> implements $FantasyPlayerCopyWith<$Res> {
  factory _$FantasyPlayerCopyWith(_FantasyPlayer value, $Res Function(_FantasyPlayer) _then) = __$FantasyPlayerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "player_season_id", defaultValue: "") String playerSeasonId,@JsonKey(name: "player_id", defaultValue: "") String playerId,@JsonKey(name: "performance_id", defaultValue: "") String performanceId,@JsonKey(name: "runs_scored", defaultValue: 0) int runsScored,@JsonKey(name: "balls_faced", defaultValue: 0) int ballsFaced,@JsonKey(name: "fours", defaultValue: 0) int fours,@JsonKey(name: "sixes", defaultValue: 0) int sixes,@JsonKey(name: "runs_conceded", defaultValue: 0) int runsConceded,@JsonKey(name: "balls_bowled", defaultValue: 0) int ballsBowled,@JsonKey(name: "wickets_taken", defaultValue: 0) int wicketsTaken,@JsonKey(name: "catches", defaultValue: 0) int catches,@JsonKey(name: "dismissals", defaultValue: 0) int dismissals,@JsonKey(name: "caught_behinds", defaultValue: 0) int caughtBehinds,@JsonKey(name: "wides_bowled", defaultValue: 0) int widesBowled,@JsonKey(name: "byes_bowled", defaultValue: 0) int byesBowled,@JsonKey(name: "run_outs", defaultValue: 0) int runOuts,@JsonKey(name: "no_balls_bowled", defaultValue: 0) int noBallsBowled,@JsonKey(name: "catches_dropped", defaultValue: 0) int catchesDropped,@JsonKey(name: "inserted_at") DateTime? insertedAt,@JsonKey(name: "home_team_id", defaultValue: "") String homeTeamId,@JsonKey(name: "home_team_name", defaultValue: "") String homeTeamName,@JsonKey(name: "home_team_image", defaultValue: "") String homeTeamImage,@JsonKey(name: "away_team_id", defaultValue: "") String awayTeamId,@JsonKey(name: "away_team_name", defaultValue: "") String awayTeamName,@JsonKey(name: "away_team_image", defaultValue: "") String awayTeamImage,@JsonKey(name: "fantasy_points", defaultValue: 0) int fantasyPoints
});




}
/// @nodoc
class __$FantasyPlayerCopyWithImpl<$Res>
    implements _$FantasyPlayerCopyWith<$Res> {
  __$FantasyPlayerCopyWithImpl(this._self, this._then);

  final _FantasyPlayer _self;
  final $Res Function(_FantasyPlayer) _then;

/// Create a copy of FantasyPlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerSeasonId = null,Object? playerId = null,Object? performanceId = null,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? runsConceded = null,Object? ballsBowled = null,Object? wicketsTaken = null,Object? catches = null,Object? dismissals = null,Object? caughtBehinds = null,Object? widesBowled = null,Object? byesBowled = null,Object? runOuts = null,Object? noBallsBowled = null,Object? catchesDropped = null,Object? insertedAt = freezed,Object? homeTeamId = null,Object? homeTeamName = null,Object? homeTeamImage = null,Object? awayTeamId = null,Object? awayTeamName = null,Object? awayTeamImage = null,Object? fantasyPoints = null,}) {
  return _then(_FantasyPlayer(
playerSeasonId: null == playerSeasonId ? _self.playerSeasonId : playerSeasonId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,performanceId: null == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as String,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,runsConceded: null == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: null == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int,wicketsTaken: null == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int,catches: null == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as int,dismissals: null == dismissals ? _self.dismissals : dismissals // ignore: cast_nullable_to_non_nullable
as int,caughtBehinds: null == caughtBehinds ? _self.caughtBehinds : caughtBehinds // ignore: cast_nullable_to_non_nullable
as int,widesBowled: null == widesBowled ? _self.widesBowled : widesBowled // ignore: cast_nullable_to_non_nullable
as int,byesBowled: null == byesBowled ? _self.byesBowled : byesBowled // ignore: cast_nullable_to_non_nullable
as int,runOuts: null == runOuts ? _self.runOuts : runOuts // ignore: cast_nullable_to_non_nullable
as int,noBallsBowled: null == noBallsBowled ? _self.noBallsBowled : noBallsBowled // ignore: cast_nullable_to_non_nullable
as int,catchesDropped: null == catchesDropped ? _self.catchesDropped : catchesDropped // ignore: cast_nullable_to_non_nullable
as int,insertedAt: freezed == insertedAt ? _self.insertedAt : insertedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,homeTeamId: null == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String,homeTeamName: null == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String,homeTeamImage: null == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String,awayTeamId: null == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String,awayTeamName: null == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String,awayTeamImage: null == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String,fantasyPoints: null == fantasyPoints ? _self.fantasyPoints : fantasyPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
