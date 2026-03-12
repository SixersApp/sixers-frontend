// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_start_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftOrderEntry {

 String get teamId; int get order;
/// Create a copy of DraftOrderEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftOrderEntryCopyWith<DraftOrderEntry> get copyWith => _$DraftOrderEntryCopyWithImpl<DraftOrderEntry>(this as DraftOrderEntry, _$identity);

  /// Serializes this DraftOrderEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftOrderEntry&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,order);

@override
String toString() {
  return 'DraftOrderEntry(teamId: $teamId, order: $order)';
}


}

/// @nodoc
abstract mixin class $DraftOrderEntryCopyWith<$Res>  {
  factory $DraftOrderEntryCopyWith(DraftOrderEntry value, $Res Function(DraftOrderEntry) _then) = _$DraftOrderEntryCopyWithImpl;
@useResult
$Res call({
 String teamId, int order
});




}
/// @nodoc
class _$DraftOrderEntryCopyWithImpl<$Res>
    implements $DraftOrderEntryCopyWith<$Res> {
  _$DraftOrderEntryCopyWithImpl(this._self, this._then);

  final DraftOrderEntry _self;
  final $Res Function(DraftOrderEntry) _then;

/// Create a copy of DraftOrderEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamId = null,Object? order = null,}) {
  return _then(_self.copyWith(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftOrderEntry].
extension DraftOrderEntryPatterns on DraftOrderEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftOrderEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftOrderEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftOrderEntry value)  $default,){
final _that = this;
switch (_that) {
case _DraftOrderEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftOrderEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DraftOrderEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String teamId,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftOrderEntry() when $default != null:
return $default(_that.teamId,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String teamId,  int order)  $default,) {final _that = this;
switch (_that) {
case _DraftOrderEntry():
return $default(_that.teamId,_that.order);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String teamId,  int order)?  $default,) {final _that = this;
switch (_that) {
case _DraftOrderEntry() when $default != null:
return $default(_that.teamId,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftOrderEntry implements DraftOrderEntry {
  const _DraftOrderEntry({required this.teamId, required this.order});
  factory _DraftOrderEntry.fromJson(Map<String, dynamic> json) => _$DraftOrderEntryFromJson(json);

@override final  String teamId;
@override final  int order;

/// Create a copy of DraftOrderEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftOrderEntryCopyWith<_DraftOrderEntry> get copyWith => __$DraftOrderEntryCopyWithImpl<_DraftOrderEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftOrderEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftOrderEntry&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,order);

@override
String toString() {
  return 'DraftOrderEntry(teamId: $teamId, order: $order)';
}


}

/// @nodoc
abstract mixin class _$DraftOrderEntryCopyWith<$Res> implements $DraftOrderEntryCopyWith<$Res> {
  factory _$DraftOrderEntryCopyWith(_DraftOrderEntry value, $Res Function(_DraftOrderEntry) _then) = __$DraftOrderEntryCopyWithImpl;
@override @useResult
$Res call({
 String teamId, int order
});




}
/// @nodoc
class __$DraftOrderEntryCopyWithImpl<$Res>
    implements _$DraftOrderEntryCopyWith<$Res> {
  __$DraftOrderEntryCopyWithImpl(this._self, this._then);

  final _DraftOrderEntry _self;
  final $Res Function(_DraftOrderEntry) _then;

/// Create a copy of DraftOrderEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? order = null,}) {
  return _then(_DraftOrderEntry(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DraftStartResult {

 String get leagueId; String get currentTeamId; int get currentRound; int get currentPick; String get pickExpiresAt; List<DraftOrderEntry> get draftOrder;
/// Create a copy of DraftStartResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStartResultCopyWith<DraftStartResult> get copyWith => _$DraftStartResultCopyWithImpl<DraftStartResult>(this as DraftStartResult, _$identity);

  /// Serializes this DraftStartResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftStartResult&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.currentPick, currentPick) || other.currentPick == currentPick)&&(identical(other.pickExpiresAt, pickExpiresAt) || other.pickExpiresAt == pickExpiresAt)&&const DeepCollectionEquality().equals(other.draftOrder, draftOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,currentTeamId,currentRound,currentPick,pickExpiresAt,const DeepCollectionEquality().hash(draftOrder));

@override
String toString() {
  return 'DraftStartResult(leagueId: $leagueId, currentTeamId: $currentTeamId, currentRound: $currentRound, currentPick: $currentPick, pickExpiresAt: $pickExpiresAt, draftOrder: $draftOrder)';
}


}

/// @nodoc
abstract mixin class $DraftStartResultCopyWith<$Res>  {
  factory $DraftStartResultCopyWith(DraftStartResult value, $Res Function(DraftStartResult) _then) = _$DraftStartResultCopyWithImpl;
@useResult
$Res call({
 String leagueId, String currentTeamId, int currentRound, int currentPick, String pickExpiresAt, List<DraftOrderEntry> draftOrder
});




}
/// @nodoc
class _$DraftStartResultCopyWithImpl<$Res>
    implements $DraftStartResultCopyWith<$Res> {
  _$DraftStartResultCopyWithImpl(this._self, this._then);

  final DraftStartResult _self;
  final $Res Function(DraftStartResult) _then;

/// Create a copy of DraftStartResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? currentTeamId = null,Object? currentRound = null,Object? currentPick = null,Object? pickExpiresAt = null,Object? draftOrder = null,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,currentPick: null == currentPick ? _self.currentPick : currentPick // ignore: cast_nullable_to_non_nullable
as int,pickExpiresAt: null == pickExpiresAt ? _self.pickExpiresAt : pickExpiresAt // ignore: cast_nullable_to_non_nullable
as String,draftOrder: null == draftOrder ? _self.draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as List<DraftOrderEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftStartResult].
extension DraftStartResultPatterns on DraftStartResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftStartResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftStartResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftStartResult value)  $default,){
final _that = this;
switch (_that) {
case _DraftStartResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftStartResult value)?  $default,){
final _that = this;
switch (_that) {
case _DraftStartResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  List<DraftOrderEntry> draftOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftStartResult() when $default != null:
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.draftOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  List<DraftOrderEntry> draftOrder)  $default,) {final _that = this;
switch (_that) {
case _DraftStartResult():
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.draftOrder);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leagueId,  String currentTeamId,  int currentRound,  int currentPick,  String pickExpiresAt,  List<DraftOrderEntry> draftOrder)?  $default,) {final _that = this;
switch (_that) {
case _DraftStartResult() when $default != null:
return $default(_that.leagueId,_that.currentTeamId,_that.currentRound,_that.currentPick,_that.pickExpiresAt,_that.draftOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftStartResult implements DraftStartResult {
  const _DraftStartResult({required this.leagueId, required this.currentTeamId, required this.currentRound, required this.currentPick, required this.pickExpiresAt, required final  List<DraftOrderEntry> draftOrder}): _draftOrder = draftOrder;
  factory _DraftStartResult.fromJson(Map<String, dynamic> json) => _$DraftStartResultFromJson(json);

@override final  String leagueId;
@override final  String currentTeamId;
@override final  int currentRound;
@override final  int currentPick;
@override final  String pickExpiresAt;
 final  List<DraftOrderEntry> _draftOrder;
@override List<DraftOrderEntry> get draftOrder {
  if (_draftOrder is EqualUnmodifiableListView) return _draftOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_draftOrder);
}


/// Create a copy of DraftStartResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftStartResultCopyWith<_DraftStartResult> get copyWith => __$DraftStartResultCopyWithImpl<_DraftStartResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftStartResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftStartResult&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.currentTeamId, currentTeamId) || other.currentTeamId == currentTeamId)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.currentPick, currentPick) || other.currentPick == currentPick)&&(identical(other.pickExpiresAt, pickExpiresAt) || other.pickExpiresAt == pickExpiresAt)&&const DeepCollectionEquality().equals(other._draftOrder, _draftOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,currentTeamId,currentRound,currentPick,pickExpiresAt,const DeepCollectionEquality().hash(_draftOrder));

@override
String toString() {
  return 'DraftStartResult(leagueId: $leagueId, currentTeamId: $currentTeamId, currentRound: $currentRound, currentPick: $currentPick, pickExpiresAt: $pickExpiresAt, draftOrder: $draftOrder)';
}


}

/// @nodoc
abstract mixin class _$DraftStartResultCopyWith<$Res> implements $DraftStartResultCopyWith<$Res> {
  factory _$DraftStartResultCopyWith(_DraftStartResult value, $Res Function(_DraftStartResult) _then) = __$DraftStartResultCopyWithImpl;
@override @useResult
$Res call({
 String leagueId, String currentTeamId, int currentRound, int currentPick, String pickExpiresAt, List<DraftOrderEntry> draftOrder
});




}
/// @nodoc
class __$DraftStartResultCopyWithImpl<$Res>
    implements _$DraftStartResultCopyWith<$Res> {
  __$DraftStartResultCopyWithImpl(this._self, this._then);

  final _DraftStartResult _self;
  final $Res Function(_DraftStartResult) _then;

/// Create a copy of DraftStartResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? currentTeamId = null,Object? currentRound = null,Object? currentPick = null,Object? pickExpiresAt = null,Object? draftOrder = null,}) {
  return _then(_DraftStartResult(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,currentTeamId: null == currentTeamId ? _self.currentTeamId : currentTeamId // ignore: cast_nullable_to_non_nullable
as String,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,currentPick: null == currentPick ? _self.currentPick : currentPick // ignore: cast_nullable_to_non_nullable
as int,pickExpiresAt: null == pickExpiresAt ? _self.pickExpiresAt : pickExpiresAt // ignore: cast_nullable_to_non_nullable
as String,draftOrder: null == draftOrder ? _self._draftOrder : draftOrder // ignore: cast_nullable_to_non_nullable
as List<DraftOrderEntry>,
  ));
}


}

// dart format on
