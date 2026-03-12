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
mixin _$RosterPlayerData {

 String get id;@JsonKey(name: 'player_name') String get playerName;@JsonKey(name: 'full_name') String get fullName; String get image; String get role;@JsonKey(name: 'country_name') String get countryName;@JsonKey(name: 'country_image') String get countryImage;
/// Create a copy of RosterPlayerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<RosterPlayerData> get copyWith => _$RosterPlayerDataCopyWithImpl<RosterPlayerData>(this as RosterPlayerData, _$identity);

  /// Serializes this RosterPlayerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterPlayerData&&(identical(other.id, id) || other.id == id)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.countryImage, countryImage) || other.countryImage == countryImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playerName,fullName,image,role,countryName,countryImage);

@override
String toString() {
  return 'RosterPlayerData(id: $id, playerName: $playerName, fullName: $fullName, image: $image, role: $role, countryName: $countryName, countryImage: $countryImage)';
}


}

/// @nodoc
abstract mixin class $RosterPlayerDataCopyWith<$Res>  {
  factory $RosterPlayerDataCopyWith(RosterPlayerData value, $Res Function(RosterPlayerData) _then) = _$RosterPlayerDataCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'player_name') String playerName,@JsonKey(name: 'full_name') String fullName, String image, String role,@JsonKey(name: 'country_name') String countryName,@JsonKey(name: 'country_image') String countryImage
});




}
/// @nodoc
class _$RosterPlayerDataCopyWithImpl<$Res>
    implements $RosterPlayerDataCopyWith<$Res> {
  _$RosterPlayerDataCopyWithImpl(this._self, this._then);

  final RosterPlayerData _self;
  final $Res Function(RosterPlayerData) _then;

/// Create a copy of RosterPlayerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? playerName = null,Object? fullName = null,Object? image = null,Object? role = null,Object? countryName = null,Object? countryImage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,countryImage: null == countryImage ? _self.countryImage : countryImage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RosterPlayerData].
extension RosterPlayerDataPatterns on RosterPlayerData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosterPlayerData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosterPlayerData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosterPlayerData value)  $default,){
final _that = this;
switch (_that) {
case _RosterPlayerData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosterPlayerData value)?  $default,){
final _that = this;
switch (_that) {
case _RosterPlayerData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'player_name')  String playerName, @JsonKey(name: 'full_name')  String fullName,  String image,  String role, @JsonKey(name: 'country_name')  String countryName, @JsonKey(name: 'country_image')  String countryImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RosterPlayerData() when $default != null:
return $default(_that.id,_that.playerName,_that.fullName,_that.image,_that.role,_that.countryName,_that.countryImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'player_name')  String playerName, @JsonKey(name: 'full_name')  String fullName,  String image,  String role, @JsonKey(name: 'country_name')  String countryName, @JsonKey(name: 'country_image')  String countryImage)  $default,) {final _that = this;
switch (_that) {
case _RosterPlayerData():
return $default(_that.id,_that.playerName,_that.fullName,_that.image,_that.role,_that.countryName,_that.countryImage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'player_name')  String playerName, @JsonKey(name: 'full_name')  String fullName,  String image,  String role, @JsonKey(name: 'country_name')  String countryName, @JsonKey(name: 'country_image')  String countryImage)?  $default,) {final _that = this;
switch (_that) {
case _RosterPlayerData() when $default != null:
return $default(_that.id,_that.playerName,_that.fullName,_that.image,_that.role,_that.countryName,_that.countryImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RosterPlayerData implements RosterPlayerData {
  const _RosterPlayerData({required this.id, @JsonKey(name: 'player_name') required this.playerName, @JsonKey(name: 'full_name') required this.fullName, required this.image, required this.role, @JsonKey(name: 'country_name') required this.countryName, @JsonKey(name: 'country_image') required this.countryImage});
  factory _RosterPlayerData.fromJson(Map<String, dynamic> json) => _$RosterPlayerDataFromJson(json);

@override final  String id;
@override@JsonKey(name: 'player_name') final  String playerName;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String image;
@override final  String role;
@override@JsonKey(name: 'country_name') final  String countryName;
@override@JsonKey(name: 'country_image') final  String countryImage;

/// Create a copy of RosterPlayerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosterPlayerDataCopyWith<_RosterPlayerData> get copyWith => __$RosterPlayerDataCopyWithImpl<_RosterPlayerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RosterPlayerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosterPlayerData&&(identical(other.id, id) || other.id == id)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.countryImage, countryImage) || other.countryImage == countryImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playerName,fullName,image,role,countryName,countryImage);

@override
String toString() {
  return 'RosterPlayerData(id: $id, playerName: $playerName, fullName: $fullName, image: $image, role: $role, countryName: $countryName, countryImage: $countryImage)';
}


}

/// @nodoc
abstract mixin class _$RosterPlayerDataCopyWith<$Res> implements $RosterPlayerDataCopyWith<$Res> {
  factory _$RosterPlayerDataCopyWith(_RosterPlayerData value, $Res Function(_RosterPlayerData) _then) = __$RosterPlayerDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'player_name') String playerName,@JsonKey(name: 'full_name') String fullName, String image, String role,@JsonKey(name: 'country_name') String countryName,@JsonKey(name: 'country_image') String countryImage
});




}
/// @nodoc
class __$RosterPlayerDataCopyWithImpl<$Res>
    implements _$RosterPlayerDataCopyWith<$Res> {
  __$RosterPlayerDataCopyWithImpl(this._self, this._then);

  final _RosterPlayerData _self;
  final $Res Function(_RosterPlayerData) _then;

/// Create a copy of RosterPlayerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? playerName = null,Object? fullName = null,Object? image = null,Object? role = null,Object? countryName = null,Object? countryImage = null,}) {
  return _then(_RosterPlayerData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,countryImage: null == countryImage ? _self.countryImage : countryImage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RosterPlayers {

 RosterPlayerData? get bat1; RosterPlayerData? get bat2; RosterPlayerData? get bat3; RosterPlayerData? get bat4; RosterPlayerData? get bowl1; RosterPlayerData? get bowl2; RosterPlayerData? get bowl3; RosterPlayerData? get bowl4; RosterPlayerData? get all1; RosterPlayerData? get all2; RosterPlayerData? get all3; RosterPlayerData? get wicket1; RosterPlayerData? get wicket2; RosterPlayerData? get bench1; RosterPlayerData? get bench2; RosterPlayerData? get bench3; RosterPlayerData? get bench4; RosterPlayerData? get bench5; RosterPlayerData? get bench6; RosterPlayerData? get bench7; RosterPlayerData? get bench8; RosterPlayerData? get flex1; RosterPlayerData? get flex2; RosterPlayerData? get flex3; RosterPlayerData? get flex4;
/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosterPlayersCopyWith<RosterPlayers> get copyWith => _$RosterPlayersCopyWithImpl<RosterPlayers>(this as RosterPlayers, _$identity);

  /// Serializes this RosterPlayers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterPlayers&&(identical(other.bat1, bat1) || other.bat1 == bat1)&&(identical(other.bat2, bat2) || other.bat2 == bat2)&&(identical(other.bat3, bat3) || other.bat3 == bat3)&&(identical(other.bat4, bat4) || other.bat4 == bat4)&&(identical(other.bowl1, bowl1) || other.bowl1 == bowl1)&&(identical(other.bowl2, bowl2) || other.bowl2 == bowl2)&&(identical(other.bowl3, bowl3) || other.bowl3 == bowl3)&&(identical(other.bowl4, bowl4) || other.bowl4 == bowl4)&&(identical(other.all1, all1) || other.all1 == all1)&&(identical(other.all2, all2) || other.all2 == all2)&&(identical(other.all3, all3) || other.all3 == all3)&&(identical(other.wicket1, wicket1) || other.wicket1 == wicket1)&&(identical(other.wicket2, wicket2) || other.wicket2 == wicket2)&&(identical(other.bench1, bench1) || other.bench1 == bench1)&&(identical(other.bench2, bench2) || other.bench2 == bench2)&&(identical(other.bench3, bench3) || other.bench3 == bench3)&&(identical(other.bench4, bench4) || other.bench4 == bench4)&&(identical(other.bench5, bench5) || other.bench5 == bench5)&&(identical(other.bench6, bench6) || other.bench6 == bench6)&&(identical(other.bench7, bench7) || other.bench7 == bench7)&&(identical(other.bench8, bench8) || other.bench8 == bench8)&&(identical(other.flex1, flex1) || other.flex1 == flex1)&&(identical(other.flex2, flex2) || other.flex2 == flex2)&&(identical(other.flex3, flex3) || other.flex3 == flex3)&&(identical(other.flex4, flex4) || other.flex4 == flex4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bat1,bat2,bat3,bat4,bowl1,bowl2,bowl3,bowl4,all1,all2,all3,wicket1,wicket2,bench1,bench2,bench3,bench4,bench5,bench6,bench7,bench8,flex1,flex2,flex3,flex4]);

@override
String toString() {
  return 'RosterPlayers(bat1: $bat1, bat2: $bat2, bat3: $bat3, bat4: $bat4, bowl1: $bowl1, bowl2: $bowl2, bowl3: $bowl3, bowl4: $bowl4, all1: $all1, all2: $all2, all3: $all3, wicket1: $wicket1, wicket2: $wicket2, bench1: $bench1, bench2: $bench2, bench3: $bench3, bench4: $bench4, bench5: $bench5, bench6: $bench6, bench7: $bench7, bench8: $bench8, flex1: $flex1, flex2: $flex2, flex3: $flex3, flex4: $flex4)';
}


}

/// @nodoc
abstract mixin class $RosterPlayersCopyWith<$Res>  {
  factory $RosterPlayersCopyWith(RosterPlayers value, $Res Function(RosterPlayers) _then) = _$RosterPlayersCopyWithImpl;
@useResult
$Res call({
 RosterPlayerData? bat1, RosterPlayerData? bat2, RosterPlayerData? bat3, RosterPlayerData? bat4, RosterPlayerData? bowl1, RosterPlayerData? bowl2, RosterPlayerData? bowl3, RosterPlayerData? bowl4, RosterPlayerData? all1, RosterPlayerData? all2, RosterPlayerData? all3, RosterPlayerData? wicket1, RosterPlayerData? wicket2, RosterPlayerData? bench1, RosterPlayerData? bench2, RosterPlayerData? bench3, RosterPlayerData? bench4, RosterPlayerData? bench5, RosterPlayerData? bench6, RosterPlayerData? bench7, RosterPlayerData? bench8, RosterPlayerData? flex1, RosterPlayerData? flex2, RosterPlayerData? flex3, RosterPlayerData? flex4
});


$RosterPlayerDataCopyWith<$Res>? get bat1;$RosterPlayerDataCopyWith<$Res>? get bat2;$RosterPlayerDataCopyWith<$Res>? get bat3;$RosterPlayerDataCopyWith<$Res>? get bat4;$RosterPlayerDataCopyWith<$Res>? get bowl1;$RosterPlayerDataCopyWith<$Res>? get bowl2;$RosterPlayerDataCopyWith<$Res>? get bowl3;$RosterPlayerDataCopyWith<$Res>? get bowl4;$RosterPlayerDataCopyWith<$Res>? get all1;$RosterPlayerDataCopyWith<$Res>? get all2;$RosterPlayerDataCopyWith<$Res>? get all3;$RosterPlayerDataCopyWith<$Res>? get wicket1;$RosterPlayerDataCopyWith<$Res>? get wicket2;$RosterPlayerDataCopyWith<$Res>? get bench1;$RosterPlayerDataCopyWith<$Res>? get bench2;$RosterPlayerDataCopyWith<$Res>? get bench3;$RosterPlayerDataCopyWith<$Res>? get bench4;$RosterPlayerDataCopyWith<$Res>? get bench5;$RosterPlayerDataCopyWith<$Res>? get bench6;$RosterPlayerDataCopyWith<$Res>? get bench7;$RosterPlayerDataCopyWith<$Res>? get bench8;$RosterPlayerDataCopyWith<$Res>? get flex1;$RosterPlayerDataCopyWith<$Res>? get flex2;$RosterPlayerDataCopyWith<$Res>? get flex3;$RosterPlayerDataCopyWith<$Res>? get flex4;

}
/// @nodoc
class _$RosterPlayersCopyWithImpl<$Res>
    implements $RosterPlayersCopyWith<$Res> {
  _$RosterPlayersCopyWithImpl(this._self, this._then);

  final RosterPlayers _self;
  final $Res Function(RosterPlayers) _then;

/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bat1 = freezed,Object? bat2 = freezed,Object? bat3 = freezed,Object? bat4 = freezed,Object? bowl1 = freezed,Object? bowl2 = freezed,Object? bowl3 = freezed,Object? bowl4 = freezed,Object? all1 = freezed,Object? all2 = freezed,Object? all3 = freezed,Object? wicket1 = freezed,Object? wicket2 = freezed,Object? bench1 = freezed,Object? bench2 = freezed,Object? bench3 = freezed,Object? bench4 = freezed,Object? bench5 = freezed,Object? bench6 = freezed,Object? bench7 = freezed,Object? bench8 = freezed,Object? flex1 = freezed,Object? flex2 = freezed,Object? flex3 = freezed,Object? flex4 = freezed,}) {
  return _then(_self.copyWith(
bat1: freezed == bat1 ? _self.bat1 : bat1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat2: freezed == bat2 ? _self.bat2 : bat2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat3: freezed == bat3 ? _self.bat3 : bat3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat4: freezed == bat4 ? _self.bat4 : bat4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl1: freezed == bowl1 ? _self.bowl1 : bowl1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl2: freezed == bowl2 ? _self.bowl2 : bowl2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl3: freezed == bowl3 ? _self.bowl3 : bowl3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl4: freezed == bowl4 ? _self.bowl4 : bowl4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all1: freezed == all1 ? _self.all1 : all1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all2: freezed == all2 ? _self.all2 : all2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all3: freezed == all3 ? _self.all3 : all3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,wicket1: freezed == wicket1 ? _self.wicket1 : wicket1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,wicket2: freezed == wicket2 ? _self.wicket2 : wicket2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench1: freezed == bench1 ? _self.bench1 : bench1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench2: freezed == bench2 ? _self.bench2 : bench2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench3: freezed == bench3 ? _self.bench3 : bench3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench4: freezed == bench4 ? _self.bench4 : bench4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench5: freezed == bench5 ? _self.bench5 : bench5 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench6: freezed == bench6 ? _self.bench6 : bench6 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench7: freezed == bench7 ? _self.bench7 : bench7 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench8: freezed == bench8 ? _self.bench8 : bench8 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex1: freezed == flex1 ? _self.flex1 : flex1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex2: freezed == flex2 ? _self.flex2 : flex2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex3: freezed == flex3 ? _self.flex3 : flex3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex4: freezed == flex4 ? _self.flex4 : flex4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,
  ));
}
/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat1 {
    if (_self.bat1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat1!, (value) {
    return _then(_self.copyWith(bat1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat2 {
    if (_self.bat2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat2!, (value) {
    return _then(_self.copyWith(bat2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat3 {
    if (_self.bat3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat3!, (value) {
    return _then(_self.copyWith(bat3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat4 {
    if (_self.bat4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat4!, (value) {
    return _then(_self.copyWith(bat4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl1 {
    if (_self.bowl1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl1!, (value) {
    return _then(_self.copyWith(bowl1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl2 {
    if (_self.bowl2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl2!, (value) {
    return _then(_self.copyWith(bowl2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl3 {
    if (_self.bowl3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl3!, (value) {
    return _then(_self.copyWith(bowl3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl4 {
    if (_self.bowl4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl4!, (value) {
    return _then(_self.copyWith(bowl4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all1 {
    if (_self.all1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all1!, (value) {
    return _then(_self.copyWith(all1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all2 {
    if (_self.all2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all2!, (value) {
    return _then(_self.copyWith(all2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all3 {
    if (_self.all3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all3!, (value) {
    return _then(_self.copyWith(all3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get wicket1 {
    if (_self.wicket1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.wicket1!, (value) {
    return _then(_self.copyWith(wicket1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get wicket2 {
    if (_self.wicket2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.wicket2!, (value) {
    return _then(_self.copyWith(wicket2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench1 {
    if (_self.bench1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench1!, (value) {
    return _then(_self.copyWith(bench1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench2 {
    if (_self.bench2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench2!, (value) {
    return _then(_self.copyWith(bench2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench3 {
    if (_self.bench3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench3!, (value) {
    return _then(_self.copyWith(bench3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench4 {
    if (_self.bench4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench4!, (value) {
    return _then(_self.copyWith(bench4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench5 {
    if (_self.bench5 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench5!, (value) {
    return _then(_self.copyWith(bench5: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench6 {
    if (_self.bench6 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench6!, (value) {
    return _then(_self.copyWith(bench6: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench7 {
    if (_self.bench7 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench7!, (value) {
    return _then(_self.copyWith(bench7: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench8 {
    if (_self.bench8 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench8!, (value) {
    return _then(_self.copyWith(bench8: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex1 {
    if (_self.flex1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex1!, (value) {
    return _then(_self.copyWith(flex1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex2 {
    if (_self.flex2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex2!, (value) {
    return _then(_self.copyWith(flex2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex3 {
    if (_self.flex3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex3!, (value) {
    return _then(_self.copyWith(flex3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex4 {
    if (_self.flex4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex4!, (value) {
    return _then(_self.copyWith(flex4: value));
  });
}
}


/// Adds pattern-matching-related methods to [RosterPlayers].
extension RosterPlayersPatterns on RosterPlayers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosterPlayers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosterPlayers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosterPlayers value)  $default,){
final _that = this;
switch (_that) {
case _RosterPlayers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosterPlayers value)?  $default,){
final _that = this;
switch (_that) {
case _RosterPlayers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RosterPlayerData? bat1,  RosterPlayerData? bat2,  RosterPlayerData? bat3,  RosterPlayerData? bat4,  RosterPlayerData? bowl1,  RosterPlayerData? bowl2,  RosterPlayerData? bowl3,  RosterPlayerData? bowl4,  RosterPlayerData? all1,  RosterPlayerData? all2,  RosterPlayerData? all3,  RosterPlayerData? wicket1,  RosterPlayerData? wicket2,  RosterPlayerData? bench1,  RosterPlayerData? bench2,  RosterPlayerData? bench3,  RosterPlayerData? bench4,  RosterPlayerData? bench5,  RosterPlayerData? bench6,  RosterPlayerData? bench7,  RosterPlayerData? bench8,  RosterPlayerData? flex1,  RosterPlayerData? flex2,  RosterPlayerData? flex3,  RosterPlayerData? flex4)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RosterPlayers() when $default != null:
return $default(_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RosterPlayerData? bat1,  RosterPlayerData? bat2,  RosterPlayerData? bat3,  RosterPlayerData? bat4,  RosterPlayerData? bowl1,  RosterPlayerData? bowl2,  RosterPlayerData? bowl3,  RosterPlayerData? bowl4,  RosterPlayerData? all1,  RosterPlayerData? all2,  RosterPlayerData? all3,  RosterPlayerData? wicket1,  RosterPlayerData? wicket2,  RosterPlayerData? bench1,  RosterPlayerData? bench2,  RosterPlayerData? bench3,  RosterPlayerData? bench4,  RosterPlayerData? bench5,  RosterPlayerData? bench6,  RosterPlayerData? bench7,  RosterPlayerData? bench8,  RosterPlayerData? flex1,  RosterPlayerData? flex2,  RosterPlayerData? flex3,  RosterPlayerData? flex4)  $default,) {final _that = this;
switch (_that) {
case _RosterPlayers():
return $default(_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RosterPlayerData? bat1,  RosterPlayerData? bat2,  RosterPlayerData? bat3,  RosterPlayerData? bat4,  RosterPlayerData? bowl1,  RosterPlayerData? bowl2,  RosterPlayerData? bowl3,  RosterPlayerData? bowl4,  RosterPlayerData? all1,  RosterPlayerData? all2,  RosterPlayerData? all3,  RosterPlayerData? wicket1,  RosterPlayerData? wicket2,  RosterPlayerData? bench1,  RosterPlayerData? bench2,  RosterPlayerData? bench3,  RosterPlayerData? bench4,  RosterPlayerData? bench5,  RosterPlayerData? bench6,  RosterPlayerData? bench7,  RosterPlayerData? bench8,  RosterPlayerData? flex1,  RosterPlayerData? flex2,  RosterPlayerData? flex3,  RosterPlayerData? flex4)?  $default,) {final _that = this;
switch (_that) {
case _RosterPlayers() when $default != null:
return $default(_that.bat1,_that.bat2,_that.bat3,_that.bat4,_that.bowl1,_that.bowl2,_that.bowl3,_that.bowl4,_that.all1,_that.all2,_that.all3,_that.wicket1,_that.wicket2,_that.bench1,_that.bench2,_that.bench3,_that.bench4,_that.bench5,_that.bench6,_that.bench7,_that.bench8,_that.flex1,_that.flex2,_that.flex3,_that.flex4);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RosterPlayers implements RosterPlayers {
  const _RosterPlayers({this.bat1, this.bat2, this.bat3, this.bat4, this.bowl1, this.bowl2, this.bowl3, this.bowl4, this.all1, this.all2, this.all3, this.wicket1, this.wicket2, this.bench1, this.bench2, this.bench3, this.bench4, this.bench5, this.bench6, this.bench7, this.bench8, this.flex1, this.flex2, this.flex3, this.flex4});
  factory _RosterPlayers.fromJson(Map<String, dynamic> json) => _$RosterPlayersFromJson(json);

@override final  RosterPlayerData? bat1;
@override final  RosterPlayerData? bat2;
@override final  RosterPlayerData? bat3;
@override final  RosterPlayerData? bat4;
@override final  RosterPlayerData? bowl1;
@override final  RosterPlayerData? bowl2;
@override final  RosterPlayerData? bowl3;
@override final  RosterPlayerData? bowl4;
@override final  RosterPlayerData? all1;
@override final  RosterPlayerData? all2;
@override final  RosterPlayerData? all3;
@override final  RosterPlayerData? wicket1;
@override final  RosterPlayerData? wicket2;
@override final  RosterPlayerData? bench1;
@override final  RosterPlayerData? bench2;
@override final  RosterPlayerData? bench3;
@override final  RosterPlayerData? bench4;
@override final  RosterPlayerData? bench5;
@override final  RosterPlayerData? bench6;
@override final  RosterPlayerData? bench7;
@override final  RosterPlayerData? bench8;
@override final  RosterPlayerData? flex1;
@override final  RosterPlayerData? flex2;
@override final  RosterPlayerData? flex3;
@override final  RosterPlayerData? flex4;

/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosterPlayersCopyWith<_RosterPlayers> get copyWith => __$RosterPlayersCopyWithImpl<_RosterPlayers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RosterPlayersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosterPlayers&&(identical(other.bat1, bat1) || other.bat1 == bat1)&&(identical(other.bat2, bat2) || other.bat2 == bat2)&&(identical(other.bat3, bat3) || other.bat3 == bat3)&&(identical(other.bat4, bat4) || other.bat4 == bat4)&&(identical(other.bowl1, bowl1) || other.bowl1 == bowl1)&&(identical(other.bowl2, bowl2) || other.bowl2 == bowl2)&&(identical(other.bowl3, bowl3) || other.bowl3 == bowl3)&&(identical(other.bowl4, bowl4) || other.bowl4 == bowl4)&&(identical(other.all1, all1) || other.all1 == all1)&&(identical(other.all2, all2) || other.all2 == all2)&&(identical(other.all3, all3) || other.all3 == all3)&&(identical(other.wicket1, wicket1) || other.wicket1 == wicket1)&&(identical(other.wicket2, wicket2) || other.wicket2 == wicket2)&&(identical(other.bench1, bench1) || other.bench1 == bench1)&&(identical(other.bench2, bench2) || other.bench2 == bench2)&&(identical(other.bench3, bench3) || other.bench3 == bench3)&&(identical(other.bench4, bench4) || other.bench4 == bench4)&&(identical(other.bench5, bench5) || other.bench5 == bench5)&&(identical(other.bench6, bench6) || other.bench6 == bench6)&&(identical(other.bench7, bench7) || other.bench7 == bench7)&&(identical(other.bench8, bench8) || other.bench8 == bench8)&&(identical(other.flex1, flex1) || other.flex1 == flex1)&&(identical(other.flex2, flex2) || other.flex2 == flex2)&&(identical(other.flex3, flex3) || other.flex3 == flex3)&&(identical(other.flex4, flex4) || other.flex4 == flex4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bat1,bat2,bat3,bat4,bowl1,bowl2,bowl3,bowl4,all1,all2,all3,wicket1,wicket2,bench1,bench2,bench3,bench4,bench5,bench6,bench7,bench8,flex1,flex2,flex3,flex4]);

@override
String toString() {
  return 'RosterPlayers(bat1: $bat1, bat2: $bat2, bat3: $bat3, bat4: $bat4, bowl1: $bowl1, bowl2: $bowl2, bowl3: $bowl3, bowl4: $bowl4, all1: $all1, all2: $all2, all3: $all3, wicket1: $wicket1, wicket2: $wicket2, bench1: $bench1, bench2: $bench2, bench3: $bench3, bench4: $bench4, bench5: $bench5, bench6: $bench6, bench7: $bench7, bench8: $bench8, flex1: $flex1, flex2: $flex2, flex3: $flex3, flex4: $flex4)';
}


}

/// @nodoc
abstract mixin class _$RosterPlayersCopyWith<$Res> implements $RosterPlayersCopyWith<$Res> {
  factory _$RosterPlayersCopyWith(_RosterPlayers value, $Res Function(_RosterPlayers) _then) = __$RosterPlayersCopyWithImpl;
@override @useResult
$Res call({
 RosterPlayerData? bat1, RosterPlayerData? bat2, RosterPlayerData? bat3, RosterPlayerData? bat4, RosterPlayerData? bowl1, RosterPlayerData? bowl2, RosterPlayerData? bowl3, RosterPlayerData? bowl4, RosterPlayerData? all1, RosterPlayerData? all2, RosterPlayerData? all3, RosterPlayerData? wicket1, RosterPlayerData? wicket2, RosterPlayerData? bench1, RosterPlayerData? bench2, RosterPlayerData? bench3, RosterPlayerData? bench4, RosterPlayerData? bench5, RosterPlayerData? bench6, RosterPlayerData? bench7, RosterPlayerData? bench8, RosterPlayerData? flex1, RosterPlayerData? flex2, RosterPlayerData? flex3, RosterPlayerData? flex4
});


@override $RosterPlayerDataCopyWith<$Res>? get bat1;@override $RosterPlayerDataCopyWith<$Res>? get bat2;@override $RosterPlayerDataCopyWith<$Res>? get bat3;@override $RosterPlayerDataCopyWith<$Res>? get bat4;@override $RosterPlayerDataCopyWith<$Res>? get bowl1;@override $RosterPlayerDataCopyWith<$Res>? get bowl2;@override $RosterPlayerDataCopyWith<$Res>? get bowl3;@override $RosterPlayerDataCopyWith<$Res>? get bowl4;@override $RosterPlayerDataCopyWith<$Res>? get all1;@override $RosterPlayerDataCopyWith<$Res>? get all2;@override $RosterPlayerDataCopyWith<$Res>? get all3;@override $RosterPlayerDataCopyWith<$Res>? get wicket1;@override $RosterPlayerDataCopyWith<$Res>? get wicket2;@override $RosterPlayerDataCopyWith<$Res>? get bench1;@override $RosterPlayerDataCopyWith<$Res>? get bench2;@override $RosterPlayerDataCopyWith<$Res>? get bench3;@override $RosterPlayerDataCopyWith<$Res>? get bench4;@override $RosterPlayerDataCopyWith<$Res>? get bench5;@override $RosterPlayerDataCopyWith<$Res>? get bench6;@override $RosterPlayerDataCopyWith<$Res>? get bench7;@override $RosterPlayerDataCopyWith<$Res>? get bench8;@override $RosterPlayerDataCopyWith<$Res>? get flex1;@override $RosterPlayerDataCopyWith<$Res>? get flex2;@override $RosterPlayerDataCopyWith<$Res>? get flex3;@override $RosterPlayerDataCopyWith<$Res>? get flex4;

}
/// @nodoc
class __$RosterPlayersCopyWithImpl<$Res>
    implements _$RosterPlayersCopyWith<$Res> {
  __$RosterPlayersCopyWithImpl(this._self, this._then);

  final _RosterPlayers _self;
  final $Res Function(_RosterPlayers) _then;

/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bat1 = freezed,Object? bat2 = freezed,Object? bat3 = freezed,Object? bat4 = freezed,Object? bowl1 = freezed,Object? bowl2 = freezed,Object? bowl3 = freezed,Object? bowl4 = freezed,Object? all1 = freezed,Object? all2 = freezed,Object? all3 = freezed,Object? wicket1 = freezed,Object? wicket2 = freezed,Object? bench1 = freezed,Object? bench2 = freezed,Object? bench3 = freezed,Object? bench4 = freezed,Object? bench5 = freezed,Object? bench6 = freezed,Object? bench7 = freezed,Object? bench8 = freezed,Object? flex1 = freezed,Object? flex2 = freezed,Object? flex3 = freezed,Object? flex4 = freezed,}) {
  return _then(_RosterPlayers(
bat1: freezed == bat1 ? _self.bat1 : bat1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat2: freezed == bat2 ? _self.bat2 : bat2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat3: freezed == bat3 ? _self.bat3 : bat3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bat4: freezed == bat4 ? _self.bat4 : bat4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl1: freezed == bowl1 ? _self.bowl1 : bowl1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl2: freezed == bowl2 ? _self.bowl2 : bowl2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl3: freezed == bowl3 ? _self.bowl3 : bowl3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bowl4: freezed == bowl4 ? _self.bowl4 : bowl4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all1: freezed == all1 ? _self.all1 : all1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all2: freezed == all2 ? _self.all2 : all2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,all3: freezed == all3 ? _self.all3 : all3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,wicket1: freezed == wicket1 ? _self.wicket1 : wicket1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,wicket2: freezed == wicket2 ? _self.wicket2 : wicket2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench1: freezed == bench1 ? _self.bench1 : bench1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench2: freezed == bench2 ? _self.bench2 : bench2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench3: freezed == bench3 ? _self.bench3 : bench3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench4: freezed == bench4 ? _self.bench4 : bench4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench5: freezed == bench5 ? _self.bench5 : bench5 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench6: freezed == bench6 ? _self.bench6 : bench6 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench7: freezed == bench7 ? _self.bench7 : bench7 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,bench8: freezed == bench8 ? _self.bench8 : bench8 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex1: freezed == flex1 ? _self.flex1 : flex1 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex2: freezed == flex2 ? _self.flex2 : flex2 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex3: freezed == flex3 ? _self.flex3 : flex3 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,flex4: freezed == flex4 ? _self.flex4 : flex4 // ignore: cast_nullable_to_non_nullable
as RosterPlayerData?,
  ));
}

/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat1 {
    if (_self.bat1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat1!, (value) {
    return _then(_self.copyWith(bat1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat2 {
    if (_self.bat2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat2!, (value) {
    return _then(_self.copyWith(bat2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat3 {
    if (_self.bat3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat3!, (value) {
    return _then(_self.copyWith(bat3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bat4 {
    if (_self.bat4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bat4!, (value) {
    return _then(_self.copyWith(bat4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl1 {
    if (_self.bowl1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl1!, (value) {
    return _then(_self.copyWith(bowl1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl2 {
    if (_self.bowl2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl2!, (value) {
    return _then(_self.copyWith(bowl2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl3 {
    if (_self.bowl3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl3!, (value) {
    return _then(_self.copyWith(bowl3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bowl4 {
    if (_self.bowl4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bowl4!, (value) {
    return _then(_self.copyWith(bowl4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all1 {
    if (_self.all1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all1!, (value) {
    return _then(_self.copyWith(all1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all2 {
    if (_self.all2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all2!, (value) {
    return _then(_self.copyWith(all2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get all3 {
    if (_self.all3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.all3!, (value) {
    return _then(_self.copyWith(all3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get wicket1 {
    if (_self.wicket1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.wicket1!, (value) {
    return _then(_self.copyWith(wicket1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get wicket2 {
    if (_self.wicket2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.wicket2!, (value) {
    return _then(_self.copyWith(wicket2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench1 {
    if (_self.bench1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench1!, (value) {
    return _then(_self.copyWith(bench1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench2 {
    if (_self.bench2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench2!, (value) {
    return _then(_self.copyWith(bench2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench3 {
    if (_self.bench3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench3!, (value) {
    return _then(_self.copyWith(bench3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench4 {
    if (_self.bench4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench4!, (value) {
    return _then(_self.copyWith(bench4: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench5 {
    if (_self.bench5 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench5!, (value) {
    return _then(_self.copyWith(bench5: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench6 {
    if (_self.bench6 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench6!, (value) {
    return _then(_self.copyWith(bench6: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench7 {
    if (_self.bench7 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench7!, (value) {
    return _then(_self.copyWith(bench7: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get bench8 {
    if (_self.bench8 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.bench8!, (value) {
    return _then(_self.copyWith(bench8: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex1 {
    if (_self.flex1 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex1!, (value) {
    return _then(_self.copyWith(flex1: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex2 {
    if (_self.flex2 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex2!, (value) {
    return _then(_self.copyWith(flex2: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex3 {
    if (_self.flex3 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex3!, (value) {
    return _then(_self.copyWith(flex3: value));
  });
}/// Create a copy of RosterPlayers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayerDataCopyWith<$Res>? get flex4 {
    if (_self.flex4 == null) {
    return null;
  }

  return $RosterPlayerDataCopyWith<$Res>(_self.flex4!, (value) {
    return _then(_self.copyWith(flex4: value));
  });
}
}


/// @nodoc
mixin _$FantasyTeamInstance {

 String get id; String get fantasy_team_id; int get match_num; bool get is_locked; String? get captain; String? get vice_captain; RosterPlayers? get players;
/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FantasyTeamInstanceCopyWith<FantasyTeamInstance> get copyWith => _$FantasyTeamInstanceCopyWithImpl<FantasyTeamInstance>(this as FantasyTeamInstance, _$identity);

  /// Serializes this FantasyTeamInstance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasy_team_id, fantasy_team_id) || other.fantasy_team_id == fantasy_team_id)&&(identical(other.match_num, match_num) || other.match_num == match_num)&&(identical(other.is_locked, is_locked) || other.is_locked == is_locked)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.vice_captain, vice_captain) || other.vice_captain == vice_captain)&&(identical(other.players, players) || other.players == players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fantasy_team_id,match_num,is_locked,captain,vice_captain,players);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasy_team_id: $fantasy_team_id, match_num: $match_num, is_locked: $is_locked, captain: $captain, vice_captain: $vice_captain, players: $players)';
}


}

/// @nodoc
abstract mixin class $FantasyTeamInstanceCopyWith<$Res>  {
  factory $FantasyTeamInstanceCopyWith(FantasyTeamInstance value, $Res Function(FantasyTeamInstance) _then) = _$FantasyTeamInstanceCopyWithImpl;
@useResult
$Res call({
 String id, String fantasy_team_id, int match_num, bool is_locked, String? captain, String? vice_captain, RosterPlayers? players
});


$RosterPlayersCopyWith<$Res>? get players;

}
/// @nodoc
class _$FantasyTeamInstanceCopyWithImpl<$Res>
    implements $FantasyTeamInstanceCopyWith<$Res> {
  _$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final FantasyTeamInstance _self;
  final $Res Function(FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fantasy_team_id = null,Object? match_num = null,Object? is_locked = null,Object? captain = freezed,Object? vice_captain = freezed,Object? players = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasy_team_id: null == fantasy_team_id ? _self.fantasy_team_id : fantasy_team_id // ignore: cast_nullable_to_non_nullable
as String,match_num: null == match_num ? _self.match_num : match_num // ignore: cast_nullable_to_non_nullable
as int,is_locked: null == is_locked ? _self.is_locked : is_locked // ignore: cast_nullable_to_non_nullable
as bool,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,vice_captain: freezed == vice_captain ? _self.vice_captain : vice_captain // ignore: cast_nullable_to_non_nullable
as String?,players: freezed == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as RosterPlayers?,
  ));
}
/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayersCopyWith<$Res>? get players {
    if (_self.players == null) {
    return null;
  }

  return $RosterPlayersCopyWith<$Res>(_self.players!, (value) {
    return _then(_self.copyWith(players: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fantasy_team_id,  int match_num,  bool is_locked,  String? captain,  String? vice_captain,  RosterPlayers? players)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasy_team_id,_that.match_num,_that.is_locked,_that.captain,_that.vice_captain,_that.players);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fantasy_team_id,  int match_num,  bool is_locked,  String? captain,  String? vice_captain,  RosterPlayers? players)  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance():
return $default(_that.id,_that.fantasy_team_id,_that.match_num,_that.is_locked,_that.captain,_that.vice_captain,_that.players);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fantasy_team_id,  int match_num,  bool is_locked,  String? captain,  String? vice_captain,  RosterPlayers? players)?  $default,) {final _that = this;
switch (_that) {
case _FantasyTeamInstance() when $default != null:
return $default(_that.id,_that.fantasy_team_id,_that.match_num,_that.is_locked,_that.captain,_that.vice_captain,_that.players);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FantasyTeamInstance implements FantasyTeamInstance {
  const _FantasyTeamInstance({required this.id, required this.fantasy_team_id, required this.match_num, required this.is_locked, this.captain, this.vice_captain, this.players});
  factory _FantasyTeamInstance.fromJson(Map<String, dynamic> json) => _$FantasyTeamInstanceFromJson(json);

@override final  String id;
@override final  String fantasy_team_id;
@override final  int match_num;
@override final  bool is_locked;
@override final  String? captain;
@override final  String? vice_captain;
@override final  RosterPlayers? players;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FantasyTeamInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.fantasy_team_id, fantasy_team_id) || other.fantasy_team_id == fantasy_team_id)&&(identical(other.match_num, match_num) || other.match_num == match_num)&&(identical(other.is_locked, is_locked) || other.is_locked == is_locked)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.vice_captain, vice_captain) || other.vice_captain == vice_captain)&&(identical(other.players, players) || other.players == players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fantasy_team_id,match_num,is_locked,captain,vice_captain,players);

@override
String toString() {
  return 'FantasyTeamInstance(id: $id, fantasy_team_id: $fantasy_team_id, match_num: $match_num, is_locked: $is_locked, captain: $captain, vice_captain: $vice_captain, players: $players)';
}


}

/// @nodoc
abstract mixin class _$FantasyTeamInstanceCopyWith<$Res> implements $FantasyTeamInstanceCopyWith<$Res> {
  factory _$FantasyTeamInstanceCopyWith(_FantasyTeamInstance value, $Res Function(_FantasyTeamInstance) _then) = __$FantasyTeamInstanceCopyWithImpl;
@override @useResult
$Res call({
 String id, String fantasy_team_id, int match_num, bool is_locked, String? captain, String? vice_captain, RosterPlayers? players
});


@override $RosterPlayersCopyWith<$Res>? get players;

}
/// @nodoc
class __$FantasyTeamInstanceCopyWithImpl<$Res>
    implements _$FantasyTeamInstanceCopyWith<$Res> {
  __$FantasyTeamInstanceCopyWithImpl(this._self, this._then);

  final _FantasyTeamInstance _self;
  final $Res Function(_FantasyTeamInstance) _then;

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fantasy_team_id = null,Object? match_num = null,Object? is_locked = null,Object? captain = freezed,Object? vice_captain = freezed,Object? players = freezed,}) {
  return _then(_FantasyTeamInstance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fantasy_team_id: null == fantasy_team_id ? _self.fantasy_team_id : fantasy_team_id // ignore: cast_nullable_to_non_nullable
as String,match_num: null == match_num ? _self.match_num : match_num // ignore: cast_nullable_to_non_nullable
as int,is_locked: null == is_locked ? _self.is_locked : is_locked // ignore: cast_nullable_to_non_nullable
as bool,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,vice_captain: freezed == vice_captain ? _self.vice_captain : vice_captain // ignore: cast_nullable_to_non_nullable
as String?,players: freezed == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as RosterPlayers?,
  ));
}

/// Create a copy of FantasyTeamInstance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RosterPlayersCopyWith<$Res>? get players {
    if (_self.players == null) {
    return null;
  }

  return $RosterPlayersCopyWith<$Res>(_self.players!, (value) {
    return _then(_self.copyWith(players: value));
  });
}
}

// dart format on
