// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fantasy_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchScore {

@JsonKey(name: "match_num") int get matchNum;// pg `numeric` → string; parse either form.
@_NumericToDouble()@JsonKey(name: "points") double get points;
/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchScoreCopyWith<MatchScore> get copyWith => _$MatchScoreCopyWithImpl<MatchScore>(this as MatchScore, _$identity);

  /// Serializes this MatchScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchScore&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchNum,points);

@override
String toString() {
  return 'MatchScore(matchNum: $matchNum, points: $points)';
}


}

/// @nodoc
abstract mixin class $MatchScoreCopyWith<$Res>  {
  factory $MatchScoreCopyWith(MatchScore value, $Res Function(MatchScore) _then) = _$MatchScoreCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "match_num") int matchNum,@_NumericToDouble()@JsonKey(name: "points") double points
});




}
/// @nodoc
class _$MatchScoreCopyWithImpl<$Res>
    implements $MatchScoreCopyWith<$Res> {
  _$MatchScoreCopyWithImpl(this._self, this._then);

  final MatchScore _self;
  final $Res Function(MatchScore) _then;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchNum = null,Object? points = null,}) {
  return _then(_self.copyWith(
matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchScore].
extension MatchScorePatterns on MatchScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchScore value)  $default,){
final _that = this;
switch (_that) {
case _MatchScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchScore value)?  $default,){
final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "match_num")  int matchNum, @_NumericToDouble()@JsonKey(name: "points")  double points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
return $default(_that.matchNum,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "match_num")  int matchNum, @_NumericToDouble()@JsonKey(name: "points")  double points)  $default,) {final _that = this;
switch (_that) {
case _MatchScore():
return $default(_that.matchNum,_that.points);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "match_num")  int matchNum, @_NumericToDouble()@JsonKey(name: "points")  double points)?  $default,) {final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
return $default(_that.matchNum,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchScore implements MatchScore {
  const _MatchScore({@JsonKey(name: "match_num") required this.matchNum, @_NumericToDouble()@JsonKey(name: "points") required this.points});
  factory _MatchScore.fromJson(Map<String, dynamic> json) => _$MatchScoreFromJson(json);

@override@JsonKey(name: "match_num") final  int matchNum;
// pg `numeric` → string; parse either form.
@override@_NumericToDouble()@JsonKey(name: "points") final  double points;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchScoreCopyWith<_MatchScore> get copyWith => __$MatchScoreCopyWithImpl<_MatchScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchScore&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchNum,points);

@override
String toString() {
  return 'MatchScore(matchNum: $matchNum, points: $points)';
}


}

/// @nodoc
abstract mixin class _$MatchScoreCopyWith<$Res> implements $MatchScoreCopyWith<$Res> {
  factory _$MatchScoreCopyWith(_MatchScore value, $Res Function(_MatchScore) _then) = __$MatchScoreCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "match_num") int matchNum,@_NumericToDouble()@JsonKey(name: "points") double points
});




}
/// @nodoc
class __$MatchScoreCopyWithImpl<$Res>
    implements _$MatchScoreCopyWith<$Res> {
  __$MatchScoreCopyWithImpl(this._self, this._then);

  final _MatchScore _self;
  final $Res Function(_MatchScore) _then;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchNum = null,Object? points = null,}) {
  return _then(_MatchScore(
matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$FantasyTeam {

@JsonKey(name: "id") String get id;@JsonKey(name: "league_id") String get leagueId;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "team_name") String get teamName;@JsonKey(name: "user_name") String? get userName;// ❗ These can be null in your API → MUST be nullable
@JsonKey(name: "draft_order") int? get draftOrder;@JsonKey(name: "team_color") String? get teamColor;@JsonKey(name: "team_icon") String? get teamIcon;@JsonKey(name: "abbreviation") String? get teamAbbreviation;@JsonKey(name: "created_at") String? get createdAt;// Leaderboard fields — a *superset* present only on GET /leagues/:leagueId.
// The list endpoint (GET /leagues) omits them, so they stay nullable on this
// shared type; the league screen merges the real values in from the detail
// endpoint, where they are always present.
@JsonKey(name: "wins") int? get wins;@JsonKey(name: "losses") int? get losses;@JsonKey(name: "matches_completed") int? get matchesCompleted;// pg `numeric` → string; parse either form.
@_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game") double? get avgPointsPerGame;@JsonKey(name: "match_scores") List<MatchScore>? get matchScores;
/// Create a copy of FantasyTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyTeamCopyWith<FantasyTeam> get copyWith => _$FantasyTeamCopyWithImpl<FantasyTeam>(this as FantasyTeam, _$identity);

  /// Serializes this FantasyTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.draftOrder, draftOrder) || other.draftOrder == draftOrder)&&(identical(other.teamColor, teamColor) || other.teamColor == teamColor)&&(identical(other.teamIcon, teamIcon) || other.teamIcon == teamIcon)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.matchesCompleted, matchesCompleted) || other.matchesCompleted == matchesCompleted)&&(identical(other.avgPointsPerGame, avgPointsPerGame) || other.avgPointsPerGame == avgPointsPerGame)&&const DeepCollectionEquality().equals(other.matchScores, matchScores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,userId,teamName,userName,draftOrder,teamColor,teamIcon,teamAbbreviation,createdAt,wins,losses,matchesCompleted,avgPointsPerGame,const DeepCollectionEquality().hash(matchScores));

@override
String toString() {
  return 'FantasyTeam(id: $id, leagueId: $leagueId, userId: $userId, teamName: $teamName, userName: $userName, draftOrder: $draftOrder, teamColor: $teamColor, teamIcon: $teamIcon, teamAbbreviation: $teamAbbreviation, createdAt: $createdAt, wins: $wins, losses: $losses, matchesCompleted: $matchesCompleted, avgPointsPerGame: $avgPointsPerGame, matchScores: $matchScores)';
}


}

/// @nodoc
abstract mixin class $FantasyTeamCopyWith<$Res>  {
  factory $FantasyTeamCopyWith(FantasyTeam value, $Res Function(FantasyTeam) _then) = _$FantasyTeamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "user_id") String userId,@JsonKey(name: "team_name") String teamName,@JsonKey(name: "user_name") String? userName,@JsonKey(name: "draft_order") int? draftOrder,@JsonKey(name: "team_color") String? teamColor,@JsonKey(name: "team_icon") String? teamIcon,@JsonKey(name: "abbreviation") String? teamAbbreviation,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "wins") int? wins,@JsonKey(name: "losses") int? losses,@JsonKey(name: "matches_completed") int? matchesCompleted,@_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game") double? avgPointsPerGame,@JsonKey(name: "match_scores") List<MatchScore>? matchScores
});




}
/// @nodoc
class _$FantasyTeamCopyWithImpl<$Res>
    implements $FantasyTeamCopyWith<$Res> {
  _$FantasyTeamCopyWithImpl(this._self, this._then);

  final FantasyTeam _self;
  final $Res Function(FantasyTeam) _then;

/// Create a copy of FantasyTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? userId = null,Object? teamName = null,Object? userName = freezed,Object? draftOrder = freezed,Object? teamColor = freezed,Object? teamIcon = freezed,Object? teamAbbreviation = freezed,Object? createdAt = freezed,Object? wins = freezed,Object? losses = freezed,Object? matchesCompleted = freezed,Object? avgPointsPerGame = freezed,Object? matchScores = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,draftOrder: freezed == draftOrder ? _self.draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as int?,teamColor: freezed == teamColor ? _self.teamColor : teamColor // ignore: cast_nullable_to_non_nullable
as String?,teamIcon: freezed == teamIcon ? _self.teamIcon : teamIcon // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,wins: freezed == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int?,losses: freezed == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int?,matchesCompleted: freezed == matchesCompleted ? _self.matchesCompleted : matchesCompleted // ignore: cast_nullable_to_non_nullable
as int?,avgPointsPerGame: freezed == avgPointsPerGame ? _self.avgPointsPerGame : avgPointsPerGame // ignore: cast_nullable_to_non_nullable
as double?,matchScores: freezed == matchScores ? _self.matchScores : matchScores // ignore: cast_nullable_to_non_nullable
as List<MatchScore>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FantasyTeam].
extension FantasyTeamPatterns on FantasyTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FantasyTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FantasyTeam value)  $default,){
final _that = this;
switch (_that) {
case _FantasyTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FantasyTeam value)?  $default,){
final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "team_name")  String teamName, @JsonKey(name: "user_name")  String? userName, @JsonKey(name: "draft_order")  int? draftOrder, @JsonKey(name: "team_color")  String? teamColor, @JsonKey(name: "team_icon")  String? teamIcon, @JsonKey(name: "abbreviation")  String? teamAbbreviation, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "wins")  int? wins, @JsonKey(name: "losses")  int? losses, @JsonKey(name: "matches_completed")  int? matchesCompleted, @_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game")  double? avgPointsPerGame, @JsonKey(name: "match_scores")  List<MatchScore>? matchScores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.userName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.teamAbbreviation,_that.createdAt,_that.wins,_that.losses,_that.matchesCompleted,_that.avgPointsPerGame,_that.matchScores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "team_name")  String teamName, @JsonKey(name: "user_name")  String? userName, @JsonKey(name: "draft_order")  int? draftOrder, @JsonKey(name: "team_color")  String? teamColor, @JsonKey(name: "team_icon")  String? teamIcon, @JsonKey(name: "abbreviation")  String? teamAbbreviation, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "wins")  int? wins, @JsonKey(name: "losses")  int? losses, @JsonKey(name: "matches_completed")  int? matchesCompleted, @_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game")  double? avgPointsPerGame, @JsonKey(name: "match_scores")  List<MatchScore>? matchScores)  $default,) {final _that = this;
switch (_that) {
case _FantasyTeam():
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.userName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.teamAbbreviation,_that.createdAt,_that.wins,_that.losses,_that.matchesCompleted,_that.avgPointsPerGame,_that.matchScores);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "team_name")  String teamName, @JsonKey(name: "user_name")  String? userName, @JsonKey(name: "draft_order")  int? draftOrder, @JsonKey(name: "team_color")  String? teamColor, @JsonKey(name: "team_icon")  String? teamIcon, @JsonKey(name: "abbreviation")  String? teamAbbreviation, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "wins")  int? wins, @JsonKey(name: "losses")  int? losses, @JsonKey(name: "matches_completed")  int? matchesCompleted, @_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game")  double? avgPointsPerGame, @JsonKey(name: "match_scores")  List<MatchScore>? matchScores)?  $default,) {final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.userName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.teamAbbreviation,_that.createdAt,_that.wins,_that.losses,_that.matchesCompleted,_that.avgPointsPerGame,_that.matchScores);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyTeam implements FantasyTeam {
  const _FantasyTeam({@JsonKey(name: "id") required this.id, @JsonKey(name: "league_id") required this.leagueId, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "team_name") required this.teamName, @JsonKey(name: "user_name") this.userName, @JsonKey(name: "draft_order") this.draftOrder, @JsonKey(name: "team_color") this.teamColor, @JsonKey(name: "team_icon") this.teamIcon, @JsonKey(name: "abbreviation") this.teamAbbreviation, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "wins") this.wins, @JsonKey(name: "losses") this.losses, @JsonKey(name: "matches_completed") this.matchesCompleted, @_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game") this.avgPointsPerGame, @JsonKey(name: "match_scores") final  List<MatchScore>? matchScores}): _matchScores = matchScores;
  factory _FantasyTeam.fromJson(Map<String, dynamic> json) => _$FantasyTeamFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "league_id") final  String leagueId;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "team_name") final  String teamName;
