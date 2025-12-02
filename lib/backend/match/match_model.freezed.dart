// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "match_date") String? get matchDate;@JsonKey(name: "tournament_id") String? get tournamentId;@JsonKey(name: "season_id") String? get seasonId;@JsonKey(name: "venue_id") String? get venueId;@JsonKey(name: "home_team_id") String? get homeTeamId;@JsonKey(name: "away_team_id") String? get awayTeamId;@JsonKey(name: "home_team_name") String? get homeTeamName;@JsonKey(name: "home_team_image") String? get homeTeamImage;@JsonKey(name: "away_team_name") String? get awayTeamName;@JsonKey(name: "away_team_image") String? get awayTeamImage;@JsonKey(name: "home_team_score") int? get homeTeamScore;@JsonKey(name: "away_team_score") int? get awayTeamScore;@JsonKey(name: "home_team_wickets") int? get homeTeamWickets;@JsonKey(name: "away_team_wickets") int? get awayTeamWickets;@JsonKey(name: "home_team_balls") int? get homeTeamBalls;@JsonKey(name: "away_team_balls") int? get awayTeamBalls;@JsonKey(name: "status") String? get status;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.homeTeamScore, homeTeamScore) || other.homeTeamScore == homeTeamScore)&&(identical(other.awayTeamScore, awayTeamScore) || other.awayTeamScore == awayTeamScore)&&(identical(other.homeTeamWickets, homeTeamWickets) || other.homeTeamWickets == homeTeamWickets)&&(identical(other.awayTeamWickets, awayTeamWickets) || other.awayTeamWickets == awayTeamWickets)&&(identical(other.homeTeamBalls, homeTeamBalls) || other.homeTeamBalls == homeTeamBalls)&&(identical(other.awayTeamBalls, awayTeamBalls) || other.awayTeamBalls == awayTeamBalls)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchDate,tournamentId,seasonId,venueId,homeTeamId,awayTeamId,homeTeamName,homeTeamImage,awayTeamName,awayTeamImage,homeTeamScore,awayTeamScore,homeTeamWickets,awayTeamWickets,homeTeamBalls,awayTeamBalls,status);

