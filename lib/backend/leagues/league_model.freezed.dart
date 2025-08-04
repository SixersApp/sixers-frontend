// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$League {

 String get id; String get name;@JsonKey(name: 'tournament_id') String get tournamentId;@JsonKey(name: 'creator_id') String get creatorId; LeagueStatus get status;@JsonKey(name: 'max_teams') int get maxTeams;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueCopyWith<League> get copyWith => _$LeagueCopyWithImpl<League>(this as League, _$identity);

  /// Serializes this League to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is League&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tournamentId,creatorId,status,maxTeams,createdAt);

@override
String toString() {
  return 'League(id: $id, name: $name, tournamentId: $tournamentId, creatorId: $creatorId, status: $status, maxTeams: $maxTeams, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LeagueCopyWith<$Res>  {
  factory $LeagueCopyWith(League value, $Res Function(League) _then) = _$LeagueCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'creator_id') String creatorId, LeagueStatus status,@JsonKey(name: 'max_teams') int maxTeams,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$LeagueCopyWithImpl<$Res>
    implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._self, this._then);

  final League _self;
  final $Res Function(League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tournamentId = null,Object? creatorId = null,Object? status = null,Object? maxTeams = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeagueStatus,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [League].
extension LeaguePatterns on League {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _League value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _League value)  $default,){
final _that = this;
switch (_that) {
case _League():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _League value)?  $default,){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'creator_id')  String creatorId,  LeagueStatus status, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.status,_that.maxTeams,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'creator_id')  String creatorId,  LeagueStatus status, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _League():
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.status,_that.maxTeams,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'tournament_id')  String tournamentId, @JsonKey(name: 'creator_id')  String creatorId,  LeagueStatus status, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.status,_that.maxTeams,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _League implements League {
  const _League({required this.id, required this.name, @JsonKey(name: 'tournament_id') required this.tournamentId, @JsonKey(name: 'creator_id') required this.creatorId, required this.status, @JsonKey(name: 'max_teams') required this.maxTeams, @JsonKey(name: 'created_at') this.createdAt});
  factory _League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'tournament_id') final  String tournamentId;
@override@JsonKey(name: 'creator_id') final  String creatorId;
@override final  LeagueStatus status;
@override@JsonKey(name: 'max_teams') final  int maxTeams;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueCopyWith<_League> get copyWith => __$LeagueCopyWithImpl<_League>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _League&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tournamentId,creatorId,status,maxTeams,createdAt);

@override
String toString() {
  return 'League(id: $id, name: $name, tournamentId: $tournamentId, creatorId: $creatorId, status: $status, maxTeams: $maxTeams, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) _then) = __$LeagueCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'tournament_id') String tournamentId,@JsonKey(name: 'creator_id') String creatorId, LeagueStatus status,@JsonKey(name: 'max_teams') int maxTeams,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(this._self, this._then);

  final _League _self;
  final $Res Function(_League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tournamentId = null,Object? creatorId = null,Object? status = null,Object? maxTeams = null,Object? createdAt = freezed,}) {
  return _then(_League(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeagueStatus,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
