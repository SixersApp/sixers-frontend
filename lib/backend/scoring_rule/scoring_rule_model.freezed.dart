// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoring_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoringRule {

 String get id;@JsonKey(name: "league_id") String get leagueId; String get stat; String get category; String get mode;@JsonKey(name: "per_unit_points", fromJson: _numToDouble) double get perUnitPoints;@JsonKey(name: "flat_points", fromJson: _numToDouble) double get flatPoints;@JsonKey(name: "threshold", fromJson: _numToDouble) double get threshold; String get band;@JsonKey(name: "multiplier", fromJson: _numToDouble) double get multiplier;@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of ScoringRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoringRuleCopyWith<ScoringRule> get copyWith => _$ScoringRuleCopyWithImpl<ScoringRule>(this as ScoringRule, _$identity);

  /// Serializes this ScoringRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoringRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.stat, stat) || other.stat == stat)&&(identical(other.category, category) || other.category == category)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.perUnitPoints, perUnitPoints) || other.perUnitPoints == perUnitPoints)&&(identical(other.flatPoints, flatPoints) || other.flatPoints == flatPoints)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.band, band) || other.band == band)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,stat,category,mode,perUnitPoints,flatPoints,threshold,band,multiplier,createdAt);

@override
String toString() {
  return 'ScoringRule(id: $id, leagueId: $leagueId, stat: $stat, category: $category, mode: $mode, perUnitPoints: $perUnitPoints, flatPoints: $flatPoints, threshold: $threshold, band: $band, multiplier: $multiplier, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ScoringRuleCopyWith<$Res>  {
  factory $ScoringRuleCopyWith(ScoringRule value, $Res Function(ScoringRule) _then) = _$ScoringRuleCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "league_id") String leagueId, String stat, String category, String mode,@JsonKey(name: "per_unit_points", fromJson: _numToDouble) double perUnitPoints,@JsonKey(name: "flat_points", fromJson: _numToDouble) double flatPoints,@JsonKey(name: "threshold", fromJson: _numToDouble) double threshold, String band,@JsonKey(name: "multiplier", fromJson: _numToDouble) double multiplier,@JsonKey(name: "created_at") DateTime createdAt
});




}
/// @nodoc
class _$ScoringRuleCopyWithImpl<$Res>
    implements $ScoringRuleCopyWith<$Res> {
  _$ScoringRuleCopyWithImpl(this._self, this._then);

  final ScoringRule _self;
  final $Res Function(ScoringRule) _then;

/// Create a copy of ScoringRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? stat = null,Object? category = null,Object? mode = null,Object? perUnitPoints = null,Object? flatPoints = null,Object? threshold = null,Object? band = null,Object? multiplier = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,perUnitPoints: null == perUnitPoints ? _self.perUnitPoints : perUnitPoints // ignore: cast_nullable_to_non_nullable
as double,flatPoints: null == flatPoints ? _self.flatPoints : flatPoints // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,multiplier: null == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoringRule].
extension ScoringRulePatterns on ScoringRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoringRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoringRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoringRule value)  $default,){
final _that = this;
switch (_that) {
case _ScoringRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoringRule value)?  $default,){
final _that = this;
switch (_that) {
case _ScoringRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "league_id")  String leagueId,  String stat,  String category,  String mode, @JsonKey(name: "per_unit_points", fromJson: _numToDouble)  double perUnitPoints, @JsonKey(name: "flat_points", fromJson: _numToDouble)  double flatPoints, @JsonKey(name: "threshold", fromJson: _numToDouble)  double threshold,  String band, @JsonKey(name: "multiplier", fromJson: _numToDouble)  double multiplier, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoringRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "league_id")  String leagueId,  String stat,  String category,  String mode, @JsonKey(name: "per_unit_points", fromJson: _numToDouble)  double perUnitPoints, @JsonKey(name: "flat_points", fromJson: _numToDouble)  double flatPoints, @JsonKey(name: "threshold", fromJson: _numToDouble)  double threshold,  String band, @JsonKey(name: "multiplier", fromJson: _numToDouble)  double multiplier, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ScoringRule():
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "league_id")  String leagueId,  String stat,  String category,  String mode, @JsonKey(name: "per_unit_points", fromJson: _numToDouble)  double perUnitPoints, @JsonKey(name: "flat_points", fromJson: _numToDouble)  double flatPoints, @JsonKey(name: "threshold", fromJson: _numToDouble)  double threshold,  String band, @JsonKey(name: "multiplier", fromJson: _numToDouble)  double multiplier, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ScoringRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoringRule implements ScoringRule {
  const _ScoringRule({required this.id, @JsonKey(name: "league_id") required this.leagueId, required this.stat, required this.category, required this.mode, @JsonKey(name: "per_unit_points", fromJson: _numToDouble) this.perUnitPoints = 0, @JsonKey(name: "flat_points", fromJson: _numToDouble) this.flatPoints = 0, @JsonKey(name: "threshold", fromJson: _numToDouble) this.threshold = 0, this.band = "", @JsonKey(name: "multiplier", fromJson: _numToDouble) this.multiplier = 0, @JsonKey(name: "created_at") required this.createdAt});
  factory _ScoringRule.fromJson(Map<String, dynamic> json) => _$ScoringRuleFromJson(json);

@override final  String id;
@override@JsonKey(name: "league_id") final  String leagueId;
@override final  String stat;
@override final  String category;
@override final  String mode;
@override@JsonKey(name: "per_unit_points", fromJson: _numToDouble) final  double perUnitPoints;
@override@JsonKey(name: "flat_points", fromJson: _numToDouble) final  double flatPoints;
@override@JsonKey(name: "threshold", fromJson: _numToDouble) final  double threshold;
@override@JsonKey() final  String band;
@override@JsonKey(name: "multiplier", fromJson: _numToDouble) final  double multiplier;
@override@JsonKey(name: "created_at") final  DateTime createdAt;

/// Create a copy of ScoringRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoringRuleCopyWith<_ScoringRule> get copyWith => __$ScoringRuleCopyWithImpl<_ScoringRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoringRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoringRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.stat, stat) || other.stat == stat)&&(identical(other.category, category) || other.category == category)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.perUnitPoints, perUnitPoints) || other.perUnitPoints == perUnitPoints)&&(identical(other.flatPoints, flatPoints) || other.flatPoints == flatPoints)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.band, band) || other.band == band)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,stat,category,mode,perUnitPoints,flatPoints,threshold,band,multiplier,createdAt);

@override
String toString() {
  return 'ScoringRule(id: $id, leagueId: $leagueId, stat: $stat, category: $category, mode: $mode, perUnitPoints: $perUnitPoints, flatPoints: $flatPoints, threshold: $threshold, band: $band, multiplier: $multiplier, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ScoringRuleCopyWith<$Res> implements $ScoringRuleCopyWith<$Res> {
  factory _$ScoringRuleCopyWith(_ScoringRule value, $Res Function(_ScoringRule) _then) = __$ScoringRuleCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "league_id") String leagueId, String stat, String category, String mode,@JsonKey(name: "per_unit_points", fromJson: _numToDouble) double perUnitPoints,@JsonKey(name: "flat_points", fromJson: _numToDouble) double flatPoints,@JsonKey(name: "threshold", fromJson: _numToDouble) double threshold, String band,@JsonKey(name: "multiplier", fromJson: _numToDouble) double multiplier,@JsonKey(name: "created_at") DateTime createdAt
});




}
/// @nodoc
class __$ScoringRuleCopyWithImpl<$Res>
    implements _$ScoringRuleCopyWith<$Res> {
  __$ScoringRuleCopyWithImpl(this._self, this._then);

  final _ScoringRule _self;
  final $Res Function(_ScoringRule) _then;

/// Create a copy of ScoringRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? stat = null,Object? category = null,Object? mode = null,Object? perUnitPoints = null,Object? flatPoints = null,Object? threshold = null,Object? band = null,Object? multiplier = null,Object? createdAt = null,}) {
  return _then(_ScoringRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,perUnitPoints: null == perUnitPoints ? _self.perUnitPoints : perUnitPoints // ignore: cast_nullable_to_non_nullable
as double,flatPoints: null == flatPoints ? _self.flatPoints : flatPoints // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,multiplier: null == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
