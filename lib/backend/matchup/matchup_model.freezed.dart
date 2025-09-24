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

 String get id;@JsonKey(name: 'league_id') String get leagueId;@JsonKey(name: 'match_num') int get matchNum;@JsonKey(name: 'scheduled_time') DateTime? get scheduledTime;@JsonKey(name: 'team1_score') double? get team1Score;@JsonKey(name: 'team2_score') double? get team2Score;@JsonKey(name: 'winner_team_id') String? get winnerTeamId;@JsonKey(name: 'created_at') DateTime? get createdAt;/// Supabase deep-select returns nested objects keyed as `team1` and `team2`.
/// Those map to the FantasyTeamInstance model below.
@JsonKey(name: 'team1') FantasyTeamInstance? get team1;@JsonKey(name: 'team2') FantasyTeamInstance? get team2;
/// Create a copy of Matchup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupCopyWith<Matchup> get copyWith => _$MatchupCopyWithImpl<Matchup>(this as Matchup, _$identity);

  /// Serializes this Matchup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,scheduledTime,team1Score,team2Score,winnerTeamId,createdAt,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, scheduledTime: $scheduledTime, team1Score: $team1Score, team2Score: $team2Score, winnerTeamId: $winnerTeamId, createdAt: $createdAt, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class $MatchupCopyWith<$Res>  {
  factory $MatchupCopyWith(Matchup value, $Res Function(Matchup) _then) = _$MatchupCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'match_num') int matchNum,@JsonKey(name: 'scheduled_time') DateTime? scheduledTime,@JsonKey(name: 'team1_score') double? team1Score,@JsonKey(name: 'team2_score') double? team2Score,@JsonKey(name: 'winner_team_id') String? winnerTeamId,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'team1') FantasyTeamInstance? team1,@JsonKey(name: 'team2') FantasyTeamInstance? team2
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? scheduledTime = freezed,Object? team1Score = freezed,Object? team2Score = freezed,Object? winnerTeamId = freezed,Object? createdAt = freezed,Object? team1 = freezed,Object? team2 = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,team1Score: freezed == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as double?,team2Score: freezed == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as double?,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,team1: freezed == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'match_num')  int matchNum, @JsonKey(name: 'scheduled_time')  DateTime? scheduledTime, @JsonKey(name: 'team1_score')  double? team1Score, @JsonKey(name: 'team2_score')  double? team2Score, @JsonKey(name: 'winner_team_id')  String? winnerTeamId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'team1')  FantasyTeamInstance? team1, @JsonKey(name: 'team2')  FantasyTeamInstance? team2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.scheduledTime,_that.team1Score,_that.team2Score,_that.winnerTeamId,_that.createdAt,_that.team1,_that.team2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'match_num')  int matchNum, @JsonKey(name: 'scheduled_time')  DateTime? scheduledTime, @JsonKey(name: 'team1_score')  double? team1Score, @JsonKey(name: 'team2_score')  double? team2Score, @JsonKey(name: 'winner_team_id')  String? winnerTeamId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'team1')  FantasyTeamInstance? team1, @JsonKey(name: 'team2')  FantasyTeamInstance? team2)  $default,) {final _that = this;
switch (_that) {
case _Matchup():
return $default(_that.id,_that.leagueId,_that.matchNum,_that.scheduledTime,_that.team1Score,_that.team2Score,_that.winnerTeamId,_that.createdAt,_that.team1,_that.team2);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'match_num')  int matchNum, @JsonKey(name: 'scheduled_time')  DateTime? scheduledTime, @JsonKey(name: 'team1_score')  double? team1Score, @JsonKey(name: 'team2_score')  double? team2Score, @JsonKey(name: 'winner_team_id')  String? winnerTeamId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'team1')  FantasyTeamInstance? team1, @JsonKey(name: 'team2')  FantasyTeamInstance? team2)?  $default,) {final _that = this;
switch (_that) {
case _Matchup() when $default != null:
return $default(_that.id,_that.leagueId,_that.matchNum,_that.scheduledTime,_that.team1Score,_that.team2Score,_that.winnerTeamId,_that.createdAt,_that.team1,_that.team2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matchup implements Matchup {
  const _Matchup({required this.id, @JsonKey(name: 'league_id') required this.leagueId, @JsonKey(name: 'match_num') required this.matchNum, @JsonKey(name: 'scheduled_time') this.scheduledTime, @JsonKey(name: 'team1_score') this.team1Score, @JsonKey(name: 'team2_score') this.team2Score, @JsonKey(name: 'winner_team_id') this.winnerTeamId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'team1') this.team1, @JsonKey(name: 'team2') this.team2});
  factory _Matchup.fromJson(Map<String, dynamic> json) => _$MatchupFromJson(json);

@override final  String id;
@override@JsonKey(name: 'league_id') final  String leagueId;
@override@JsonKey(name: 'match_num') final  int matchNum;
@override@JsonKey(name: 'scheduled_time') final  DateTime? scheduledTime;
@override@JsonKey(name: 'team1_score') final  double? team1Score;
@override@JsonKey(name: 'team2_score') final  double? team2Score;
@override@JsonKey(name: 'winner_team_id') final  String? winnerTeamId;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
/// Supabase deep-select returns nested objects keyed as `team1` and `team2`.
/// Those map to the FantasyTeamInstance model below.
@override@JsonKey(name: 'team1') final  FantasyTeamInstance? team1;
@override@JsonKey(name: 'team2') final  FantasyTeamInstance? team2;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matchup&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.team1, team1) || other.team1 == team1)&&(identical(other.team2, team2) || other.team2 == team2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,matchNum,scheduledTime,team1Score,team2Score,winnerTeamId,createdAt,team1,team2);

@override
String toString() {
  return 'Matchup(id: $id, leagueId: $leagueId, matchNum: $matchNum, scheduledTime: $scheduledTime, team1Score: $team1Score, team2Score: $team2Score, winnerTeamId: $winnerTeamId, createdAt: $createdAt, team1: $team1, team2: $team2)';
}


}

