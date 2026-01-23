// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_position_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaguePositionRule {

@JsonKey(name: "id") String get id;@JsonKey(name: "league_id") String get leagueId;@JsonKey(name: "min_count") int get minCount;@JsonKey(name: "max_count") int get maxCount;@JsonKey(name: "roles") List<String> get roles;@JsonKey(name: "role_details") List<PositionDetail> get roleDetails;
/// Create a copy of LeaguePositionRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaguePositionRuleCopyWith<LeaguePositionRule> get copyWith => _$LeaguePositionRuleCopyWithImpl<LeaguePositionRule>(this as LeaguePositionRule, _$identity);

  /// Serializes this LeaguePositionRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaguePositionRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.minCount, minCount) || other.minCount == minCount)&&(identical(other.maxCount, maxCount) || other.maxCount == maxCount)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.roleDetails, roleDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,minCount,maxCount,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(roleDetails));

@override
String toString() {
  return 'LeaguePositionRule(id: $id, leagueId: $leagueId, minCount: $minCount, maxCount: $maxCount, roles: $roles, roleDetails: $roleDetails)';
}


}

/// @nodoc
abstract mixin class $LeaguePositionRuleCopyWith<$Res>  {
  factory $LeaguePositionRuleCopyWith(LeaguePositionRule value, $Res Function(LeaguePositionRule) _then) = _$LeaguePositionRuleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "min_count") int minCount,@JsonKey(name: "max_count") int maxCount,@JsonKey(name: "roles") List<String> roles,@JsonKey(name: "role_details") List<PositionDetail> roleDetails
});




}
/// @nodoc
class _$LeaguePositionRuleCopyWithImpl<$Res>
    implements $LeaguePositionRuleCopyWith<$Res> {
  _$LeaguePositionRuleCopyWithImpl(this._self, this._then);

  final LeaguePositionRule _self;
  final $Res Function(LeaguePositionRule) _then;

/// Create a copy of LeaguePositionRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? minCount = null,Object? maxCount = null,Object? roles = null,Object? roleDetails = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,minCount: null == minCount ? _self.minCount : minCount // ignore: cast_nullable_to_non_nullable
as int,maxCount: null == maxCount ? _self.maxCount : maxCount // ignore: cast_nullable_to_non_nullable
as int,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,roleDetails: null == roleDetails ? _self.roleDetails : roleDetails // ignore: cast_nullable_to_non_nullable
as List<PositionDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaguePositionRule].
extension LeaguePositionRulePatterns on LeaguePositionRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaguePositionRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaguePositionRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaguePositionRule value)  $default,){
final _that = this;
switch (_that) {
case _LeaguePositionRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaguePositionRule value)?  $default,){
final _that = this;
switch (_that) {
case _LeaguePositionRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "min_count")  int minCount, @JsonKey(name: "max_count")  int maxCount, @JsonKey(name: "roles")  List<String> roles, @JsonKey(name: "role_details")  List<PositionDetail> roleDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaguePositionRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.minCount,_that.maxCount,_that.roles,_that.roleDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "min_count")  int minCount, @JsonKey(name: "max_count")  int maxCount, @JsonKey(name: "roles")  List<String> roles, @JsonKey(name: "role_details")  List<PositionDetail> roleDetails)  $default,) {final _that = this;
switch (_that) {
case _LeaguePositionRule():
return $default(_that.id,_that.leagueId,_that.minCount,_that.maxCount,_that.roles,_that.roleDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "league_id")  String leagueId, @JsonKey(name: "min_count")  int minCount, @JsonKey(name: "max_count")  int maxCount, @JsonKey(name: "roles")  List<String> roles, @JsonKey(name: "role_details")  List<PositionDetail> roleDetails)?  $default,) {final _that = this;
switch (_that) {
case _LeaguePositionRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.minCount,_that.maxCount,_that.roles,_that.roleDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaguePositionRule implements LeaguePositionRule {
  const _LeaguePositionRule({@JsonKey(name: "id") required this.id, @JsonKey(name: "league_id") required this.leagueId, @JsonKey(name: "min_count") required this.minCount, @JsonKey(name: "max_count") required this.maxCount, @JsonKey(name: "roles") required final  List<String> roles, @JsonKey(name: "role_details") required final  List<PositionDetail> roleDetails}): _roles = roles,_roleDetails = roleDetails;
  factory _LeaguePositionRule.fromJson(Map<String, dynamic> json) => _$LeaguePositionRuleFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "league_id") final  String leagueId;
@override@JsonKey(name: "min_count") final  int minCount;
@override@JsonKey(name: "max_count") final  int maxCount;
 final  List<String> _roles;
@override@JsonKey(name: "roles") List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  List<PositionDetail> _roleDetails;
@override@JsonKey(name: "role_details") List<PositionDetail> get roleDetails {
  if (_roleDetails is EqualUnmodifiableListView) return _roleDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleDetails);
}


/// Create a copy of LeaguePositionRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaguePositionRuleCopyWith<_LeaguePositionRule> get copyWith => __$LeaguePositionRuleCopyWithImpl<_LeaguePositionRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaguePositionRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaguePositionRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.minCount, minCount) || other.minCount == minCount)&&(identical(other.maxCount, maxCount) || other.maxCount == maxCount)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._roleDetails, _roleDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,minCount,maxCount,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_roleDetails));

@override
String toString() {
  return 'LeaguePositionRule(id: $id, leagueId: $leagueId, minCount: $minCount, maxCount: $maxCount, roles: $roles, roleDetails: $roleDetails)';
}


}

