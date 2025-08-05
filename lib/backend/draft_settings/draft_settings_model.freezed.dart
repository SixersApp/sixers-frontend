// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftSettings {

@JsonKey(name: 'league_id') String get leagueId;@JsonKey(name: 'time_per_pick') int get timePerPick;@JsonKey(name: 'auto_pick_enabled') bool get autoPickEnabled;@JsonKey(name: 'pick_warning_seconds') int? get pickWarningSeconds;@JsonKey(name: 'snake_draft') bool? get snakeDraft;
/// Create a copy of DraftSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftSettingsCopyWith<DraftSettings> get copyWith => _$DraftSettingsCopyWithImpl<DraftSettings>(this as DraftSettings, _$identity);

  /// Serializes this DraftSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftSettings&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.timePerPick, timePerPick) || other.timePerPick == timePerPick)&&(identical(other.autoPickEnabled, autoPickEnabled) || other.autoPickEnabled == autoPickEnabled)&&(identical(other.pickWarningSeconds, pickWarningSeconds) || other.pickWarningSeconds == pickWarningSeconds)&&(identical(other.snakeDraft, snakeDraft) || other.snakeDraft == snakeDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,timePerPick,autoPickEnabled,pickWarningSeconds,snakeDraft);

@override
String toString() {
  return 'DraftSettings(leagueId: $leagueId, timePerPick: $timePerPick, autoPickEnabled: $autoPickEnabled, pickWarningSeconds: $pickWarningSeconds, snakeDraft: $snakeDraft)';
}


}

