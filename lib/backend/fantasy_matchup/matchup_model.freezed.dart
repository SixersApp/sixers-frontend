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

 String get id;@JsonKey(name: "league_id") String get leagueId;@JsonKey(name: "match_num") int get matchNum;@JsonKey(name: "fantasy_team_instance1_id") String get teamInstance1Id;@JsonKey(name: "fantasy_team_instance2_id") String get teamInstance2Id;@JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? get team1Score;@JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? get team2Score;@JsonKey(name: "fantasy_winner_team_instance_id") String? get winnerTeamInstanceId;// Nested optional models
 FantasyTeamInstance? get team1; FantasyTeamInstance? get team2;
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupCopyWith<Matchup> get copyWith => _$MatchupCopyWithImpl<Matchup>(this as Matchup, _$identity);

  /// Serializes this Matchup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.teamInstance1Id, teamInstance1Id) || other.teamInstance1Id == teamInstance1Id)&&(identical(other.teamInstance2Id, teamInstance2Id) || other.teamInstance2Id == teamInstance2Id)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.winnerTeamInstanceId, winnerTeamInstanceId) || other.winnerTeamInstanceId == winnerTeamInstanceId)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,teamInstance1Id,teamInstance2Id,team1Score,team2Score,winnerTeamInstanceId,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, teamInstance1Id: $teamInstance1Id, teamInstance2Id: $teamInstance2Id, team1Score: $team1Score, team2Score: $team2Score, winnerTeamInstanceId: $winnerTeamInstanceId, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class $MatchupCopyWith<$Res>  {
  factory $MatchupCopyWith(Matchup value, $Res Function(Matchup) _then) = _$MatchupCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "match_num") int matchNum,@JsonKey(name: "fantasy_team_instance1_id") String teamInstance1Id,@JsonKey(name: "fantasy_team_instance2_id") String teamInstance2Id,@JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? team1Score,@JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? team2Score,@JsonKey(name: "fantasy_winner_team_instance_id") String? winnerTeamInstanceId, FantasyTeamInstance? team1, FantasyTeamInstance? team2
});


$FantasyTeamInstanceCopyWith<$Res>? get team1;$FantasyTeamInstanceCopyWith<$Res>? get team2;

}
/// @nodoc
class _$MatchupCopyWithImpl<$Res>
    implements $MatchupCopyWith<$Res> {
  _$MatchupCopyWithImpl(this._self, this._then);

  final Matchup _self;
  final $Res Function(Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? teamInstance1Id = null,Object? teamInstance2Id = null,Object? team1Score = freezed,Object? team2Score = freezed,Object? winnerTeamInstanceId = freezed,Object? team1 = freezed,Object? team2 = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,teamInstance1Id: null == teamInstance1Id ? _self.teamInstance1Id : teamInstance1Id // ignore: cast_nullable_to_non_nullable
as String,teamInstance2Id: null == teamInstance2Id ? _self.teamInstance2Id : teamInstance2Id // ignore: cast_nullable_to_non_nullable
as String,team1Score: freezed == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as double?,team2Score: freezed == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as double?,winnerTeamInstanceId: freezed == winnerTeamInstanceId ? _self.winnerTeamInstanceId : winnerTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String?,team1: freezed == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
as FantasyTeamInstance?,team2: freezed == team2 ? _self.team2 : team2 // ignore: cast_nullable_to_non_nullable
as FantasyTeamInstance?,
  ));
}
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<$Res>? get team1 {
    if (_self.team1 == null) {
    return null;
  }

  return $FantasyTeamInstanceCopyWith<$Res>(_self.team1!, (value) {
    return _then(_self.copyWith(team1: value));
  });
}/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<$Res>? get team2 {
    if (_self.team2 == null) {
    return null;
  }

  return $FantasyTeamInstanceCopyWith<$Res>(_self.team2!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "match_num")  int matchNum, @JsonKey(name: "fantasy_team_instance1_id")  String teamInstance1Id, @JsonKey(name: "fantasy_team_instance2_id")  String teamInstance2Id, @JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team1Score, @JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team2Score, @JsonKey(name: "fantasy_winner_team_instance_id")  String? winnerTeamInstanceId,  FantasyTeamInstance? team1,  FantasyTeamInstance? team2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.teamInstance1Id,_that.teamInstance2Id,_that.team1Score,_that.team2Score,_that.winnerTeamInstanceId,_that.team1,_that.team2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "match_num")  int matchNum, @JsonKey(name: "fantasy_team_instance1_id")  String teamInstance1Id, @JsonKey(name: "fantasy_team_instance2_id")  String teamInstance2Id, @JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team1Score, @JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team2Score, @JsonKey(name: "fantasy_winner_team_instance_id")  String? winnerTeamInstanceId,  FantasyTeamInstance? team1,  FantasyTeamInstance? team2)  $default,) {final _that = this;
switch (_that) {
case _Matchup():
return $default(_that.id,_that.leagueId,_that.matchNum,_that.teamInstance1Id,_that.teamInstance2Id,_that.team1Score,_that.team2Score,_that.winnerTeamInstanceId,_that.team1,_that.team2);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "match_num")  int matchNum, @JsonKey(name: "fantasy_team_instance1_id")  String teamInstance1Id, @JsonKey(name: "fantasy_team_instance2_id")  String teamInstance2Id, @JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team1Score, @JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson)  double? team2Score, @JsonKey(name: "fantasy_winner_team_instance_id")  String? winnerTeamInstanceId,  FantasyTeamInstance? team1,  FantasyTeamInstance? team2)?  $default,) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.teamInstance1Id,_that.teamInstance2Id,_that.team1Score,_that.team2Score,_that.winnerTeamInstanceId,_that.team1,_that.team2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matchup implements Matchup {
  const _Matchup({required this.id, @JsonKey(name: "league_id") required this.leagueId, @JsonKey(name: "match_num") required this.matchNum, @JsonKey(name: "fantasy_team_instance1_id") required this.teamInstance1Id, @JsonKey(name: "fantasy_team_instance2_id") required this.teamInstance2Id, @JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson) this.team1Score, @JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson) this.team2Score, @JsonKey(name: "fantasy_winner_team_instance_id") this.winnerTeamInstanceId, this.team1, this.team2});
  factory _Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);