/// @nodoc
abstract mixin class _$LeaguePositionRuleCopyWith<$Res> implements $LeaguePositionRuleCopyWith<$Res> {
  factory _$LeaguePositionRuleCopyWith(_LeaguePositionRule value, $Res Function(_LeaguePositionRule) _then) = __$LeaguePositionRuleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "league_id") String leagueId,@JsonKey(name: "min_count") int minCount,@JsonKey(name: "max_count") int maxCount,@JsonKey(name: "roles") List<String> roles,@JsonKey(name: "role_details") List<PositionDetail> roleDetails
});




}
/// @nodoc
class __$LeaguePositionRuleCopyWithImpl<$Res>
    implements _$LeaguePositionRuleCopyWith<$Res> {
  __$LeaguePositionRuleCopyWithImpl(this._self, this._then);

  final _LeaguePositionRule _self;
  final $Res Function(_LeaguePositionRule) _then;

/// Create a copy of LeaguePositionRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? minCount = null,Object? maxCount = null,Object? roles = null,Object? roleDetails = null,}) {
  return _then(_LeaguePositionRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,minCount: null == minCount ? _self.minCount : minCount // ignore: cast_nullable_to_non_nullable
as int,maxCount: null == maxCount ? _self.maxCount : maxCount // ignore: cast_nullable_to_non_nullable
as int,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,roleDetails: null == roleDetails ? _self._roleDetails : roleDetails // ignore: cast_nullable_to_non_nullable
as List<PositionDetail>,
  ));
}


}


/// @nodoc
mixin _$PositionDetail {

@JsonKey(name: "id") String get id;@JsonKey(name: "name") String get name;
/// Create a copy of PositionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PositionDetailCopyWith<PositionDetail> get copyWith => _$PositionDetailCopyWithImpl<PositionDetail>(this as PositionDetail, _$identity);

  /// Serializes this PositionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PositionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PositionDetail(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $PositionDetailCopyWith<$Res>  {
  factory $PositionDetailCopyWith(PositionDetail value, $Res Function(PositionDetail) _then) = _$PositionDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name
});




}
/// @nodoc
class _$PositionDetailCopyWithImpl<$Res>
    implements $PositionDetailCopyWith<$Res> {
  _$PositionDetailCopyWithImpl(this._self, this._then);

  final PositionDetail _self;
  final $Res Function(PositionDetail) _then;

/// Create a copy of PositionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PositionDetail].
extension PositionDetailPatterns on PositionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PositionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PositionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PositionDetail value)  $default,){
final _that = this;
switch (_that) {
case _PositionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PositionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PositionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PositionDetail() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name)  $default,) {final _that = this;
switch (_that) {
case _PositionDetail():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name)?  $default,) {final _that = this;
switch (_that) {
case _PositionDetail() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PositionDetail implements PositionDetail {
  const _PositionDetail({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name});
  factory _PositionDetail.fromJson(Map<String, dynamic> json) => _$PositionDetailFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "name") final  String name;

/// Create a copy of PositionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PositionDetailCopyWith<_PositionDetail> get copyWith => __$PositionDetailCopyWithImpl<_PositionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PositionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PositionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PositionDetail(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PositionDetailCopyWith<$Res> implements $PositionDetailCopyWith<$Res> {
  factory _$PositionDetailCopyWith(_PositionDetail value, $Res Function(_PositionDetail) _then) = __$PositionDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name
});




}
/// @nodoc
class __$PositionDetailCopyWithImpl<$Res>
    implements _$PositionDetailCopyWith<$Res> {
  __$PositionDetailCopyWithImpl(this._self, this._then);

  final _PositionDetail _self;
  final $Res Function(_PositionDetail) _then;

/// Create a copy of PositionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_PositionDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