/// @nodoc
abstract mixin class _$MatchupCopyWith<$Res> implements $MatchupCopyWith<$Res> {
  factory _$MatchupCopyWith(_Matchup value, $Res Function(_Matchup) _then) = __$MatchupCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'match_num') int matchNum,@JsonKey(name: 'scheduled_time') DateTime? scheduledTime,@JsonKey(name: 'team1_score') double? team1Score,@JsonKey(name: 'team2_score') double? team2Score,@JsonKey(name: 'winner_team_id') String? winnerTeamId,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'team1') FantasyTeamInstance? team1,@JsonKey(name: 'team2') FantasyTeamInstance? team2
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? matchNum = null,Object? scheduledTime = freezed,Object? team1Score = freezed,Object? team2Score = freezed,Object? winnerTeamId = freezed,Object? createdAt = freezed,Object? team1 = freezed,Object? team2 = freezed,}) {
  return _then(_Matchup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,team1Score: freezed == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as double?,team2Score: freezed == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as double?,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,team1: freezed == team1 ? _self.team1 : team1 // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$FantasyTeamInstance {

 String get id;/// This is the FK to the underlying fantasy team row
@JsonKey(name: 'fantasy_team_id') String get fantasyTeamId;@JsonKey(name: 'is_locked') bool? get isLocked;@JsonKey(name: 'created_at') DateTime? get createdAt;/// Supabase uses `fantasy_team` for the nested team object in our deep-select
@JsonKey(name: 'fantasy_team') FantasyTeam? get fantasyTeam;
/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<FantasyTeamInstance> get copyWith => _$FantasyTeamInstanceCopyWithImpl<FantasyTeamInstance>(this as FantasyTeamInstance, _$identity);

  /// Serializes this FantasyTeamInstance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fantasyTeam, fantasyTeam) || other.fantasyTeam == fantasyTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fantasyTeamId,isLocked,createdAt,fantasyTeam);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasyTeamId: $fantasyTeamId, isLocked: $isLocked, createdAt: $createdAt, fantasyTeam: $fantasyTeam)';
}


}

/// @nodoc
abstract mixin class $FantasyTeamInstanceCopyWith<$Res>  {
  factory $FantasyTeamInstanceCopyWith(FantasyTeamInstance value, $Res Function(FantasyTeamInstance) _then) = _$FantasyTeamInstanceCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'fantasy_team_id') String fantasyTeamId,@JsonKey(name: 'is_locked') bool? isLocked,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'fantasy_team') FantasyTeam? fantasyTeam
});


$FantasyTeamCopyWith<$Res>? get fantasyTeam;

}
/// @nodoc
class _$FantasyTeamInstanceCopyWithImpl<$Res>
    implements $FantasyTeamInstanceCopyWith<$Res> {
  _$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final FantasyTeamInstance _self;
  final $Res Function(FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fantasyTeamId = null,Object? isLocked = freezed,Object? createdAt = freezed,Object? fantasyTeam = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,isLocked: freezed == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fantasyTeam: freezed == fantasyTeam ? _self.fantasyTeam : fantasyTeam // ignore: cast_nullable_to_non_nullable
as FantasyTeam?,
  ));
}
/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamCopyWith<$Res>? get fantasyTeam {
    if (_self.fantasyTeam == null) {
    return null;
  }

  return $FantasyTeamCopyWith<$Res>(_self.fantasyTeam!, (value) {
    return _then(_self.copyWith(fantasyTeam: value));
  });
}
}