/// @nodoc
abstract mixin class $DraftSettingsCopyWith<$Res>  {
  factory $DraftSettingsCopyWith(DraftSettings value, $Res Function(DraftSettings) _then) = _$DraftSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'time_per_pick') int timePerPick,@JsonKey(name: 'auto_pick_enabled') bool autoPickEnabled,@JsonKey(name: 'pick_warning_seconds') int? pickWarningSeconds,@JsonKey(name: 'snake_draft') bool? snakeDraft
});




}
/// @nodoc
class _$DraftSettingsCopyWithImpl<$Res>
    implements $DraftSettingsCopyWith<$Res> {
  _$DraftSettingsCopyWithImpl(this._self, this._then);

  final DraftSettings _self;
  final $Res Function(DraftSettings) _then;

/// Create a copy of DraftSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leagueId = null,Object? timePerPick = null,Object? autoPickEnabled = null,Object? pickWarningSeconds = freezed,Object? snakeDraft = freezed,}) {
  return _then(_self.copyWith(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,timePerPick: null == timePerPick ? _self.timePerPick : timePerPick // ignore: cast_nullable_to_non_nullable
as int,autoPickEnabled: null == autoPickEnabled ? _self.autoPickEnabled : autoPickEnabled // ignore: cast_nullable_to_non_nullable
as bool,pickWarningSeconds: freezed == pickWarningSeconds ? _self.pickWarningSeconds : pickWarningSeconds // ignore: cast_nullable_to_non_nullable
as int?,snakeDraft: freezed == snakeDraft ? _self.snakeDraft : snakeDraft // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftSettings].
extension DraftSettingsPatterns on DraftSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftSettings value)  $default,){
final _that = this;
switch (_that) {
case _DraftSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftSettings value)?  $default,){
final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'time_per_pick')  int timePerPick, @JsonKey(name: 'auto_pick_enabled')  bool autoPickEnabled, @JsonKey(name: 'pick_warning_seconds')  int? pickWarningSeconds, @JsonKey(name: 'snake_draft')  bool? snakeDraft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
return $default(_that.leagueId,_that.timePerPick,_that.autoPickEnabled,_that.pickWarningSeconds,_that.snakeDraft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'time_per_pick')  int timePerPick, @JsonKey(name: 'auto_pick_enabled')  bool autoPickEnabled, @JsonKey(name: 'pick_warning_seconds')  int? pickWarningSeconds, @JsonKey(name: 'snake_draft')  bool? snakeDraft)  $default,) {final _that = this;
switch (_that) {
case _DraftSettings():
return $default(_that.leagueId,_that.timePerPick,_that.autoPickEnabled,_that.pickWarningSeconds,_that.snakeDraft);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'league_id')  String leagueId, @JsonKey(name: 'time_per_pick')  int timePerPick, @JsonKey(name: 'auto_pick_enabled')  bool autoPickEnabled, @JsonKey(name: 'pick_warning_seconds')  int? pickWarningSeconds, @JsonKey(name: 'snake_draft')  bool? snakeDraft)?  $default,) {final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
return $default(_that.leagueId,_that.timePerPick,_that.autoPickEnabled,_that.pickWarningSeconds,_that.snakeDraft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftSettings implements DraftSettings {
  const _DraftSettings({@JsonKey(name: 'league_id') required this.leagueId, @JsonKey(name: 'time_per_pick') required this.timePerPick, @JsonKey(name: 'auto_pick_enabled') required this.autoPickEnabled, @JsonKey(name: 'pick_warning_seconds') this.pickWarningSeconds, @JsonKey(name: 'snake_draft') this.snakeDraft});
  factory _DraftSettings.fromJson(Map<String, dynamic> json) => _$DraftSettingsFromJson(json);

@override@JsonKey(name: 'league_id') final  String leagueId;
@override@JsonKey(name: 'time_per_pick') final  int timePerPick;
@override@JsonKey(name: 'auto_pick_enabled') final  bool autoPickEnabled;
@override@JsonKey(name: 'pick_warning_seconds') final  int? pickWarningSeconds;
@override@JsonKey(name: 'snake_draft') final  bool? snakeDraft;

/// Create a copy of DraftSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftSettingsCopyWith<_DraftSettings> get copyWith => __$DraftSettingsCopyWithImpl<_DraftSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftSettings&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.timePerPick, timePerPick) || other.timePerPick == timePerPick)&&(identical(other.autoPickEnabled, autoPickEnabled) || other.autoPickEnabled == autoPickEnabled)&&(identical(other.pickWarningSeconds, pickWarningSeconds) || other.pickWarningSeconds == pickWarningSeconds)&&(identical(other.snakeDraft, snakeDraft) || other.snakeDraft == snakeDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leagueId,timePerPick,autoPickEnabled,pickWarningSeconds,snakeDraft);

@override
String toString() {
  return 'DraftSettings(leagueId: $leagueId, timePerPick: $timePerPick, autoPickEnabled: $autoPickEnabled, pickWarningSeconds: $pickWarningSeconds, snakeDraft: $snakeDraft)';
}


}

/// @nodoc
abstract mixin class _$DraftSettingsCopyWith<$Res> implements $DraftSettingsCopyWith<$Res> {
  factory _$DraftSettingsCopyWith(_DraftSettings value, $Res Function(_DraftSettings) _then) = __$DraftSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'league_id') String leagueId,@JsonKey(name: 'time_per_pick') int timePerPick,@JsonKey(name: 'auto_pick_enabled') bool autoPickEnabled,@JsonKey(name: 'pick_warning_seconds') int? pickWarningSeconds,@JsonKey(name: 'snake_draft') bool? snakeDraft
});




}
/// @nodoc
class __$DraftSettingsCopyWithImpl<$Res>
    implements _$DraftSettingsCopyWith<$Res> {
  __$DraftSettingsCopyWithImpl(this._self, this._then);

  final _DraftSettings _self;
  final $Res Function(_DraftSettings) _then;

/// Create a copy of DraftSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leagueId = null,Object? timePerPick = null,Object? autoPickEnabled = null,Object? pickWarningSeconds = freezed,Object? snakeDraft = freezed,}) {
  return _then(_DraftSettings(
leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,timePerPick: null == timePerPick ? _self.timePerPick : timePerPick // ignore: cast_nullable_to_non_nullable
as int,autoPickEnabled: null == autoPickEnabled ? _self.autoPickEnabled : autoPickEnabled // ignore: cast_nullable_to_non_nullable
as bool,pickWarningSeconds: freezed == pickWarningSeconds ? _self.pickWarningSeconds : pickWarningSeconds // ignore: cast_nullable_to_non_nullable
as int?,snakeDraft: freezed == snakeDraft ? _self.snakeDraft : snakeDraft // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
