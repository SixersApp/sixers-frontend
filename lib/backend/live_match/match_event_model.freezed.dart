// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PerformanceDelta {

@JsonKey(name: 'player_id') String get playerId; Map<String, int> get changes;@JsonKey(name: 'not_out') bool? get notOut;
/// Create a copy of PerformanceDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerformanceDeltaCopyWith<PerformanceDelta> get copyWith => _$PerformanceDeltaCopyWithImpl<PerformanceDelta>(this as PerformanceDelta, _$identity);

  /// Serializes this PerformanceDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerformanceDelta&&(identical(other.playerId, playerId) || other.playerId == playerId)&&const DeepCollectionEquality().equals(other.changes, changes)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,const DeepCollectionEquality().hash(changes),notOut);

@override
String toString() {
  return 'PerformanceDelta(playerId: $playerId, changes: $changes, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class $PerformanceDeltaCopyWith<$Res>  {
  factory $PerformanceDeltaCopyWith(PerformanceDelta value, $Res Function(PerformanceDelta) _then) = _$PerformanceDeltaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, Map<String, int> changes,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class _$PerformanceDeltaCopyWithImpl<$Res>
    implements $PerformanceDeltaCopyWith<$Res> {
  _$PerformanceDeltaCopyWithImpl(this._self, this._then);

  final PerformanceDelta _self;
  final $Res Function(PerformanceDelta) _then;

/// Create a copy of PerformanceDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? changes = null,Object? notOut = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,changes: null == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,notOut: freezed == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PerformanceDelta].
extension PerformanceDeltaPatterns on PerformanceDelta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerformanceDelta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerformanceDelta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerformanceDelta value)  $default,){
final _that = this;
switch (_that) {
case _PerformanceDelta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerformanceDelta value)?  $default,){
final _that = this;
switch (_that) {
case _PerformanceDelta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  Map<String, int> changes, @JsonKey(name: 'not_out')  bool? notOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerformanceDelta() when $default != null:
return $default(_that.playerId,_that.changes,_that.notOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  Map<String, int> changes, @JsonKey(name: 'not_out')  bool? notOut)  $default,) {final _that = this;
switch (_that) {
case _PerformanceDelta():
return $default(_that.playerId,_that.changes,_that.notOut);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_id')  String playerId,  Map<String, int> changes, @JsonKey(name: 'not_out')  bool? notOut)?  $default,) {final _that = this;
switch (_that) {
case _PerformanceDelta() when $default != null:
return $default(_that.playerId,_that.changes,_that.notOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerformanceDelta implements PerformanceDelta {
  const _PerformanceDelta({@JsonKey(name: 'player_id') required this.playerId, required final  Map<String, int> changes, @JsonKey(name: 'not_out') this.notOut}): _changes = changes;
  factory _PerformanceDelta.fromJson(Map<String, dynamic> json) => _$PerformanceDeltaFromJson(json);

@override@JsonKey(name: 'player_id') final  String playerId;
 final  Map<String, int> _changes;
@override Map<String, int> get changes {
  if (_changes is EqualUnmodifiableMapView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_changes);
}

@override@JsonKey(name: 'not_out') final  bool? notOut;

/// Create a copy of PerformanceDelta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerformanceDeltaCopyWith<_PerformanceDelta> get copyWith => __$PerformanceDeltaCopyWithImpl<_PerformanceDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerformanceDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerformanceDelta&&(identical(other.playerId, playerId) || other.playerId == playerId)&&const DeepCollectionEquality().equals(other._changes, _changes)&&(identical(other.notOut, notOut) || other.notOut == notOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,const DeepCollectionEquality().hash(_changes),notOut);

@override
String toString() {
  return 'PerformanceDelta(playerId: $playerId, changes: $changes, notOut: $notOut)';
}


}

/// @nodoc
abstract mixin class _$PerformanceDeltaCopyWith<$Res> implements $PerformanceDeltaCopyWith<$Res> {
  factory _$PerformanceDeltaCopyWith(_PerformanceDelta value, $Res Function(_PerformanceDelta) _then) = __$PerformanceDeltaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, Map<String, int> changes,@JsonKey(name: 'not_out') bool? notOut
});




}
/// @nodoc
class __$PerformanceDeltaCopyWithImpl<$Res>
    implements _$PerformanceDeltaCopyWith<$Res> {
  __$PerformanceDeltaCopyWithImpl(this._self, this._then);

  final _PerformanceDelta _self;
  final $Res Function(_PerformanceDelta) _then;

/// Create a copy of PerformanceDelta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? changes = null,Object? notOut = freezed,}) {
  return _then(_PerformanceDelta(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,changes: null == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,notOut: freezed == notOut ? _self.notOut : notOut // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$MatchEvent {

 String get type; String get matchId; int get eventNum; Map<String, dynamic>? get matchConfig; Map<String, dynamic>? get matchInfoDeltas; List<PerformanceDelta>? get performanceDeltas; Map<String, dynamic>? get data;
/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchEventCopyWith<MatchEvent> get copyWith => _$MatchEventCopyWithImpl<MatchEvent>(this as MatchEvent, _$identity);

  /// Serializes this MatchEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.eventNum, eventNum) || other.eventNum == eventNum)&&const DeepCollectionEquality().equals(other.matchConfig, matchConfig)&&const DeepCollectionEquality().equals(other.matchInfoDeltas, matchInfoDeltas)&&const DeepCollectionEquality().equals(other.performanceDeltas, performanceDeltas)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,matchId,eventNum,const DeepCollectionEquality().hash(matchConfig),const DeepCollectionEquality().hash(matchInfoDeltas),const DeepCollectionEquality().hash(performanceDeltas),const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MatchEvent(type: $type, matchId: $matchId, eventNum: $eventNum, matchConfig: $matchConfig, matchInfoDeltas: $matchInfoDeltas, performanceDeltas: $performanceDeltas, data: $data)';
}


}

/// @nodoc
abstract mixin class $MatchEventCopyWith<$Res>  {
  factory $MatchEventCopyWith(MatchEvent value, $Res Function(MatchEvent) _then) = _$MatchEventCopyWithImpl;
@useResult
$Res call({
 String type, String matchId, int eventNum, Map<String, dynamic>? matchConfig, Map<String, dynamic>? matchInfoDeltas, List<PerformanceDelta>? performanceDeltas, Map<String, dynamic>? data
});




}
/// @nodoc
class _$MatchEventCopyWithImpl<$Res>
    implements $MatchEventCopyWith<$Res> {
  _$MatchEventCopyWithImpl(this._self, this._then);

  final MatchEvent _self;
  final $Res Function(MatchEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? matchId = null,Object? eventNum = null,Object? matchConfig = freezed,Object? matchInfoDeltas = freezed,Object? performanceDeltas = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,eventNum: null == eventNum ? _self.eventNum : eventNum // ignore: cast_nullable_to_non_nullable
as int,matchConfig: freezed == matchConfig ? _self.matchConfig : matchConfig // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,matchInfoDeltas: freezed == matchInfoDeltas ? _self.matchInfoDeltas : matchInfoDeltas // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,performanceDeltas: freezed == performanceDeltas ? _self.performanceDeltas : performanceDeltas // ignore: cast_nullable_to_non_nullable
as List<PerformanceDelta>?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchEvent].
extension MatchEventPatterns on MatchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchEvent value)  $default,){
final _that = this;
switch (_that) {
case _MatchEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchEvent value)?  $default,){
final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String matchId,  int eventNum,  Map<String, dynamic>? matchConfig,  Map<String, dynamic>? matchInfoDeltas,  List<PerformanceDelta>? performanceDeltas,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
return $default(_that.type,_that.matchId,_that.eventNum,_that.matchConfig,_that.matchInfoDeltas,_that.performanceDeltas,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String matchId,  int eventNum,  Map<String, dynamic>? matchConfig,  Map<String, dynamic>? matchInfoDeltas,  List<PerformanceDelta>? performanceDeltas,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _MatchEvent():
return $default(_that.type,_that.matchId,_that.eventNum,_that.matchConfig,_that.matchInfoDeltas,_that.performanceDeltas,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String matchId,  int eventNum,  Map<String, dynamic>? matchConfig,  Map<String, dynamic>? matchInfoDeltas,  List<PerformanceDelta>? performanceDeltas,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
return $default(_that.type,_that.matchId,_that.eventNum,_that.matchConfig,_that.matchInfoDeltas,_that.performanceDeltas,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchEvent implements MatchEvent {
  const _MatchEvent({required this.type, required this.matchId, required this.eventNum, final  Map<String, dynamic>? matchConfig, final  Map<String, dynamic>? matchInfoDeltas, final  List<PerformanceDelta>? performanceDeltas, final  Map<String, dynamic>? data}): _matchConfig = matchConfig,_matchInfoDeltas = matchInfoDeltas,_performanceDeltas = performanceDeltas,_data = data;
  factory _MatchEvent.fromJson(Map<String, dynamic> json) => _$MatchEventFromJson(json);

@override final  String type;
@override final  String matchId;
@override final  int eventNum;
 final  Map<String, dynamic>? _matchConfig;
@override Map<String, dynamic>? get matchConfig {
  final value = _matchConfig;
  if (value == null) return null;
  if (_matchConfig is EqualUnmodifiableMapView) return _matchConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _matchInfoDeltas;
@override Map<String, dynamic>? get matchInfoDeltas {
  final value = _matchInfoDeltas;
  if (value == null) return null;
  if (_matchInfoDeltas is EqualUnmodifiableMapView) return _matchInfoDeltas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<PerformanceDelta>? _performanceDeltas;
@override List<PerformanceDelta>? get performanceDeltas {
  final value = _performanceDeltas;
  if (value == null) return null;
  if (_performanceDeltas is EqualUnmodifiableListView) return _performanceDeltas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchEventCopyWith<_MatchEvent> get copyWith => __$MatchEventCopyWithImpl<_MatchEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.eventNum, eventNum) || other.eventNum == eventNum)&&const DeepCollectionEquality().equals(other._matchConfig, _matchConfig)&&const DeepCollectionEquality().equals(other._matchInfoDeltas, _matchInfoDeltas)&&const DeepCollectionEquality().equals(other._performanceDeltas, _performanceDeltas)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,matchId,eventNum,const DeepCollectionEquality().hash(_matchConfig),const DeepCollectionEquality().hash(_matchInfoDeltas),const DeepCollectionEquality().hash(_performanceDeltas),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MatchEvent(type: $type, matchId: $matchId, eventNum: $eventNum, matchConfig: $matchConfig, matchInfoDeltas: $matchInfoDeltas, performanceDeltas: $performanceDeltas, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MatchEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory _$MatchEventCopyWith(_MatchEvent value, $Res Function(_MatchEvent) _then) = __$MatchEventCopyWithImpl;
@override @useResult
$Res call({
 String type, String matchId, int eventNum, Map<String, dynamic>? matchConfig, Map<String, dynamic>? matchInfoDeltas, List<PerformanceDelta>? performanceDeltas, Map<String, dynamic>? data
});




}
/// @nodoc
class __$MatchEventCopyWithImpl<$Res>
    implements _$MatchEventCopyWith<$Res> {
  __$MatchEventCopyWithImpl(this._self, this._then);

  final _MatchEvent _self;
  final $Res Function(_MatchEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? matchId = null,Object? eventNum = null,Object? matchConfig = freezed,Object? matchInfoDeltas = freezed,Object? performanceDeltas = freezed,Object? data = freezed,}) {
  return _then(_MatchEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,eventNum: null == eventNum ? _self.eventNum : eventNum // ignore: cast_nullable_to_non_nullable
as int,matchConfig: freezed == matchConfig ? _self._matchConfig : matchConfig // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,matchInfoDeltas: freezed == matchInfoDeltas ? _self._matchInfoDeltas : matchInfoDeltas // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,performanceDeltas: freezed == performanceDeltas ? _self._performanceDeltas : performanceDeltas // ignore: cast_nullable_to_non_nullable
as List<PerformanceDelta>?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
