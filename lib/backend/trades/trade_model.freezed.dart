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

 String get id; String get name; String get image;
/// Create a copy of TradePlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradePlayerCopyWith<TradePlayer> get copyWith => _$TradePlayerCopyWithImpl<TradePlayer>(this as TradePlayer, _$identity);

  /// Serializes this TradePlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradePlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'TradePlayer(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $TradePlayerCopyWith<$Res>  {
  factory $TradePlayerCopyWith(TradePlayer value, $Res Function(TradePlayer) _then) = _$TradePlayerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
return $default(_that.id,_that.name,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image)  $default,) {final _that = this;
switch (_that) {
case _TradePlayer():
return $default(_that.id,_that.name,_that.image);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image)?  $default,) {final _that = this;
switch (_that) {
case _TradePlayer() when $default != null:
return $default(_that.id,_that.name,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TradePlayer implements TradePlayer {
  const _TradePlayer({required this.id, required this.name, this.image = ''});
  factory _TradePlayer.fromJson(Map<String, dynamic> json) => _$TradePlayerFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String image;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradePlayer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'TradePlayer(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$TradePlayerCopyWith<$Res> implements $TradePlayerCopyWith<$Res> {
  factory _$TradePlayerCopyWith(_TradePlayer value, $Res Function(_TradePlayer) _then) = __$TradePlayerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,}) {
  return _then(_TradePlayer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Trade {

 String get id; String get status;@JsonKey(name: 'proposer_fantasy_team_id') String get proposerTeamId;@JsonKey(name: 'recipient_fantasy_team_id') String get recipientTeamId;@JsonKey(name: 'from_team') String get fromTeam;@JsonKey(name: 'to_team') String get toTeam;@JsonKey(name: 'offered_players') List<TradePlayer> get offeredPlayers;@JsonKey(name: 'requested_players') List<TradePlayer> get requestedPlayers;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'responded_at') String? get respondedAt;
/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeCopyWith<Trade> get copyWith => _$TradeCopyWithImpl<Trade>(this as Trade, _$identity);

  /// Serializes this Trade to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trade&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.proposerTeamId, proposerTeamId) || other.proposerTeamId == proposerTeamId)&&(identical(other.recipientTeamId, recipientTeamId) || other.recipientTeamId == recipientTeamId)&&(identical(other.fromTeam, fromTeam) || other.fromTeam == fromTeam)&&(identical(other.toTeam, toTeam) || other.toTeam == toTeam)&&const DeepCollectionEquality().equals(other.offeredPlayers, offeredPlayers)&&const DeepCollectionEquality().equals(other.requestedPlayers, requestedPlayers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,proposerTeamId,recipientTeamId,fromTeam,toTeam,const DeepCollectionEquality().hash(offeredPlayers),const DeepCollectionEquality().hash(requestedPlayers),createdAt,respondedAt);

@override
String toString() {
  return 'Trade(id: $id, status: $status, proposerTeamId: $proposerTeamId, recipientTeamId: $recipientTeamId, fromTeam: $fromTeam, toTeam: $toTeam, offeredPlayers: $offeredPlayers, requestedPlayers: $requestedPlayers, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $TradeCopyWith<$Res>  {
  factory $TradeCopyWith(Trade value, $Res Function(Trade) _then) = _$TradeCopyWithImpl;
@useResult
$Res call({
 String id, String status,@JsonKey(name: 'proposer_fantasy_team_id') String proposerTeamId,@JsonKey(name: 'recipient_fantasy_team_id') String recipientTeamId,@JsonKey(name: 'from_team') String fromTeam,@JsonKey(name: 'to_team') String toTeam,@JsonKey(name: 'offered_players') List<TradePlayer> offeredPlayers,@JsonKey(name: 'requested_players') List<TradePlayer> requestedPlayers,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'responded_at') String? respondedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? proposerTeamId = null,Object? recipientTeamId = null,Object? fromTeam = null,Object? toTeam = null,Object? offeredPlayers = null,Object? requestedPlayers = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,proposerTeamId: null == proposerTeamId ? _self.proposerTeamId : proposerTeamId // ignore: cast_nullable_to_non_nullable
as String,recipientTeamId: null == recipientTeamId ? _self.recipientTeamId : recipientTeamId // ignore: cast_nullable_to_non_nullable
as String,fromTeam: null == fromTeam ? _self.fromTeam : fromTeam // ignore: cast_nullable_to_non_nullable
as String,toTeam: null == toTeam ? _self.toTeam : toTeam // ignore: cast_nullable_to_non_nullable
as String,offeredPlayers: null == offeredPlayers ? _self.offeredPlayers : offeredPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,requestedPlayers: null == requestedPlayers ? _self.requestedPlayers : requestedPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'proposer_fantasy_team_id')  String proposerTeamId, @JsonKey(name: 'recipient_fantasy_team_id')  String recipientTeamId, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'responded_at')  String? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.status,_that.proposerTeamId,_that.recipientTeamId,_that.fromTeam,_that.toTeam,_that.offeredPlayers,_that.requestedPlayers,_that.createdAt,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'proposer_fantasy_team_id')  String proposerTeamId, @JsonKey(name: 'recipient_fantasy_team_id')  String recipientTeamId, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'responded_at')  String? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _Trade():
return $default(_that.id,_that.status,_that.proposerTeamId,_that.recipientTeamId,_that.fromTeam,_that.toTeam,_that.offeredPlayers,_that.requestedPlayers,_that.createdAt,_that.respondedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status, @JsonKey(name: 'proposer_fantasy_team_id')  String proposerTeamId, @JsonKey(name: 'recipient_fantasy_team_id')  String recipientTeamId, @JsonKey(name: 'from_team')  String fromTeam, @JsonKey(name: 'to_team')  String toTeam, @JsonKey(name: 'offered_players')  List<TradePlayer> offeredPlayers, @JsonKey(name: 'requested_players')  List<TradePlayer> requestedPlayers, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'responded_at')  String? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.status,_that.proposerTeamId,_that.recipientTeamId,_that.fromTeam,_that.toTeam,_that.offeredPlayers,_that.requestedPlayers,_that.createdAt,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trade implements Trade {
  const _Trade({required this.id, required this.status, @JsonKey(name: 'proposer_fantasy_team_id') required this.proposerTeamId, @JsonKey(name: 'recipient_fantasy_team_id') required this.recipientTeamId, @JsonKey(name: 'from_team') required this.fromTeam, @JsonKey(name: 'to_team') required this.toTeam, @JsonKey(name: 'offered_players') final  List<TradePlayer> offeredPlayers = const [], @JsonKey(name: 'requested_players') final  List<TradePlayer> requestedPlayers = const [], @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'responded_at') this.respondedAt}): _offeredPlayers = offeredPlayers,_requestedPlayers = requestedPlayers;
  factory _Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

@override final  String id;
@override final  String status;
@override@JsonKey(name: 'proposer_fantasy_team_id') final  String proposerTeamId;
@override@JsonKey(name: 'recipient_fantasy_team_id') final  String recipientTeamId;
@override@JsonKey(name: 'from_team') final  String fromTeam;
@override@JsonKey(name: 'to_team') final  String toTeam;
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

@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'responded_at') final  String? respondedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trade&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.proposerTeamId, proposerTeamId) || other.proposerTeamId == proposerTeamId)&&(identical(other.recipientTeamId, recipientTeamId) || other.recipientTeamId == recipientTeamId)&&(identical(other.fromTeam, fromTeam) || other.fromTeam == fromTeam)&&(identical(other.toTeam, toTeam) || other.toTeam == toTeam)&&const DeepCollectionEquality().equals(other._offeredPlayers, _offeredPlayers)&&const DeepCollectionEquality().equals(other._requestedPlayers, _requestedPlayers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,proposerTeamId,recipientTeamId,fromTeam,toTeam,const DeepCollectionEquality().hash(_offeredPlayers),const DeepCollectionEquality().hash(_requestedPlayers),createdAt,respondedAt);

