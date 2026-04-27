// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TradePlayer {

 String get id; String get name;
/// Create a copy of TradePlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradePlayerCopyWith<TradePlayer> get copyWith => _$TradePlayerCopyWithImpl<TradePlayer>(this as TradePlayer, _$identity);

  /// Serializes this TradePlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradePlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TradePlayer(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TradePlayerCopyWith<$Res>  {
  factory $TradePlayerCopyWith(TradePlayer value, $Res Function(TradePlayer) _then) = _$TradePlayerCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$TradePlayerCopyWithImpl<$Res>
    implements $TradePlayerCopyWith<$Res> {
  _$TradePlayerCopyWithImpl(this._self, this._then);

  final TradePlayer _self;
  final $Res Function(TradePlayer) _then;

/// Create a copy of TradePlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TradePlayer].
extension TradePlayerPatterns on TradePlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TradePlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TradePlayer value)  $default,){
final _that = this;
switch (_that) {
case _TradePlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TradePlayer value)?  $default,){
final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TradePlayer():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TradePlayer implements TradePlayer {
  const _TradePlayer({required this.id, required this.name});
  factory _TradePlayer.fromJson(Map<String, dynamic> json) => _$TradePlayerFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of TradePlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradePlayerCopyWith<_TradePlayer> get copyWith => __$TradePlayerCopyWithImpl<_TradePlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradePlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradePlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TradePlayer(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TradePlayerCopyWith<$Res> implements $TradePlayerCopyWith<$Res> {
  factory _$TradePlayerCopyWith(_TradePlayer value, $Res Function(_TradePlayer) _then) = __$TradePlayerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$TradePlayerCopyWithImpl<$Res>
    implements _$TradePlayerCopyWith<$Res> {
  __$TradePlayerCopyWithImpl(this._self, this._then);

  final _TradePlayer _self;
  final $Res Function(_TradePlayer) _then;

/// Create a copy of TradePlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TradePlayer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Trade {

 String get id; String get status;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'expires_at') String? get expiresAt;@JsonKey(name: 'responded_at') String? get respondedAt;@JsonKey(name: 'from_team') String get fromTeam;@JsonKey(name: 'to_team') String get toTeam;@JsonKey(name: 'proposer_name') String? get proposerName;@JsonKey(name: 'recipient_name') String? get recipientName;@JsonKey(name: 'offered_players') List<TradePlayer> get offeredPlayers;@JsonKey(name: 'requested_players') List<TradePlayer> get requestedPlayers;
/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeCopyWith<Trade> get copyWith => _$TradeCopyWithImpl<Trade>(this as Trade, _$identity);

  /// Serializes this Trade to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trade&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.fromTeam, fromTeam) || other.fromTeam == fromTeam)&&(identical(other.toTeam, toTeam) || other.toTeam == toTeam)&&(identical(other.proposerName, proposerName) || other.proposerName == proposerName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&const DeepCollectionEquality().equals(other.offeredPlayers, offeredPlayers)&&const DeepCollectionEquality().equals(other.requestedPlayers, requestedPlayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,expiresAt,respondedAt,fromTeam,toTeam,proposerName,recipientName,const DeepCollectionEquality().hash(offeredPlayers),const DeepCollectionEquality().hash(requestedPlayers));

@override
String toString() {
  return 'Trade(id: $id, status: $status, createdAt: $createdAt, expiresAt: $expiresAt, respondedAt: $respondedAt, fromTeam: $fromTeam, toTeam: $toTeam, proposerName: $proposerName, recipientName: $recipientName, offeredPlayers: $offeredPlayers, requestedPlayers: $requestedPlayers)';
}


}

/// @nodoc
abstract mixin class $TradeCopyWith<$Res>  {
  factory $TradeCopyWith(Trade value, $Res Function(Trade) _then) = _$TradeCopyWithImpl;
@useResult
$Res call({
 String id, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'responded_at') String? respondedAt,@JsonKey(name: 'from_team') String fromTeam,@JsonKey(name: 'to_team') String toTeam,@JsonKey(name: 'proposer_name') String? proposerName,@JsonKey(name: 'recipient_name') String? recipientName,@JsonKey(name: 'offered_players') List<TradePlayer> offeredPlayers,@JsonKey(name: 'requested_players') List<TradePlayer> requestedPlayers
});




}
/// @nodoc
class _$TradeCopyWithImpl<$Res>
    implements $TradeCopyWith<$Res> {
  _$TradeCopyWithImpl(this._self, this._then);

  final Trade _self;
  final $Res Function(Trade) _then;

/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? expiresAt = freezed,Object? respondedAt = freezed,Object? fromTeam = null,Object? toTeam = null,Object? proposerName = freezed,Object? recipientName = freezed,Object? offeredPlayers = null,Object? requestedPlayers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as String?,fromTeam: null == fromTeam ? _self.fromTeam : fromTeam // ignore: cast_nullable_to_non_nullable
as String,toTeam: null == toTeam ? _self.toTeam : toTeam // ignore: cast_nullable_to_non_nullable
as String,proposerName: freezed == proposerName ? _self.proposerName : proposerName // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,offeredPlayers: null == offeredPlayers ? _self.offeredPlayers : offeredPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,requestedPlayers: null == requestedPlayers ? _self.requestedPlayers : requestedPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,
  ));
}

}