@override@JsonKey(name: "user_name") final  String? userName;
// ❗ These can be null in your API → MUST be nullable
@override@JsonKey(name: "draft_order") final  int? draftOrder;
@override@JsonKey(name: "team_color") final  String? teamColor;
@override@JsonKey(name: "team_icon") final  String? teamIcon;
@override@JsonKey(name: "abbreviation") final  String? teamAbbreviation;
@override@JsonKey(name: "created_at") final  String? createdAt;
// Leaderboard fields — a *superset* present only on GET /leagues/:leagueId.
// The list endpoint (GET /leagues) omits them, so they stay nullable on this
// shared type; the league screen merges the real values in from the detail
// endpoint, where they are always present.
@override@JsonKey(name: "wins") final  int? wins;
@override@JsonKey(name: "losses") final  int? losses;
@override@JsonKey(name: "matches_completed") final  int? matchesCompleted;
// pg `numeric` → string; parse either form.
@override@_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game") final  double? avgPointsPerGame;
 final  List<MatchScore>? _matchScores;
@override@JsonKey(name: "match_scores") List<MatchScore>? get matchScores {
  final value = _matchScores;
  if (value == null) return null;
  if (_matchScores is EqualUnmodifiableListView) return _matchScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FantasyTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FantasyTeamCopyWith<_FantasyTeam> get copyWith => __$FantasyTeamCopyWithImpl<_FantasyTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FantasyTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.draftOrder, draftOrder) || other.draftOrder == draftOrder)&&(identical(other.teamColor, teamColor) || other.teamColor == teamColor)&&(identical(other.teamIcon, teamIcon) || other.teamIcon == teamIcon)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.matchesCompleted, matchesCompleted) || other.matchesCompleted == matchesCompleted)&&(identical(other.avgPointsPerGame, avgPointsPerGame) || other.avgPointsPerGame == avgPointsPerGame)&&const DeepCollectionEquality().equals(other._matchScores, _matchScores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,userId,teamName,userName,draftOrder,teamColor,teamIcon,teamAbbreviation,createdAt,wins,losses,matchesCompleted,avgPointsPerGame,const DeepCollectionEquality().hash(_matchScores));