/// Adds pattern-matching-related methods to [FantasyTeamInstance].
extension FantasyTeamInstancePatterns on FantasyTeamInstance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FantasyTeamInstance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FantasyTeamInstance value)  $default,){
final _that = this;
switch (_that) {
case _FantasyTeamInstance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FantasyTeamInstance value)?  $default,){
final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'fantasy_team_id')  String fantasyTeamId, @JsonKey(name: 'is_locked')  bool? isLocked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'fantasy_team')  FantasyTeam? fantasyTeam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasyTeamId,_that.isLocked,_that.createdAt,_that.fantasyTeam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'fantasy_team_id')  String fantasyTeamId, @JsonKey(name: 'is_locked')  bool? isLocked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'fantasy_team')  FantasyTeam? fantasyTeam)  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance():
return $default(_that.id,_that.fantasyTeamId,_that.isLocked,_that.createdAt,_that.fantasyTeam);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'fantasy_team_id')  String fantasyTeamId, @JsonKey(name: 'is_locked')  bool? isLocked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'fantasy_team')  FantasyTeam? fantasyTeam)?  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasyTeamId,_that.isLocked,_that.createdAt,_that.fantasyTeam);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyTeamInstance implements FantasyTeamInstance {
  const _FantasyTeamInstance({required this.id, @JsonKey(name: 'fantasy_team_id') required this.fantasyTeamId, @JsonKey(name: 'is_locked') this.isLocked, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'fantasy_team') this.fantasyTeam});
  factory _FantasyTeamInstance.fromJson(Map<String, dynamic> json) => _$FantasyTeamInstanceFromJson(json);

@override final  String id;
/// This is the FK to the underlying fantasy team row
@override@JsonKey(name: 'fantasy_team_id') final  String fantasyTeamId;
@override@JsonKey(name: 'is_locked') final  bool? isLocked;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
/// Supabase uses `fantasy_team` for the nested team object in our deep-select
@override@JsonKey(name: 'fantasy_team') final  FantasyTeam? fantasyTeam;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FantasyTeamInstanceCopyWith<_FantasyTeamInstance> get copyWith => __$FantasyTeamInstanceCopyWithImpl<_FantasyTeamInstance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FantasyTeamInstanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fantasyTeam, fantasyTeam) || other.fantasyTeam == fantasyTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fantasyTeamId,isLocked,createdAt,fantasyTeam);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasyTeamId: $fantasyTeamId, isLocked: $isLocked, createdAt: $createdAt, fantasyTeam: $fantasyTeam)';
}


}

/// @nodoc
abstract mixin class _$FantasyTeamInstanceCopyWith<$Res> implements $FantasyTeamInstanceCopyWith<$Res> {
  factory _$FantasyTeamInstanceCopyWith(_FantasyTeamInstance value, $Res Function(_FantasyTeamInstance) _then) = __$FantasyTeamInstanceCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'fantasy_team_id') String fantasyTeamId,@JsonKey(name: 'is_locked') bool? isLocked,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'fantasy_team') FantasyTeam? fantasyTeam
});


@override $FantasyTeamCopyWith<$Res>? get fantasyTeam;

}
/// @nodoc
class __$FantasyTeamInstanceCopyWithImpl<$Res>
    implements _$FantasyTeamInstanceCopyWith<$Res> {
  __$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final _FantasyTeamInstance _self;
  final $Res Function(_FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fantasyTeamId = null,Object? isLocked = freezed,Object? createdAt = freezed,Object? fantasyTeam = freezed,}) {
  return _then(_FantasyTeamInstance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,isLocked: freezed == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fantasyTeam: freezed == fantasyTeam ? _self.fantasyTeam : fantasyTeam // ignore: cast_nullable_to_non_nullable
as FantasyTeam?,
  ));
}

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FantasyTeamCopyWith<$Res>? get fantasyTeam {
    if (_self.fantasyTeam == null) {
    return null;
  }

  return $FantasyTeamCopyWith<$Res>(_self.fantasyTeam!, (value) {
    return _then(_self.copyWith(fantasyTeam: value));
  });
}
}

// dart format on
