// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedGroupModel {

@JsonKey(name: 'tournament_id') String get tournamentId;@JsonKey(name: 'tournament_name') String get tournamentName;@JsonKey(name: 'matches') List<MatchModel> get matches;@JsonKey(name: 'abbreviation') String get abbreviation;
/// Create a copy of FeedGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedGroupModelCopyWith<FeedGroupModel> get copyWith => _$FeedGroupModelCopyWithImpl<FeedGroupModel>(this as FeedGroupModel, _$identity);

  /// Serializes this FeedGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedGroupModel&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&const DeepCollectionEquality().equals(other.matches, matches)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentId,tournamentName,const DeepCollectionEquality().hash(matches),abbreviation);

@override
String toString() {
  return 'FeedGroupModel(tournamentId: $tournamentId, tournamentName: $tournamentName, matches: $matches, abbreviation: $abbreviation)';
}


}

/// @nodoc
abstract mixin class $FeedGroupModelCopyWith<$Res>  {
  factory $FeedGroupModelCopyWith(FeedGroupModel value, $Res Function(FeedGroupModel) _then) = _$FeedGroupModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'matches') List<MatchModel> matches,@JsonKey(name: 'abbreviation') String abbreviation
});




}
/// @nodoc
class _$FeedGroupModelCopyWithImpl<$Res>
    implements $FeedGroupModelCopyWith<$Res> {
  _$FeedGroupModelCopyWithImpl(this._self, this._then);

  final FeedGroupModel _self;
  final $Res Function(FeedGroupModel) _then;

/// Create a copy of FeedGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tournamentId = null,Object? tournamentName = null,Object? matches = null,Object? abbreviation = null,}) {
  return _then(_self.copyWith(
tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,abbreviation: null == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedGroupModel].
extension FeedGroupModelPatterns on FeedGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'matches')  List<MatchModel> matches, @JsonKey(name: 'abbreviation')  String abbreviation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedGroupModel() when $default != null:
return $default(_that.tournamentId,_that.tournamentName,_that.matches,_that.abbreviation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'matches')  List<MatchModel> matches, @JsonKey(name: 'abbreviation')  String abbreviation)  $default,) {final _that = this;
switch (_that) {
case _FeedGroupModel():
return $default(_that.tournamentId,_that.tournamentName,_that.matches,_that.abbreviation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'matches')  List<MatchModel> matches, @JsonKey(name: 'abbreviation')  String abbreviation)?  $default,) {final _that = this;
switch (_that) {
case _FeedGroupModel() when $default != null:
return $default(_that.tournamentId,_that.tournamentName,_that.matches,_that.abbreviation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedGroupModel implements FeedGroupModel {
  const _FeedGroupModel({@JsonKey(name: 'tournament_id') required this.tournamentId, @JsonKey(name: 'tournament_name') required this.tournamentName, @JsonKey(name: 'matches') required final  List<MatchModel> matches, @JsonKey(name: 'abbreviation') required this.abbreviation}): _matches = matches;
  factory _FeedGroupModel.fromJson(Map<String, dynamic> json) => _$FeedGroupModelFromJson(json);

@override@JsonKey(name: 'tournament_id') final  String tournamentId;
@override@JsonKey(name: 'tournament_name') final  String tournamentName;
 final  List<MatchModel> _matches;
@override@JsonKey(name: 'matches') List<MatchModel> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}

@override@JsonKey(name: 'abbreviation') final  String abbreviation;

/// Create a copy of FeedGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedGroupModelCopyWith<_FeedGroupModel> get copyWith => __$FeedGroupModelCopyWithImpl<_FeedGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedGroupModel&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&const DeepCollectionEquality().equals(other._matches, _matches)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentId,tournamentName,const DeepCollectionEquality().hash(_matches),abbreviation);

@override
String toString() {
  return 'FeedGroupModel(tournamentId: $tournamentId, tournamentName: $tournamentName, matches: $matches, abbreviation: $abbreviation)';
}


}

/// @nodoc
abstract mixin class _$FeedGroupModelCopyWith<$Res> implements $FeedGroupModelCopyWith<$Res> {
  factory _$FeedGroupModelCopyWith(_FeedGroupModel value, $Res Function(_FeedGroupModel) _then) = __$FeedGroupModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'matches') List<MatchModel> matches,@JsonKey(name: 'abbreviation') String abbreviation
});




}
/// @nodoc
class __$FeedGroupModelCopyWithImpl<$Res>
    implements _$FeedGroupModelCopyWith<$Res> {
  __$FeedGroupModelCopyWithImpl(this._self, this._then);

  final _FeedGroupModel _self;
  final $Res Function(_FeedGroupModel) _then;

/// Create a copy of FeedGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tournamentId = null,Object? tournamentName = null,Object? matches = null,Object? abbreviation = null,}) {
  return _then(_FeedGroupModel(
tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,abbreviation: null == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