@override
String toString() {
  return 'MatchModel(id: $id, matchDate: $matchDate, tournamentId: $tournamentId, seasonId: $seasonId, venueId: $venueId, homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore, homeTeamWickets: $homeTeamWickets, awayTeamWickets: $awayTeamWickets, homeTeamBalls: $homeTeamBalls, awayTeamBalls: $awayTeamBalls, status: $status)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "match_date") String? matchDate,@JsonKey(name: "tournament_id") String? tournamentId,@JsonKey(name: "season_id") String? seasonId,@JsonKey(name: "venue_id") String? venueId,@JsonKey(name: "home_team_id") String? homeTeamId,@JsonKey(name: "away_team_id") String? awayTeamId,@JsonKey(name: "home_team_name") String? homeTeamName,@JsonKey(name: "home_team_image") String? homeTeamImage,@JsonKey(name: "away_team_name") String? awayTeamName,@JsonKey(name: "away_team_image") String? awayTeamImage,@JsonKey(name: "home_team_score") int? homeTeamScore,@JsonKey(name: "away_team_score") int? awayTeamScore,@JsonKey(name: "home_team_wickets") int? homeTeamWickets,@JsonKey(name: "away_team_wickets") int? awayTeamWickets,@JsonKey(name: "home_team_balls") int? homeTeamBalls,@JsonKey(name: "away_team_balls") int? awayTeamBalls,@JsonKey(name: "status") String? status
});




}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? matchDate = freezed,Object? tournamentId = freezed,Object? seasonId = freezed,Object? venueId = freezed,Object? homeTeamId = freezed,Object? awayTeamId = freezed,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? homeTeamScore = freezed,Object? awayTeamScore = freezed,Object? homeTeamWickets = freezed,Object? awayTeamWickets = freezed,Object? homeTeamBalls = freezed,Object? awayTeamBalls = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,matchDate: freezed == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String?,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String?,seasonId: freezed == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamScore: freezed == homeTeamScore ? _self.homeTeamScore : homeTeamScore // ignore: cast_nullable_to_non_nullable
as int?,awayTeamScore: freezed == awayTeamScore ? _self.awayTeamScore : awayTeamScore // ignore: cast_nullable_to_non_nullable
as int?,homeTeamWickets: freezed == homeTeamWickets ? _self.homeTeamWickets : homeTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,awayTeamWickets: freezed == awayTeamWickets ? _self.awayTeamWickets : awayTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBalls: freezed == homeTeamBalls ? _self.homeTeamBalls : homeTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamBalls: freezed == awayTeamBalls ? _self.awayTeamBalls : awayTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "match_date")  String? matchDate, @JsonKey(name: "tournament_id")  String? tournamentId, @JsonKey(name: "season_id")  String? seasonId, @JsonKey(name: "venue_id")  String? venueId, @JsonKey(name: "home_team_id")  String? homeTeamId, @JsonKey(name: "away_team_id")  String? awayTeamId, @JsonKey(name: "home_team_name")  String? homeTeamName, @JsonKey(name: "home_team_image")  String? homeTeamImage, @JsonKey(name: "away_team_name")  String? awayTeamName, @JsonKey(name: "away_team_image")  String? awayTeamImage, @JsonKey(name: "home_team_score")  int? homeTeamScore, @JsonKey(name: "away_team_score")  int? awayTeamScore, @JsonKey(name: "home_team_wickets")  int? homeTeamWickets, @JsonKey(name: "away_team_wickets")  int? awayTeamWickets, @JsonKey(name: "home_team_balls")  int? homeTeamBalls, @JsonKey(name: "away_team_balls")  int? awayTeamBalls, @JsonKey(name: "status")  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "match_date")  String? matchDate, @JsonKey(name: "tournament_id")  String? tournamentId, @JsonKey(name: "season_id")  String? seasonId, @JsonKey(name: "venue_id")  String? venueId, @JsonKey(name: "home_team_id")  String? homeTeamId, @JsonKey(name: "away_team_id")  String? awayTeamId, @JsonKey(name: "home_team_name")  String? homeTeamName, @JsonKey(name: "home_team_image")  String? homeTeamImage, @JsonKey(name: "away_team_name")  String? awayTeamName, @JsonKey(name: "away_team_image")  String? awayTeamImage, @JsonKey(name: "home_team_score")  int? homeTeamScore, @JsonKey(name: "away_team_score")  int? awayTeamScore, @JsonKey(name: "home_team_wickets")  int? homeTeamWickets, @JsonKey(name: "away_team_wickets")  int? awayTeamWickets, @JsonKey(name: "home_team_balls")  int? homeTeamBalls, @JsonKey(name: "away_team_balls")  int? awayTeamBalls, @JsonKey(name: "status")  String? status)  $default,) {final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "match_date")  String? matchDate, @JsonKey(name: "tournament_id")  String? tournamentId, @JsonKey(name: "season_id")  String? seasonId, @JsonKey(name: "venue_id")  String? venueId, @JsonKey(name: "home_team_id")  String? homeTeamId, @JsonKey(name: "away_team_id")  String? awayTeamId, @JsonKey(name: "home_team_name")  String? homeTeamName, @JsonKey(name: "home_team_image")  String? homeTeamImage, @JsonKey(name: "away_team_name")  String? awayTeamName, @JsonKey(name: "away_team_image")  String? awayTeamImage, @JsonKey(name: "home_team_score")  int? homeTeamScore, @JsonKey(name: "away_team_score")  int? awayTeamScore, @JsonKey(name: "home_team_wickets")  int? homeTeamWickets, @JsonKey(name: "away_team_wickets")  int? awayTeamWickets, @JsonKey(name: "home_team_balls")  int? homeTeamBalls, @JsonKey(name: "away_team_balls")  int? awayTeamBalls, @JsonKey(name: "status")  String? status)?  $default,) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.matchDate,_that.tournamentId,_that.seasonId,_that.venueId,_that.homeTeamId,_that.awayTeamId,_that.homeTeamName,_that.homeTeamImage,_that.awayTeamName,_that.awayTeamImage,_that.homeTeamScore,_that.awayTeamScore,_that.homeTeamWickets,_that.awayTeamWickets,_that.homeTeamBalls,_that.awayTeamBalls,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchModel implements MatchModel {
  const _MatchModel({@JsonKey(name: "id") this.id, @JsonKey(name: "match_date") this.matchDate, @JsonKey(name: "tournament_id") this.tournamentId, @JsonKey(name: "season_id") this.seasonId, @JsonKey(name: "venue_id") this.venueId, @JsonKey(name: "home_team_id") this.homeTeamId, @JsonKey(name: "away_team_id") this.awayTeamId, @JsonKey(name: "home_team_name") this.homeTeamName, @JsonKey(name: "home_team_image") this.homeTeamImage, @JsonKey(name: "away_team_name") this.awayTeamName, @JsonKey(name: "away_team_image") this.awayTeamImage, @JsonKey(name: "home_team_score") this.homeTeamScore, @JsonKey(name: "away_team_score") this.awayTeamScore, @JsonKey(name: "home_team_wickets") this.homeTeamWickets, @JsonKey(name: "away_team_wickets") this.awayTeamWickets, @JsonKey(name: "home_team_balls") this.homeTeamBalls, @JsonKey(name: "away_team_balls") this.awayTeamBalls, @JsonKey(name: "status") this.status});
  factory _MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "match_date") final  String? matchDate;
