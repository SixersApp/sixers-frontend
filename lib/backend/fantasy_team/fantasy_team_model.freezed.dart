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
mixin _$FantasyTeam {

 String get id; String get leagueId; String get userId; String get teamName; int get draftOrder; String get teamColor; String get teamIcon; DateTime get createdAt;
/// Create a copy of FantasyTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyTeamCopyWith<FantasyTeam> get copyWith => _$FantasyTeamCopyWithImpl<FantasyTeam>(this as FantasyTeam, _$identity);

  /// Serializes this FantasyTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.draftOrder, draftOrder) || other.draftOrder == draftOrder)&&(identical(other.teamColor, teamColor) || other.teamColor == teamColor)&&(identical(other.teamIcon, teamIcon) || other.teamIcon == teamIcon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,userId,teamName,draftOrder,teamColor,teamIcon,createdAt);

@override
String toString() {
  return 'FantasyTeam(id: $id, leagueId: $leagueId, userId: $userId, teamName: $teamName, draftOrder: $draftOrder, teamColor: $teamColor, teamIcon: $teamIcon, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FantasyTeamCopyWith<$Res>  {
  factory $FantasyTeamCopyWith(FantasyTeam value, $Res Function(FantasyTeam) _then) = _$FantasyTeamCopyWithImpl;
@useResult
$Res call({
 String id, String leagueId, String userId, String teamName, int draftOrder, String teamColor, String teamIcon, DateTime createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? userId = null,Object? teamName = null,Object? draftOrder = null,Object? teamColor = null,Object? teamIcon = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,draftOrder: null == draftOrder ? _self.draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as int,teamColor: null == teamColor ? _self.teamColor : teamColor // ignore: cast_nullable_to_non_nullable
as String,teamIcon: null == teamIcon ? _self.teamIcon : teamIcon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String leagueId,  String userId,  String teamName,  int draftOrder,  String teamColor,  String teamIcon,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String leagueId,  String userId,  String teamName,  int draftOrder,  String teamColor,  String teamIcon,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FantasyTeam():
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String leagueId,  String userId,  String teamName,  int draftOrder,  String teamColor,  String teamIcon,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FantasyTeam() when $default != null:
return $default(_that.id,_that.leagueId,_that.userId,_that.teamName,_that.draftOrder,_that.teamColor,_that.teamIcon,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyTeam implements FantasyTeam {
  const _FantasyTeam({required this.id, required this.leagueId, required this.userId, required this.teamName, required this.draftOrder, required this.teamColor, required this.teamIcon, required this.createdAt});
  factory _FantasyTeam.fromJson(Map<String, dynamic> json) => _$FantasyTeamFromJson(json);

@override final  String id;
@override final  String leagueId;
@override final  String userId;
@override final  String teamName;
@override final  int draftOrder;
@override final  String teamColor;
@override final  String teamIcon;
@override final  DateTime createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.draftOrder, draftOrder) || other.draftOrder == draftOrder)&&(identical(other.teamColor, teamColor) || other.teamColor == teamColor)&&(identical(other.teamIcon, teamIcon) || other.teamIcon == teamIcon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,userId,teamName,draftOrder,teamColor,teamIcon,createdAt);

@override
String toString() {
  return 'FantasyTeam(id: $id, leagueId: $leagueId, userId: $userId, teamName: $teamName, draftOrder: $draftOrder, teamColor: $teamColor, teamIcon: $teamIcon, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FantasyTeamCopyWith<$Res> implements $FantasyTeamCopyWith<$Res> {
  factory _$FantasyTeamCopyWith(_FantasyTeam value, $Res Function(_FantasyTeam) _then) = __$FantasyTeamCopyWithImpl;
@override @useResult
$Res call({
 String id, String leagueId, String userId, String teamName, int draftOrder, String teamColor, String teamIcon, DateTime createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? userId = null,Object? teamName = null,Object? draftOrder = null,Object? teamColor = null,Object? teamIcon = null,Object? createdAt = null,}) {
  return _then(_FantasyTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,draftOrder: null == draftOrder ? _self.draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as int,teamColor: null == teamColor ? _self.teamColor : teamColor // ignore: cast_nullable_to_non_nullable
as String,teamIcon: null == teamIcon ? _self.teamIcon : teamIcon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