@override final  String id;
@override@JsonKey(name: "league_id") final  String leagueId;
@override@JsonKey(name: "match_num") final  int matchNum;
@override@JsonKey(name: "fantasy_team_instance1_id") final  String teamInstance1Id;
@override@JsonKey(name: "fantasy_team_instance2_id") final  String teamInstance2Id;
@override@JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson) final  double? team1Score;
@override@JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson) final  double? team2Score;
@override@JsonKey(name: "fantasy_winner_team_instance_id") final  String? winnerTeamInstanceId;
// Nested optional models
@override final  FantasyTeamInstance? team1;
@override final  FantasyTeamInstance? team2;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.teamInstance1Id, teamInstance1Id) || other.teamInstance1Id == teamInstance1Id)&&(identical(other.teamInstance2Id, teamInstance2Id) || other.teamInstance2Id == teamInstance2Id)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.winnerTeamInstanceId, winnerTeamInstanceId) || other.winnerTeamInstanceId == winnerTeamInstanceId)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,teamInstance1Id,teamInstance2Id,team1Score,team2Score,winnerTeamInstanceId,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, teamInstance1Id: $teamInstance1Id, teamInstance2Id: $teamInstance2Id, team1Score: $team1Score, team2Score: $team2Score, winnerTeamInstanceId: $winnerTeamInstanceId, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class _$MatchupCopyWith<$Res> implements $MatchupCopyWith<$Res> {
  factory _$MatchupCopyWith(_Matchup value, $Res Function(_Matchup) _then) = __$MatchupCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "match_num") int matchNum,@JsonKey(name: "fantasy_team_instance1_id") String teamInstance1Id,@JsonKey(name: "fantasy_team_instance2_id") String teamInstance2Id,@JsonKey(name: "fantasy_team_instance1_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? team1Score,@JsonKey(name: "fantasy_team_instance2_score", fromJson: _doubleFromJson, toJson: _doubleToJson) double? team2Score,@JsonKey(name: "fantasy_winner_team_instance_id") String? winnerTeamInstanceId, FantasyTeamInstance? team1, FantasyTeamInstance? team2
});


@override $FantasyTeamInstanceCopyWith<$Res>? get team1;@override $FantasyTeamInstanceCopyWith<$Res>? get team2;

}
/// @nodoc
class __$MatchupCopyWithImpl<$Res>
    implements _$MatchupCopyWith<$Res> {
  __$MatchupCopyWithImpl(this._self, this._then);

  final _Matchup _self;
  final $Res Function(_Matchup) _then;

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? teamInstance1Id = null,Object? teamInstance2Id = null,Object? team1Score = freezed,Object? team2Score = freezed,Object? winnerTeamInstanceId = freezed,Object? team1 = freezed,Object? team2 = freezed,}) {
  return _then(_Matchup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,teamInstance1Id: null == teamInstance1Id ? _self.teamInstance1Id : teamInstance1Id // ignore: cast_nullable_to_non_nullable
as String,teamInstance2Id: null == teamInstance2Id ? _self.teamInstance2Id : teamInstance2Id // ignore: cast_nullable_to_non_nullable
as String,team1Score: freezed == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as double?,team2Score: freezed == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as double?,winnerTeamInstanceId: freezed == winnerTeamInstanceId ? _self.winnerTeamInstanceId : winnerTeamInstanceId // ignore: cast_nullable_to_non_nullable
as String?,team1: freezed == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
as FantasyTeamInstance?,team2: freezed == team2 ? _self.team2 : team2 // ignore: cast_nullable_to_non_nullable
as FantasyTeamInstance?,
  ));
}

/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<$Res>? get team1 {
    if (_self.team1 == null) {
    return null;
  }

  return $FantasyTeamInstanceCopyWith<$Res>(_self.team1!, (value) {
    return _then(_self.copyWith(team1: value));
  });
}/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<$Res>? get team2 {
    if (_self.team2 == null) {
    return null;
  }

  return $FantasyTeamInstanceCopyWith<$Res>(_self.team2!, (value) {
    return _then(_self.copyWith(team2: value));
  });
}
}

// dart format on