/// Adds pattern-matching-related methods to [Trade].
extension TradePatterns on Trade {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trade value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trade() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trade value)  $default,){
final _that = this;
switch (_that) {
case _Trade():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trade value)?  $default,){
final _that = this;
switch (_that) {
case _Trade() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'responded_at')  String? respondedAt, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'proposer_name')  String? proposerName, @JsonKey(name: 'recipient_name')  String? recipientName, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.expiresAt,_that.respondedAt,_that.fromTeam,_that.toTeam,_that.proposerName,_that.recipientName,_that.offeredPlayers,_that.requestedPlayers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'responded_at')  String? respondedAt, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'proposer_name')  String? proposerName, @JsonKey(name: 'recipient_name')  String? recipientName, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers)  $default,) {final _that = this;
switch (_that) {
case _Trade():
return $default(_that.id,_that.status,_that.createdAt,_that.expiresAt,_that.respondedAt,_that.fromTeam,_that.toTeam,_that.proposerName,_that.recipientName,_that.offeredPlayers,_that.requestedPlayers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'responded_at')  String? respondedAt, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'proposer_name')  String? proposerName, @JsonKey(name: 'recipient_name')  String? recipientName, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers)?  $default,) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.expiresAt,_that.respondedAt,_that.fromTeam,_that.toTeam,_that.proposerName,_that.recipientName,_that.offeredPlayers,_that.requestedPlayers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trade implements Trade {
  const _Trade({required this.id, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'responded_at') this.respondedAt, @JsonKey(name: 'from_team') required this.fromTeam, @JsonKey(name: 'to_team') required this.toTeam, @JsonKey(name: 'proposer_name') this.proposerName, @JsonKey(name: 'recipient_name') this.recipientName, @JsonKey(name: 'offered_players') final  List<TradePlayer> offeredPlayers = const [], @JsonKey(name: 'requested_players') final  List<TradePlayer> requestedPlayers = const []}): _offeredPlayers = offeredPlayers,_requestedPlayers = requestedPlayers;
  factory _Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

@override final  String id;
@override final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
@override@JsonKey(name: 'responded_at') final  String? respondedAt;
@override@JsonKey(name: 'from_team') final  String fromTeam;
@override@JsonKey(name: 'to_team') final  String toTeam;
@override@JsonKey(name: 'proposer_name') final  String? proposerName;
@override@JsonKey(name: 'recipient_name') final  String? recipientName;
 final  List<TradePlayer> _offeredPlayers;
@override@JsonKey(name: 'offered_players') List<TradePlayer> get offeredPlayers {
  if (_offeredPlayers is EqualUnmodifiableListView) return _offeredPlayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offeredPlayers);
}

 final  List<TradePlayer> _requestedPlayers;
@override@JsonKey(name: 'requested_players') List<TradePlayer> get requestedPlayers {
  if (_requestedPlayers is EqualUnmodifiableListView) return _requestedPlayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestedPlayers);
}


/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeCopyWith<_Trade> get copyWith => __$TradeCopyWithImpl<_Trade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trade&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.fromTeam, fromTeam) || other.fromTeam == fromTeam)&&(identical(other.toTeam, toTeam) || other.toTeam == toTeam)&&(identical(other.proposerName, proposerName) || other.proposerName == proposerName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&const DeepCollectionEquality().equals(other._offeredPlayers, _offeredPlayers)&&const DeepCollectionEquality().equals(other._requestedPlayers, _requestedPlayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,expiresAt,respondedAt,fromTeam,toTeam,proposerName,recipientName,const DeepCollectionEquality().hash(_offeredPlayers),const DeepCollectionEquality().hash(_requestedPlayers));

@override
String toString() {
  return 'Trade(id: $id, status: $status, createdAt: $createdAt, expiresAt: $expiresAt, respondedAt: $respondedAt, fromTeam: $fromTeam, toTeam: $toTeam, proposerName: $proposerName, recipientName: $recipientName, offeredPlayers: $offeredPlayers, requestedPlayers: $requestedPlayers)';
}


}

/// @nodoc
abstract mixin class _$TradeCopyWith<$Res> implements $TradeCopyWith<$Res> {
  factory _$TradeCopyWith(_Trade value, $Res Function(_Trade) _then) = __$TradeCopyWithImpl;
@override @useResult
$Res call({
 String id, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'responded_at') String? respondedAt,@JsonKey(name: 'from_team') String fromTeam,@JsonKey(name: 'to_team') String toTeam,@JsonKey(name: 'proposer_name') String? proposerName,@JsonKey(name: 'recipient_name') String? recipientName,@JsonKey(name: 'offered_players') List<TradePlayer> offeredPlayers,@JsonKey(name: 'requested_players') List<TradePlayer> requestedPlayers
});




}
/// @nodoc
class __$TradeCopyWithImpl<$Res>
    implements _$TradeCopyWith<$Res> {
  __$TradeCopyWithImpl(this._self, this._then);

  final _Trade _self;
  final $Res Function(_Trade) _then;

/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? expiresAt = freezed,Object? respondedAt = freezed,Object? fromTeam = null,Object? toTeam = null,Object? proposerName = freezed,Object? recipientName = freezed,Object? offeredPlayers = null,Object? requestedPlayers = null,}) {
  return _then(_Trade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as String?,fromTeam: null == fromTeam ? _self.fromTeam : fromTeam // ignore: cast_nullable_to_non_nullable
as String,toTeam: null == toTeam ? _self.toTeam : toTeam // ignore: cast_nullable_to_non_nullable
as String,proposerName: freezed == proposerName ? _self.proposerName : proposerName // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,offeredPlayers: null == offeredPlayers ? _self._offeredPlayers : offeredPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,requestedPlayers: null == requestedPlayers ? _self._requestedPlayers : requestedPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,
  ));
}


}

// dart format on
