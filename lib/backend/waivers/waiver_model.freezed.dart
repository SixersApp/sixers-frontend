// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waiver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaiverPlayer {

 String get id; String get name; String get role; String get image; double get ppg;@JsonKey(name: 'match_status') String get matchStatus;
/// Create a copy of WaiverPlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaiverPlayerCopyWith<WaiverPlayer> get copyWith => _$WaiverPlayerCopyWithImpl<WaiverPlayer>(this as WaiverPlayer, _$identity);

  /// Serializes this WaiverPlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaiverPlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.image, image) || other.image == image)&&(identical(other.ppg, ppg) || other.ppg == ppg)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,image,ppg,matchStatus);

@override
String toString() {
  return 'WaiverPlayer(id: $id, name: $name, role: $role, image: $image, ppg: $ppg, matchStatus: $matchStatus)';
}


}

/// @nodoc
abstract mixin class $WaiverPlayerCopyWith<$Res>  {
  factory $WaiverPlayerCopyWith(WaiverPlayer value, $Res Function(WaiverPlayer) _then) = _$WaiverPlayerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String role, String image, double ppg,@JsonKey(name: 'match_status') String matchStatus
});




}
/// @nodoc
class _$WaiverPlayerCopyWithImpl<$Res>
    implements $WaiverPlayerCopyWith<$Res> {
  _$WaiverPlayerCopyWithImpl(this._self, this._then);

  final WaiverPlayer _self;
  final $Res Function(WaiverPlayer) _then;

/// Create a copy of WaiverPlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? image = null,Object? ppg = null,Object? matchStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,ppg: null == ppg ? _self.ppg : ppg // ignore: cast_nullable_to_non_nullable
as double,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaiverPlayer].
extension WaiverPlayerPatterns on WaiverPlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaiverPlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaiverPlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaiverPlayer value)  $default,){
final _that = this;
switch (_that) {
case _WaiverPlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaiverPlayer value)?  $default,){
final _that = this;
switch (_that) {
case _WaiverPlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String image,  double ppg, @JsonKey(name: 'match_status')  String matchStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaiverPlayer() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.image,_that.ppg,_that.matchStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String image,  double ppg, @JsonKey(name: 'match_status')  String matchStatus)  $default,) {final _that = this;
switch (_that) {
case _WaiverPlayer():
return $default(_that.id,_that.name,_that.role,_that.image,_that.ppg,_that.matchStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String role,  String image,  double ppg, @JsonKey(name: 'match_status')  String matchStatus)?  $default,) {final _that = this;
switch (_that) {
case _WaiverPlayer() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.image,_that.ppg,_that.matchStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaiverPlayer implements WaiverPlayer {
  const _WaiverPlayer({required this.id, this.name = '', this.role = '', this.image = '', this.ppg = 0.0, @JsonKey(name: 'match_status') this.matchStatus = 'NS'});
  factory _WaiverPlayer.fromJson(Map<String, dynamic> json) => _$WaiverPlayerFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String role;
@override@JsonKey() final  String image;
@override@JsonKey() final  double ppg;
@override@JsonKey(name: 'match_status') final  String matchStatus;

/// Create a copy of WaiverPlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaiverPlayerCopyWith<_WaiverPlayer> get copyWith => __$WaiverPlayerCopyWithImpl<_WaiverPlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaiverPlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaiverPlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.image, image) || other.image == image)&&(identical(other.ppg, ppg) || other.ppg == ppg)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,image,ppg,matchStatus);

@override
String toString() {
  return 'WaiverPlayer(id: $id, name: $name, role: $role, image: $image, ppg: $ppg, matchStatus: $matchStatus)';
}


}

/// @nodoc
abstract mixin class _$WaiverPlayerCopyWith<$Res> implements $WaiverPlayerCopyWith<$Res> {
  factory _$WaiverPlayerCopyWith(_WaiverPlayer value, $Res Function(_WaiverPlayer) _then) = __$WaiverPlayerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String role, String image, double ppg,@JsonKey(name: 'match_status') String matchStatus
});




}
/// @nodoc
class __$WaiverPlayerCopyWithImpl<$Res>
    implements _$WaiverPlayerCopyWith<$Res> {
  __$WaiverPlayerCopyWithImpl(this._self, this._then);

  final _WaiverPlayer _self;
  final $Res Function(_WaiverPlayer) _then;

/// Create a copy of WaiverPlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? image = null,Object? ppg = null,Object? matchStatus = null,}) {
  return _then(_WaiverPlayer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,ppg: null == ppg ? _self.ppg : ppg // ignore: cast_nullable_to_non_nullable
as double,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