@override@JsonKey(name: "tournament_id") final  String? tournamentId;
@override@JsonKey(name: "season_id") final  String? seasonId;
@override@JsonKey(name: "venue_id") final  String? venueId;
@override@JsonKey(name: "home_team_id") final  String? homeTeamId;
@override@JsonKey(name: "away_team_id") final  String? awayTeamId;
@override@JsonKey(name: "home_team_name") final  String? homeTeamName;
@override@JsonKey(name: "home_team_image") final  String? homeTeamImage;
@override@JsonKey(name: "away_team_name") final  String? awayTeamName;
@override@JsonKey(name: "away_team_image") final  String? awayTeamImage;
@override@JsonKey(name: "home_team_score") final  int? homeTeamScore;
@override@JsonKey(name: "away_team_score") final  int? awayTeamScore;
@override@JsonKey(name: "home_team_wickets") final  int? homeTeamWickets;
@override@JsonKey(name: "away_team_wickets") final  int? awayTeamWickets;
@override@JsonKey(name: "home_team_balls") final  int? homeTeamBalls;
@override@JsonKey(name: "away_team_balls") final  int? awayTeamBalls;
@override@JsonKey(name: "status") final  String? status;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchDate, matchDate) || other.matchDate == matchDate)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.homeTeamName, homeTeamName) || other.homeTeamName == homeTeamName)&&(identical(other.homeTeamImage, homeTeamImage) || other.homeTeamImage == homeTeamImage)&&(identical(other.awayTeamName, awayTeamName) || other.awayTeamName == awayTeamName)&&(identical(other.awayTeamImage, awayTeamImage) || other.awayTeamImage == awayTeamImage)&&(identical(other.homeTeamScore, homeTeamScore) || other.homeTeamScore == homeTeamScore)&&(identical(other.awayTeamScore, awayTeamScore) || other.awayTeamScore == awayTeamScore)&&(identical(other.homeTeamWickets, homeTeamWickets) || other.homeTeamWickets == homeTeamWickets)&&(identical(other.awayTeamWickets, awayTeamWickets) || other.awayTeamWickets == awayTeamWickets)&&(identical(other.homeTeamBalls, homeTeamBalls) || other.homeTeamBalls == homeTeamBalls)&&(identical(other.awayTeamBalls, awayTeamBalls) || other.awayTeamBalls == awayTeamBalls)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchDate,tournamentId,seasonId,venueId,homeTeamId,awayTeamId,homeTeamName,homeTeamImage,awayTeamName,awayTeamImage,homeTeamScore,awayTeamScore,homeTeamWickets,awayTeamWickets,homeTeamBalls,awayTeamBalls,status);

