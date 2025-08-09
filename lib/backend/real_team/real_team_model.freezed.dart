// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealTeam {

 String get id;@JsonKey(name: 'tournament_id') String get tournamentId; String get name;
/// Create a copy of RealTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealTeamCopyWith<RealTeam> get copyWith => _$RealTeamCopyWithImpl<RealTeam>(this as RealTeam, _$identity);

  /// Serializes this RealTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,name);

@override
String toString() {
  return 'RealTeam(id: $id, tournamentId: $tournamentId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RealTeamCopyWith<$Res>  {
  factory $RealTeamCopyWith(RealTeam value, $Res Function(RealTeam) _then) = _$RealTeamCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'tournament_id') String tournamentId, String name
});




}
/// @nodoc
class _$RealTeamCopyWithImpl<$Res>
    implements $RealTeamCopyWith<$Res> {
  _$RealTeamCopyWithImpl(this._self, this._then);

  final RealTeam _self;
  final $Res Function(RealTeam) _then;

/// Create a copy of RealTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tournamentId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RealTeam].
extension RealTeamPatterns on RealTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealTeam value)  $default,){
final _that = this;
switch (_that) {
case _RealTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealTeam value)?  $default,){
final _that = this;
switch (_that) {
case _RealTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tournament_id')  String tournamentId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealTeam() when $default != null:
return $default(_that.id,_that.tournamentId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tournament_id')  String tournamentId,  String name)  $default,) {final _that = this;
switch (_that) {
case _RealTeam():
return $default(_that.id,_that.tournamentId,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'tournament_id')  String tournamentId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _RealTeam() when $default != null:
return $default(_that.id,_that.tournamentId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealTeam implements RealTeam {
  const _RealTeam({required this.id, @JsonKey(name: 'tournament_id') required this.tournamentId, required this.name});
  factory _RealTeam.fromJson(Map<String, dynamic> json) => _$RealTeamFromJson(json);

@override final  String id;
@override@JsonKey(name: 'tournament_id') final  String tournamentId;
@override final  String name;

/// Create a copy of RealTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealTeamCopyWith<_RealTeam> get copyWith => __$RealTeamCopyWithImpl<_RealTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,name);

@override
String toString() {
  return 'RealTeam(id: $id, tournamentId: $tournamentId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RealTeamCopyWith<$Res> implements $RealTeamCopyWith<$Res> {
  factory _$RealTeamCopyWith(_RealTeam value, $Res Function(_RealTeam) _then) = __$RealTeamCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'tournament_id') String tournamentId, String name
});




}
/// @nodoc
class __$RealTeamCopyWithImpl<$Res>
    implements _$RealTeamCopyWith<$Res> {
  __$RealTeamCopyWithImpl(this._self, this._then);

  final _RealTeam _self;
  final $Res Function(_RealTeam) _then;

/// Create a copy of RealTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tournamentId = null,Object? name = null,}) {
  return _then(_RealTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