@override
String toString() {
  return 'FantasyTeam(id: $id, leagueId: $leagueId, userId: $userId, teamName: $teamName, userName: $userName, draftOrder: $draftOrder, teamColor: $teamColor, teamIcon: $teamIcon, teamAbbreviation: $teamAbbreviation, createdAt: $createdAt, wins: $wins, losses: $losses, matchesCompleted: $matchesCompleted, avgPointsPerGame: $avgPointsPerGame, matchScores: $matchScores)';
}


}

/// @nodoc
abstract mixin class _$FantasyTeamCopyWith<$Res> implements $FantasyTeamCopyWith<$Res> {
  factory _$FantasyTeamCopyWith(_FantasyTeam value, $Res Function(_FantasyTeam) _then) = __$FantasyTeamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "user_id") String userId,@JsonKey(name: "team_name") String teamName,@JsonKey(name: "user_name") String? userName,@JsonKey(name: "draft_order") int? draftOrder,@JsonKey(name: "team_color") String? teamColor,@JsonKey(name: "team_icon") String? teamIcon,@JsonKey(name: "abbreviation") String? teamAbbreviation,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "wins") int? wins,@JsonKey(name: "losses") int? losses,@JsonKey(name: "matches_completed") int? matchesCompleted,@_NumericToNullableDouble()@JsonKey(name: "avg_points_per_game") double? avgPointsPerGame,@JsonKey(name: "match_scores") List<MatchScore>? matchScores
});




}
/// @nodoc
class __$FantasyTeamCopyWithImpl<$Res>
    implements _$FantasyTeamCopyWith<$Res> {
  __$FantasyTeamCopyWithImpl(this._self, this._then);

  final _FantasyTeam _self;
  final $Res Function(_FantasyTeam) _then;

/// Create a copy of FantasyTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? userId = null,Object? teamName = null,Object? userName = freezed,Object? draftOrder = freezed,Object? teamColor = freezed,Object? teamIcon = freezed,Object? teamAbbreviation = freezed,Object? createdAt = freezed,Object? wins = freezed,Object? losses = freezed,Object? matchesCompleted = freezed,Object? avgPointsPerGame = freezed,Object? matchScores = freezed,}) {
  return _then(_FantasyTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,draftOrder: freezed == draftOrder ? _self.draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as int?,teamColor: freezed == teamColor ? _self.teamColor : teamColor // ignore: cast_nullable_to_non_nullable
as String?,teamIcon: freezed == teamIcon ? _self.teamIcon : teamIcon // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,wins: freezed == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int?,losses: freezed == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int?,matchesCompleted: freezed == matchesCompleted ? _self.matchesCompleted : matchesCompleted // ignore: cast_nullable_to_non_nullable
as int?,avgPointsPerGame: freezed == avgPointsPerGame ? _self.avgPointsPerGame : avgPointsPerGame // ignore: cast_nullable_to_non_nullable
as double?,matchScores: freezed == matchScores ? _self._matchScores : matchScores // ignore: cast_nullable_to_non_nullable
as List<MatchScore>?,
  ));
}


}

// dart format on