@override
String toString() {
  return 'MatchModel(id: $id, matchDate: $matchDate, tournamentId: $tournamentId, seasonId: $seasonId, venueId: $venueId, homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, homeTeamName: $homeTeamName, homeTeamImage: $homeTeamImage, awayTeamName: $awayTeamName, awayTeamImage: $awayTeamImage, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore, homeTeamWickets: $homeTeamWickets, awayTeamWickets: $awayTeamWickets, homeTeamBalls: $homeTeamBalls, awayTeamBalls: $awayTeamBalls, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "match_date") String? matchDate,@JsonKey(name: "tournament_id") String? tournamentId,@JsonKey(name: "season_id") String? seasonId,@JsonKey(name: "venue_id") String? venueId,@JsonKey(name: "home_team_id") String? homeTeamId,@JsonKey(name: "away_team_id") String? awayTeamId,@JsonKey(name: "home_team_name") String? homeTeamName,@JsonKey(name: "home_team_image") String? homeTeamImage,@JsonKey(name: "away_team_name") String? awayTeamName,@JsonKey(name: "away_team_image") String? awayTeamImage,@JsonKey(name: "home_team_score") int? homeTeamScore,@JsonKey(name: "away_team_score") int? awayTeamScore,@JsonKey(name: "home_team_wickets") int? homeTeamWickets,@JsonKey(name: "away_team_wickets") int? awayTeamWickets,@JsonKey(name: "home_team_balls") int? homeTeamBalls,@JsonKey(name: "away_team_balls") int? awayTeamBalls,@JsonKey(name: "status") String? status
});




}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? matchDate = freezed,Object? tournamentId = freezed,Object? seasonId = freezed,Object? venueId = freezed,Object? homeTeamId = freezed,Object? awayTeamId = freezed,Object? homeTeamName = freezed,Object? homeTeamImage = freezed,Object? awayTeamName = freezed,Object? awayTeamImage = freezed,Object? homeTeamScore = freezed,Object? awayTeamScore = freezed,Object? homeTeamWickets = freezed,Object? awayTeamWickets = freezed,Object? homeTeamBalls = freezed,Object? awayTeamBalls = freezed,Object? status = freezed,}) {
  return _then(_MatchModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,matchDate: freezed == matchDate ? _self.matchDate : matchDate // ignore: cast_nullable_to_non_nullable
as String?,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String?,seasonId: freezed == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,homeTeamName: freezed == homeTeamName ? _self.homeTeamName : homeTeamName // ignore: cast_nullable_to_non_nullable
as String?,homeTeamImage: freezed == homeTeamImage ? _self.homeTeamImage : homeTeamImage // ignore: cast_nullable_to_non_nullable
as String?,awayTeamName: freezed == awayTeamName ? _self.awayTeamName : awayTeamName // ignore: cast_nullable_to_non_nullable
as String?,awayTeamImage: freezed == awayTeamImage ? _self.awayTeamImage : awayTeamImage // ignore: cast_nullable_to_non_nullable
as String?,homeTeamScore: freezed == homeTeamScore ? _self.homeTeamScore : homeTeamScore // ignore: cast_nullable_to_non_nullable
as int?,awayTeamScore: freezed == awayTeamScore ? _self.awayTeamScore : awayTeamScore // ignore: cast_nullable_to_non_nullable
as int?,homeTeamWickets: freezed == homeTeamWickets ? _self.homeTeamWickets : homeTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,awayTeamWickets: freezed == awayTeamWickets ? _self.awayTeamWickets : awayTeamWickets // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBalls: freezed == homeTeamBalls ? _self.homeTeamBalls : homeTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamBalls: freezed == awayTeamBalls ? _self.awayTeamBalls : awayTeamBalls // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