@override
String toString() {
  return 'Trade(id: $id, status: $status, proposerTeamId: $proposerTeamId, recipientTeamId: $recipientTeamId, fromTeam: $fromTeam, toTeam: $toTeam, offeredPlayers: $offeredPlayers, requestedPlayers: $requestedPlayers, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$TradeCopyWith<$Res> implements $TradeCopyWith<$Res> {
  factory _$TradeCopyWith(_Trade value, $Res Function(_Trade) _then) = __$TradeCopyWithImpl;
@override @useResult
$Res call({
 String id, String status,@JsonKey(name: 'proposer_fantasy_team_id') String proposerTeamId,@JsonKey(name: 'recipient_fantasy_team_id') String recipientTeamId,@JsonKey(name: 'from_team') String fromTeam,@JsonKey(name: 'to_team') String toTeam,@JsonKey(name: 'offered_players') List<TradePlayer> offeredPlayers,@JsonKey(name: 'requested_players') List<TradePlayer> requestedPlayers,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'responded_at') String? respondedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? proposerTeamId = null,Object? recipientTeamId = null,Object? fromTeam = null,Object? toTeam = null,Object? offeredPlayers = null,Object? requestedPlayers = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_Trade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,proposerTeamId: null == proposerTeamId ? _self.proposerTeamId : proposerTeamId // ignore: cast_nullable_to_non_nullable
as String,recipientTeamId: null == recipientTeamId ? _self.recipientTeamId : recipientTeamId // ignore: cast_nullable_to_non_nullable
as String,fromTeam: null == fromTeam ? _self.fromTeam : fromTeam // ignore: cast_nullable_to_non_nullable
as String,toTeam: null == toTeam ? _self.toTeam : toTeam // ignore: cast_nullable_to_non_nullable
as String,offeredPlayers: null == offeredPlayers ? _self._offeredPlayers : offeredPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,requestedPlayers: null == requestedPlayers ? _self._requestedPlayers : requestedPlayers // ignore: cast_nullable_to_non_nullable
as List<TradePlayer>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
