// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fantasy_team_instance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FantasyTeamInstance {

 String get id; String get fantasyTeamId; int get matchNum; bool get isLocked;// You can keep players as raw fields for now
 String? get bat1; String? get bat2; String? get bat3; String? get bat4; String? get bowl1; String? get bowl2; String? get bowl3; String? get bowl4; String? get all1; String? get all2; String? get all3; String? get wicket1; String? get wicket2; String? get bench1; String? get bench2; String? get bench3; String? get bench4; String? get bench5; String? get bench6; String? get bench7; String? get bench8; String? get flex1; String? get flex2; String? get flex3; String? get flex4; DateTime get createdAt;
/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<FantasyTeamInstance> get copyWith => _$FantasyTeamInstanceCopyWithImpl<FantasyTeamInstance>(this as FantasyTeamInstance, _$identity);

  /// Serializes this FantasyTeamInstance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.bat1, bat1) || other.bat1 == bat1)&&(identical(other.bat2, bat2) || other.bat2 == bat2)&&(identical(other.bat3, bat3) || other.bat3 == bat3)&&(identical(other.bat4, bat4) || other.bat4 == bat4)&&(identical(other.bowl1, bowl1) || other.bowl1 == bowl1)&&(identical(other.bowl2, bowl2) || other.bowl2 == bowl2)&&(identical(other.bowl3, bowl3) || other.bowl3 == bowl3)&&(identical(other.bowl4, bowl4) || other.bowl4 == bowl4)&&(identical(other.all1, all1) || other.all1 == all1)&&(identical(other.all2, all2) || other.all2 == all2)&&(identical(other.all3, all3) || other.all3 == all3)&&(identical(other.wicket1, wicket1) || other.wicket1 == wicket1)&&(identical(other.wicket2, wicket2) || other.wicket2 == wicket2)&&(identical(other.bench1, bench1) || other.bench1 == bench1)&&(identical(other.bench2, bench2) || other.bench2 == bench2)&&(identical(other.bench3, bench3) || other.bench3 == bench3)&&(identical(other.bench4, bench4) || other.bench4 == bench4)&&(identical(other.bench5, bench5) || other.bench5 == bench5)&&(identical(other.bench6, bench6) || other.bench6 == bench6)&&(identical(other.bench7, bench7) || other.bench7 == bench7)&&(identical(other.bench8, bench8) || other.bench8 == bench8)&&(identical(other.flex1, flex1) || other.flex1 == flex1)&&(identical(other.flex2, flex2) || other.flex2 == flex2)&&(identical(other.flex3, flex3) || other.flex3 == flex3)&&(identical(other.flex4, flex4) || other.flex4 == flex4)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fantasyTeamId,matchNum,isLocked,bat1,bat2,bat3,bat4,bowl1,bowl2,bowl3,bowl4,all1,all2,all3,wicket1,wicket2,bench1,bench2,bench3,bench4,bench5,bench6,bench7,bench8,flex1,flex2,flex3,flex4,createdAt]);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasyTeamId: $fantasyTeamId, matchNum: $matchNum, isLocked: $isLocked, bat1: $bat1, bat2: $bat2, bat3: $bat3, bat4: $bat4, bowl1: $bowl1, bowl2: $bowl2, bowl3: $bowl3, bowl4: $bowl4, all1: $all1, all2: $all2, all3: $all3, wicket1: $wicket1, wicket2: $wicket2, bench1: $bench1, bench2: $bench2, bench3: $bench3, bench4: $bench4, bench5: $bench5, bench6: $bench6, bench7: $bench7, bench8: $bench8, flex1: $flex1, flex2: $flex2, flex3: $flex3, flex4: $flex4, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FantasyTeamInstanceCopyWith<$Res>  {
  factory $FantasyTeamInstanceCopyWith(FantasyTeamInstance value, $Res Function(FantasyTeamInstance) _then) = _$FantasyTeamInstanceCopyWithImpl;
@useResult
$Res call({
 String id, String fantasyTeamId, int matchNum, bool isLocked, String? bat1, String? bat2, String? bat3, String? bat4, String? bowl1, String? bowl2, String? bowl3, String? bowl4, String? all1, String? all2, String? all3, String? wicket1, String? wicket2, String? bench1, String? bench2, String? bench3, String? bench4, String? bench5, String? bench6, String? bench7, String? bench8, String? flex1, String? flex2, String? flex3, String? flex4, DateTime createdAt
});




}
/// @nodoc
class _$FantasyTeamInstanceCopyWithImpl<$Res>
    implements $FantasyTeamInstanceCopyWith<$Res> {
  _$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final FantasyTeamInstance _self;
  final $Res Function(FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fantasyTeamId = null,Object? matchNum = null,Object? isLocked = null,Object? bat1 = freezed,Object? bat2 = freezed,Object? bat3 = freezed,Object? bat4 = freezed,Object? bowl1 = freezed,Object? bowl2 = freezed,Object? bowl3 = freezed,Object? bowl4 = freezed,Object? all1 = freezed,Object? all2 = freezed,Object? all3 = freezed,Object? wicket1 = freezed,Object? wicket2 = freezed,Object? bench1 = freezed,Object? bench2 = freezed,Object? bench3 = freezed,Object? bench4 = freezed,Object? bench5 = freezed,Object? bench6 = freezed,Object? bench7 = freezed,Object? bench8 = freezed,Object? flex1 = freezed,Object? flex2 = freezed,Object? flex3 = freezed,Object? flex4 = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,bat1: freezed == bat1 ? _self.bat1 : bat1 // ignore: cast_nullable_to_non_nullable
as String?,bat2: freezed == bat2 ? _self.bat2 : bat2 // ignore: cast_nullable_to_non_nullable
as String?,bat3: freezed == bat3 ? _self.bat3 : bat3 // ignore: cast_nullable_to_non_nullable
as String?,bat4: freezed == bat4 ? _self.bat4 : bat4 // ignore: cast_nullable_to_non_nullable
as String?,bowl1: freezed == bowl1 ? _self.bowl1 : bowl1 // ignore: cast_nullable_to_non_nullable
as String?,bowl2: freezed == bowl2 ? _self.bowl2 : bowl2 // ignore: cast_nullable_to_non_nullable
as String?,bowl3: freezed == bowl3 ? _self.bowl3 : bowl3 // ignore: cast_nullable_to_non_nullable
as String?,bowl4: freezed == bowl4 ? _self.bowl4 : bowl4 // ignore: cast_nullable_to_non_nullable
as String?,all1: freezed == all1 ? _self.all1 : all1 // ignore: cast_nullable_to_non_nullable
as String?,all2: freezed == all2 ? _self.all2 : all2 // ignore: cast_nullable_to_non_nullable
as String?,all3: freezed == all3 ? _self.all3 : all3 // ignore: cast_nullable_to_non_nullable
as String?,wicket1: freezed == wicket1 ? _self.wicket1 : wicket1 // ignore: cast_nullable_to_non_nullable
as String?,wicket2: freezed == wicket2 ? _self.wicket2 : wicket2 // ignore: cast_nullable_to_non_nullable
as String?,bench1: freezed == bench1 ? _self.bench1 : bench1 // ignore: cast_nullable_to_non_nullable
as String?,bench2: freezed == bench2 ? _self.bench2 : bench2 // ignore: cast_nullable_to_non_nullable
as String?,bench3: freezed == bench3 ? _self.bench3 : bench3 // ignore: cast_nullable_to_non_nullable
as String?,bench4: freezed == bench4 ? _self.bench4 : bench4 // ignore: cast_nullable_to_non_nullable
as String?,bench5: freezed == bench5 ? _self.bench5 : bench5 // ignore: cast_nullable_to_non_nullable
as String?,bench6: freezed == bench6 ? _self.bench6 : bench6 // ignore: cast_nullable_to_non_nullable
as String?,bench7: freezed == bench7 ? _self.bench7 : bench7 // ignore: cast_nullable_to_non_nullable
as String?,bench8: freezed == bench8 ? _self.bench8 : bench8 // ignore: cast_nullable_to_non_nullable
as String?,flex1: freezed == flex1 ? _self.flex1 : flex1 // ignore: cast_nullable_to_non_nullable
as String?,flex2: freezed == flex2 ? _self.flex2 : flex2 // ignore: cast_nullable_to_non_nullable
as String?,flex3: freezed == flex3 ? _self.flex3 : flex3 // ignore: cast_nullable_to_non_nullable
as String?,flex4: freezed == flex4 ? _self.flex4 : flex4 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fantasyTeamId,  int matchNum,  bool isLocked,  String? bat1,  String? bat2,  String? bat3,  String? bat4,  String? bowl1,  String? bowl2,  String? bowl3,  String? bowl4,  String? all1,  String? all2,  String? all3,  String? wicket1,  String? wicket2,  String? bench1,  String? bench2,  String? bench3,  String? bench4,  String? bench5,  String? bench6,  String? bench7,  String? bench8,  String? flex1,  String? flex2,  String? flex3,  String? flex4,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasyTeamId,_that.matchNum,_that.isLocked,_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fantasyTeamId,  int matchNum,  bool isLocked,  String? bat1,  String? bat2,  String? bat3,  String? bat4,  String? bowl1,  String? bowl2,  String? bowl3,  String? bowl4,  String? all1,  String? all2,  String? all3,  String? wicket1,  String? wicket2,  String? bench1,  String? bench2,  String? bench3,  String? bench4,  String? bench5,  String? bench6,  String? bench7,  String? bench8,  String? flex1,  String? flex2,  String? flex3,  String? flex4,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance():
return $default(_that.id,_that.fantasyTeamId,_that.matchNum,_that.isLocked,_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fantasyTeamId,  int matchNum,  bool isLocked,  String? bat1,  String? bat2,  String? bat3,  String? bat4,  String? bowl1,  String? bowl2,  String? bowl3,  String? bowl4,  String? all1,  String? all2,  String? all3,  String? wicket1,  String? wicket2,  String? bench1,  String? bench2,  String? bench3,  String? bench4,  String? bench5,  String? bench6,  String? bench7,  String? bench8,  String? flex1,  String? flex2,  String? flex3,  String? flex4,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasyTeamId,_that.matchNum,_that.isLocked,_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyTeamInstance implements FantasyTeamInstance {
  const _FantasyTeamInstance({required this.id, required this.fantasyTeamId, required this.matchNum, required this.isLocked, this.bat1, this.bat2, this.bat3, this.bat4, this.bowl1, this.bowl2, this.bowl3, this.bowl4, this.all1, this.all2, this.all3, this.wicket1, this.wicket2, this.bench1, this.bench2, this.bench3, this.bench4, this.bench5, this.bench6, this.bench7, this.bench8, this.flex1, this.flex2, this.flex3, this.flex4, required this.createdAt});
  factory _FantasyTeamInstance.fromJson(Map<String, dynamic> json) => _$FantasyTeamInstanceFromJson(json);

@override final  String id;
@override final  String fantasyTeamId;
@override final  int matchNum;
@override final  bool isLocked;
// You can keep players as raw fields for now
@override final  String? bat1;
@override final  String? bat2;
@override final  String? bat3;
@override final  String? bat4;
@override final  String? bowl1;
@override final  String? bowl2;
@override final  String? bowl3;
@override final  String? bowl4;
@override final  String? all1;
@override final  String? all2;
@override final  String? all3;
@override final  String? wicket1;
@override final  String? wicket2;
@override final  String? bench1;
@override final  String? bench2;
@override final  String? bench3;
@override final  String? bench4;
@override final  String? bench5;
@override final  String? bench6;
@override final  String? bench7;
@override final  String? bench8;
@override final  String? flex1;
@override final  String? flex2;
@override final  String? flex3;
@override final  String? flex4;
@override final  DateTime createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasyTeamId, fantasyTeamId) || other.fantasyTeamId == fantasyTeamId)&&(identical(other.matchNum, matchNum) || other.matchNum == matchNum)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.bat1, bat1) || other.bat1 == bat1)&&(identical(other.bat2, bat2) || other.bat2 == bat2)&&(identical(other.bat3, bat3) || other.bat3 == bat3)&&(identical(other.bat4, bat4) || other.bat4 == bat4)&&(identical(other.bowl1, bowl1) || other.bowl1 == bowl1)&&(identical(other.bowl2, bowl2) || other.bowl2 == bowl2)&&(identical(other.bowl3, bowl3) || other.bowl3 == bowl3)&&(identical(other.bowl4, bowl4) || other.bowl4 == bowl4)&&(identical(other.all1, all1) || other.all1 == all1)&&(identical(other.all2, all2) || other.all2 == all2)&&(identical(other.all3, all3) || other.all3 == all3)&&(identical(other.wicket1, wicket1) || other.wicket1 == wicket1)&&(identical(other.wicket2, wicket2) || other.wicket2 == wicket2)&&(identical(other.bench1, bench1) || other.bench1 == bench1)&&(identical(other.bench2, bench2) || other.bench2 == bench2)&&(identical(other.bench3, bench3) || other.bench3 == bench3)&&(identical(other.bench4, bench4) || other.bench4 == bench4)&&(identical(other.bench5, bench5) || other.bench5 == bench5)&&(identical(other.bench6, bench6) || other.bench6 == bench6)&&(identical(other.bench7, bench7) || other.bench7 == bench7)&&(identical(other.bench8, bench8) || other.bench8 == bench8)&&(identical(other.flex1, flex1) || other.flex1 == flex1)&&(identical(other.flex2, flex2) || other.flex2 == flex2)&&(identical(other.flex3, flex3) || other.flex3 == flex3)&&(identical(other.flex4, flex4) || other.flex4 == flex4)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fantasyTeamId,matchNum,isLocked,bat1,bat2,bat3,bat4,bowl1,bowl2,bowl3,bowl4,all1,all2,all3,wicket1,wicket2,bench1,bench2,bench3,bench4,bench5,bench6,bench7,bench8,flex1,flex2,flex3,flex4,createdAt]);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasyTeamId: $fantasyTeamId, matchNum: $matchNum, isLocked: $isLocked, bat1: $bat1, bat2: $bat2, bat3: $bat3, bat4: $bat4, bowl1: $bowl1, bowl2: $bowl2, bowl3: $bowl3, bowl4: $bowl4, all1: $all1, all2: $all2, all3: $all3, wicket1: $wicket1, wicket2: $wicket2, bench1: $bench1, bench2: $bench2, bench3: $bench3, bench4: $bench4, bench5: $bench5, bench6: $bench6, bench7: $bench7, bench8: $bench8, flex1: $flex1, flex2: $flex2, flex3: $flex3, flex4: $flex4, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FantasyTeamInstanceCopyWith<$Res> implements $FantasyTeamInstanceCopyWith<$Res> {
  factory _$FantasyTeamInstanceCopyWith(_FantasyTeamInstance value, $Res Function(_FantasyTeamInstance) _then) = __$FantasyTeamInstanceCopyWithImpl;
@override @useResult
$Res call({
 String id, String fantasyTeamId, int matchNum, bool isLocked, String? bat1, String? bat2, String? bat3, String? bat4, String? bowl1, String? bowl2, String? bowl3, String? bowl4, String? all1, String? all2, String? all3, String? wicket1, String? wicket2, String? bench1, String? bench2, String? bench3, String? bench4, String? bench5, String? bench6, String? bench7, String? bench8, String? flex1, String? flex2, String? flex3, String? flex4, DateTime createdAt
});




}
/// @nodoc
class __$FantasyTeamInstanceCopyWithImpl<$Res>
    implements _$FantasyTeamInstanceCopyWith<$Res> {
  __$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final _FantasyTeamInstance _self;
  final $Res Function(_FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fantasyTeamId = null,Object? matchNum = null,Object? isLocked = null,Object? bat1 = freezed,Object? bat2 = freezed,Object? bat3 = freezed,Object? bat4 = freezed,Object? bowl1 = freezed,Object? bowl2 = freezed,Object? bowl3 = freezed,Object? bowl4 = freezed,Object? all1 = freezed,Object? all2 = freezed,Object? all3 = freezed,Object? wicket1 = freezed,Object? wicket2 = freezed,Object? bench1 = freezed,Object? bench2 = freezed,Object? bench3 = freezed,Object? bench4 = freezed,Object? bench5 = freezed,Object? bench6 = freezed,Object? bench7 = freezed,Object? bench8 = freezed,Object? flex1 = freezed,Object? flex2 = freezed,Object? flex3 = freezed,Object? flex4 = freezed,Object? createdAt = null,}) {
  return _then(_FantasyTeamInstance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasyTeamId: null == fantasyTeamId ? _self.fantasyTeamId : fantasyTeamId // ignore: cast_nullable_to_non_nullable
as String,matchNum: null == matchNum ? _self.matchNum : matchNum // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,bat1: freezed == bat1 ? _self.bat1 : bat1 // ignore: cast_nullable_to_non_nullable
as String?,bat2: freezed == bat2 ? _self.bat2 : bat2 // ignore: cast_nullable_to_non_nullable
as String?,bat3: freezed == bat3 ? _self.bat3 : bat3 // ignore: cast_nullable_to_non_nullable
as String?,bat4: freezed == bat4 ? _self.bat4 : bat4 // ignore: cast_nullable_to_non_nullable
as String?,bowl1: freezed == bowl1 ? _self.bowl1 : bowl1 // ignore: cast_nullable_to_non_nullable
as String?,bowl2: freezed == bowl2 ? _self.bowl2 : bowl2 // ignore: cast_nullable_to_non_nullable
as String?,bowl3: freezed == bowl3 ? _self.bowl3 : bowl3 // ignore: cast_nullable_to_non_nullable
as String?,bowl4: freezed == bowl4 ? _self.bowl4 : bowl4 // ignore: cast_nullable_to_non_nullable
as String?,all1: freezed == all1 ? _self.all1 : all1 // ignore: cast_nullable_to_non_nullable
as String?,all2: freezed == all2 ? _self.all2 : all2 // ignore: cast_nullable_to_non_nullable
as String?,all3: freezed == all3 ? _self.all3 : all3 // ignore: cast_nullable_to_non_nullable
as String?,wicket1: freezed == wicket1 ? _self.wicket1 : wicket1 // ignore: cast_nullable_to_non_nullable
as String?,wicket2: freezed == wicket2 ? _self.wicket2 : wicket2 // ignore: cast_nullable_to_non_nullable
as String?,bench1: freezed == bench1 ? _self.bench1 : bench1 // ignore: cast_nullable_to_non_nullable
as String?,bench2: freezed == bench2 ? _self.bench2 : bench2 // ignore: cast_nullable_to_non_nullable
as String?,bench3: freezed == bench3 ? _self.bench3 : bench3 // ignore: cast_nullable_to_non_nullable
as String?,bench4: freezed == bench4 ? _self.bench4 : bench4 // ignore: cast_nullable_to_non_nullable
as String?,bench5: freezed == bench5 ? _self.bench5 : bench5 // ignore: cast_nullable_to_non_nullable
as String?,bench6: freezed == bench6 ? _self.bench6 : bench6 // ignore: cast_nullable_to_non_nullable
as String?,bench7: freezed == bench7 ? _self.bench7 : bench7 // ignore: cast_nullable_to_non_nullable
as String?,bench8: freezed == bench8 ? _self.bench8 : bench8 // ignore: cast_nullable_to_non_nullable
as String?,flex1: freezed == flex1 ? _self.flex1 : flex1 // ignore: cast_nullable_to_non_nullable
as String?,flex2: freezed == flex2 ? _self.flex2 : flex2 // ignore: cast_nullable_to_non_nullable
as String?,flex3: freezed == flex3 ? _self.flex3 : flex3 // ignore: cast_nullable_to_non_nullable
as String?,flex4: freezed == flex4 ? _self.flex4 : flex4 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
