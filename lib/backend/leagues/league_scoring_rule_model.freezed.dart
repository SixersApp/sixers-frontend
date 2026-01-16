// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_scoring_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeagueScoringRule {

@JsonKey(name: "id") String? get id;@JsonKey(name: "league_id") String? get leagueId;@JsonKey(name: "stat") String get stat;@JsonKey(name: "category") String get category;@RuleModeConverter()@JsonKey(name: "mode") RuleMode get mode;@StringToDoubleConverter()@JsonKey(name: "per_unit_points") double? get perUnitPoints;@StringToDoubleConverter()@JsonKey(name: "flat_points") double? get flatPoints;@StringToIntConverter()@JsonKey(name: "threshold") int? get threshold;@JsonKey(name: "band") String? get band;@StringToDoubleConverter()@JsonKey(name: "multiplier") double? get multiplier;
/// Create a copy of LeagueScoringRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueScoringRuleCopyWith<LeagueScoringRule> get copyWith => _$LeagueScoringRuleCopyWithImpl<LeagueScoringRule>(this as LeagueScoringRule, _$identity);

  /// Serializes this LeagueScoringRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueScoringRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.stat, stat) || other.stat == stat)&&(identical(other.category, category) || other.category == category)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.perUnitPoints, perUnitPoints) || other.perUnitPoints == perUnitPoints)&&(identical(other.flatPoints, flatPoints) || other.flatPoints == flatPoints)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.band, band) || other.band == band)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,stat,category,mode,perUnitPoints,flatPoints,threshold,band,multiplier);

@override
String toString() {
  return 'LeagueScoringRule(id: $id, leagueId: $leagueId, stat: $stat, category: $category, mode: $mode, perUnitPoints: $perUnitPoints, flatPoints: $flatPoints, threshold: $threshold, band: $band, multiplier: $multiplier)';
}


}

/// @nodoc
abstract mixin class $LeagueScoringRuleCopyWith<$Res>  {
  factory $LeagueScoringRuleCopyWith(LeagueScoringRule value, $Res Function(LeagueScoringRule) _then) = _$LeagueScoringRuleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "league_id") String? leagueId,@JsonKey(name: "stat") String stat,@JsonKey(name: "category") String category,@RuleModeConverter()@JsonKey(name: "mode") RuleMode mode,@StringToDoubleConverter()@JsonKey(name: "per_unit_points") double? perUnitPoints,@StringToDoubleConverter()@JsonKey(name: "flat_points") double? flatPoints,@StringToIntConverter()@JsonKey(name: "threshold") int? threshold,@JsonKey(name: "band") String? band,@StringToDoubleConverter()@JsonKey(name: "multiplier") double? multiplier
});




}
/// @nodoc
class _$LeagueScoringRuleCopyWithImpl<$Res>
    implements $LeagueScoringRuleCopyWith<$Res> {
  _$LeagueScoringRuleCopyWithImpl(this._self, this._then);

  final LeagueScoringRule _self;
  final $Res Function(LeagueScoringRule) _then;

/// Create a copy of LeagueScoringRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? leagueId = freezed,Object? stat = null,Object? category = null,Object? mode = null,Object? perUnitPoints = freezed,Object? flatPoints = freezed,Object? threshold = freezed,Object? band = freezed,Object? multiplier = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RuleMode,perUnitPoints: freezed == perUnitPoints ? _self.perUnitPoints : perUnitPoints // ignore: cast_nullable_to_non_nullable
as double?,flatPoints: freezed == flatPoints ? _self.flatPoints : flatPoints // ignore: cast_nullable_to_non_nullable
as double?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,band: freezed == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String?,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueScoringRule].
extension LeagueScoringRulePatterns on LeagueScoringRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueScoringRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueScoringRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueScoringRule value)  $default,){
final _that = this;
switch (_that) {
case _LeagueScoringRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueScoringRule value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueScoringRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "league_id")  String? leagueId, @JsonKey(name: "stat")  String stat, @JsonKey(name: "category")  String category, @RuleModeConverter()@JsonKey(name: "mode")  RuleMode mode, @StringToDoubleConverter()@JsonKey(name: "per_unit_points")  double? perUnitPoints, @StringToDoubleConverter()@JsonKey(name: "flat_points")  double? flatPoints, @StringToIntConverter()@JsonKey(name: "threshold")  int? threshold, @JsonKey(name: "band")  String? band, @StringToDoubleConverter()@JsonKey(name: "multiplier")  double? multiplier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueScoringRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "league_id")  String? leagueId, @JsonKey(name: "stat")  String stat, @JsonKey(name: "category")  String category, @RuleModeConverter()@JsonKey(name: "mode")  RuleMode mode, @StringToDoubleConverter()@JsonKey(name: "per_unit_points")  double? perUnitPoints, @StringToDoubleConverter()@JsonKey(name: "flat_points")  double? flatPoints, @StringToIntConverter()@JsonKey(name: "threshold")  int? threshold, @JsonKey(name: "band")  String? band, @StringToDoubleConverter()@JsonKey(name: "multiplier")  double? multiplier)  $default,) {final _that = this;
switch (_that) {
case _LeagueScoringRule():
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "league_id")  String? leagueId, @JsonKey(name: "stat")  String stat, @JsonKey(name: "category")  String category, @RuleModeConverter()@JsonKey(name: "mode")  RuleMode mode, @StringToDoubleConverter()@JsonKey(name: "per_unit_points")  double? perUnitPoints, @StringToDoubleConverter()@JsonKey(name: "flat_points")  double? flatPoints, @StringToIntConverter()@JsonKey(name: "threshold")  int? threshold, @JsonKey(name: "band")  String? band, @StringToDoubleConverter()@JsonKey(name: "multiplier")  double? multiplier)?  $default,) {final _that = this;
switch (_that) {
case _LeagueScoringRule() when $default != null:
return $default(_that.id,_that.leagueId,_that.stat,_that.category,_that.mode,_that.perUnitPoints,_that.flatPoints,_that.threshold,_that.band,_that.multiplier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueScoringRule implements LeagueScoringRule {
  const _LeagueScoringRule({@JsonKey(name: "id") this.id, @JsonKey(name: "league_id") this.leagueId, @JsonKey(name: "stat") required this.stat, @JsonKey(name: "category") required this.category, @RuleModeConverter()@JsonKey(name: "mode") required this.mode, @StringToDoubleConverter()@JsonKey(name: "per_unit_points") this.perUnitPoints, @StringToDoubleConverter()@JsonKey(name: "flat_points") this.flatPoints, @StringToIntConverter()@JsonKey(name: "threshold") this.threshold, @JsonKey(name: "band") this.band, @StringToDoubleConverter()@JsonKey(name: "multiplier") this.multiplier});
  factory _LeagueScoringRule.fromJson(Map<String, dynamic> json) => _$LeagueScoringRuleFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "league_id") final  String? leagueId;
@override@JsonKey(name: "stat") final  String stat;
@override@JsonKey(name: "category") final  String category;
@override@RuleModeConverter()@JsonKey(name: "mode") final  RuleMode mode;
@override@StringToDoubleConverter()@JsonKey(name: "per_unit_points") final  double? perUnitPoints;
@override@StringToDoubleConverter()@JsonKey(name: "flat_points") final  double? flatPoints;
@override@StringToIntConverter()@JsonKey(name: "threshold") final  int? threshold;
@override@JsonKey(name: "band") final  String? band;
@override@StringToDoubleConverter()@JsonKey(name: "multiplier") final  double? multiplier;

/// Create a copy of LeagueScoringRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueScoringRuleCopyWith<_LeagueScoringRule> get copyWith => __$LeagueScoringRuleCopyWithImpl<_LeagueScoringRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueScoringRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueScoringRule&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.stat, stat) || other.stat == stat)&&(identical(other.category, category) || other.category == category)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.perUnitPoints, perUnitPoints) || other.perUnitPoints == perUnitPoints)&&(identical(other.flatPoints, flatPoints) || other.flatPoints == flatPoints)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.band, band) || other.band == band)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,stat,category,mode,perUnitPoints,flatPoints,threshold,band,multiplier);

@override
String toString() {
  return 'LeagueScoringRule(id: $id, leagueId: $leagueId, stat: $stat, category: $category, mode: $mode, perUnitPoints: $perUnitPoints, flatPoints: $flatPoints, threshold: $threshold, band: $band, multiplier: $multiplier)';
}


}

/// @nodoc
abstract mixin class _$LeagueScoringRuleCopyWith<$Res> implements $LeagueScoringRuleCopyWith<$Res> {
  factory _$LeagueScoringRuleCopyWith(_LeagueScoringRule value, $Res Function(_LeagueScoringRule) _then) = __$LeagueScoringRuleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "league_id") String? leagueId,@JsonKey(name: "stat") String stat,@JsonKey(name: "category") String category,@RuleModeConverter()@JsonKey(name: "mode") RuleMode mode,@StringToDoubleConverter()@JsonKey(name: "per_unit_points") double? perUnitPoints,@StringToDoubleConverter()@JsonKey(name: "flat_points") double? flatPoints,@StringToIntConverter()@JsonKey(name: "threshold") int? threshold,@JsonKey(name: "band") String? band,@StringToDoubleConverter()@JsonKey(name: "multiplier") double? multiplier
});




}
/// @nodoc
class __$LeagueScoringRuleCopyWithImpl<$Res>
    implements _$LeagueScoringRuleCopyWith<$Res> {
  __$LeagueScoringRuleCopyWithImpl(this._self, this._then);

  final _LeagueScoringRule _self;
  final $Res Function(_LeagueScoringRule) _then;

/// Create a copy of LeagueScoringRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? leagueId = freezed,Object? stat = null,Object? category = null,Object? mode = null,Object? perUnitPoints = freezed,Object? flatPoints = freezed,Object? threshold = freezed,Object? band = freezed,Object? multiplier = freezed,}) {
  return _then(_LeagueScoringRule(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RuleMode,perUnitPoints: freezed == perUnitPoints ? _self.perUnitPoints : perUnitPoints // ignore: cast_nullable_to_non_nullable
as double?,flatPoints: freezed == flatPoints ? _self.flatPoints : flatPoints // ignore: cast_nullable_to_non_nullable
as double?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,band: freezed == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String?,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Tournament {

@JsonKey(name: "id") String get id;@JsonKey(name: "name") String get name;@JsonKey(name: "abbreviation") String? get abbreviation;@JsonKey(name: "seasons") List<Season>? get seasons;
/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentCopyWith<Tournament> get copyWith => _$TournamentCopyWithImpl<Tournament>(this as Tournament, _$identity);

  /// Serializes this Tournament to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tournament&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&const DeepCollectionEquality().equals(other.seasons, seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,abbreviation,const DeepCollectionEquality().hash(seasons));

@override
String toString() {
  return 'Tournament(id: $id, name: $name, abbreviation: $abbreviation, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class $TournamentCopyWith<$Res>  {
  factory $TournamentCopyWith(Tournament value, $Res Function(Tournament) _then) = _$TournamentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name,@JsonKey(name: "abbreviation") String? abbreviation,@JsonKey(name: "seasons") List<Season>? seasons
});




}
/// @nodoc
class _$TournamentCopyWithImpl<$Res>
    implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._self, this._then);

  final Tournament _self;
  final $Res Function(Tournament) _then;

/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? abbreviation = freezed,Object? seasons = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tournament].
extension TournamentPatterns on Tournament {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tournament value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tournament() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tournament value)  $default,){
final _that = this;
switch (_that) {
case _Tournament():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tournament value)?  $default,){
final _that = this;
switch (_that) {
case _Tournament() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "abbreviation")  String? abbreviation, @JsonKey(name: "seasons")  List<Season>? seasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tournament() when $default != null:
return $default(_that.id,_that.name,_that.abbreviation,_that.seasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "abbreviation")  String? abbreviation, @JsonKey(name: "seasons")  List<Season>? seasons)  $default,) {final _that = this;
switch (_that) {
case _Tournament():
return $default(_that.id,_that.name,_that.abbreviation,_that.seasons);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "abbreviation")  String? abbreviation, @JsonKey(name: "seasons")  List<Season>? seasons)?  $default,) {final _that = this;
switch (_that) {
case _Tournament() when $default != null:
return $default(_that.id,_that.name,_that.abbreviation,_that.seasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tournament implements Tournament {
  const _Tournament({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "abbreviation") this.abbreviation, @JsonKey(name: "seasons") final  List<Season>? seasons}): _seasons = seasons;
  factory _Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "abbreviation") final  String? abbreviation;
 final  List<Season>? _seasons;
@override@JsonKey(name: "seasons") List<Season>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentCopyWith<_Tournament> get copyWith => __$TournamentCopyWithImpl<_Tournament>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tournament&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&const DeepCollectionEquality().equals(other._seasons, _seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,abbreviation,const DeepCollectionEquality().hash(_seasons));

@override
String toString() {
  return 'Tournament(id: $id, name: $name, abbreviation: $abbreviation, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class _$TournamentCopyWith<$Res> implements $TournamentCopyWith<$Res> {
  factory _$TournamentCopyWith(_Tournament value, $Res Function(_Tournament) _then) = __$TournamentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name,@JsonKey(name: "abbreviation") String? abbreviation,@JsonKey(name: "seasons") List<Season>? seasons
});




}
/// @nodoc
class __$TournamentCopyWithImpl<$Res>
    implements _$TournamentCopyWith<$Res> {
  __$TournamentCopyWithImpl(this._self, this._then);

  final _Tournament _self;
  final $Res Function(_Tournament) _then;

/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? abbreviation = freezed,Object? seasons = freezed,}) {
  return _then(_Tournament(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>?,
  ));
}


}


/// @nodoc
mixin _$Season {

@JsonKey(name: "id") String get id;@JsonKey(name: "start_year") int get startYear;@JsonKey(name: "end_year") int get endYear;
/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonCopyWith<Season> get copyWith => _$SeasonCopyWithImpl<Season>(this as Season, _$identity);

  /// Serializes this Season to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Season&&(identical(other.id, id) || other.id == id)&&(identical(other.startYear, startYear) || other.startYear == startYear)&&(identical(other.endYear, endYear) || other.endYear == endYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startYear,endYear);

@override
String toString() {
  return 'Season(id: $id, startYear: $startYear, endYear: $endYear)';
}


}

/// @nodoc
abstract mixin class $SeasonCopyWith<$Res>  {
  factory $SeasonCopyWith(Season value, $Res Function(Season) _then) = _$SeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "start_year") int startYear,@JsonKey(name: "end_year") int endYear
});




}
/// @nodoc
class _$SeasonCopyWithImpl<$Res>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._self, this._then);

  final Season _self;
  final $Res Function(Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startYear = null,Object? endYear = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startYear: null == startYear ? _self.startYear : startYear // ignore: cast_nullable_to_non_nullable
as int,endYear: null == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Season].
extension SeasonPatterns on Season {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Season value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Season value)  $default,){
final _that = this;
switch (_that) {
case _Season():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Season value)?  $default,){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "start_year")  int startYear, @JsonKey(name: "end_year")  int endYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.id,_that.startYear,_that.endYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "start_year")  int startYear, @JsonKey(name: "end_year")  int endYear)  $default,) {final _that = this;
switch (_that) {
case _Season():
return $default(_that.id,_that.startYear,_that.endYear);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "start_year")  int startYear, @JsonKey(name: "end_year")  int endYear)?  $default,) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.id,_that.startYear,_that.endYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Season implements Season {
  const _Season({@JsonKey(name: "id") required this.id, @JsonKey(name: "start_year") required this.startYear, @JsonKey(name: "end_year") required this.endYear});
  factory _Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "start_year") final  int startYear;
@override@JsonKey(name: "end_year") final  int endYear;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonCopyWith<_Season> get copyWith => __$SeasonCopyWithImpl<_Season>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Season&&(identical(other.id, id) || other.id == id)&&(identical(other.startYear, startYear) || other.startYear == startYear)&&(identical(other.endYear, endYear) || other.endYear == endYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startYear,endYear);

@override
String toString() {
  return 'Season(id: $id, startYear: $startYear, endYear: $endYear)';
}


}

/// @nodoc
abstract mixin class _$SeasonCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$SeasonCopyWith(_Season value, $Res Function(_Season) _then) = __$SeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "start_year") int startYear,@JsonKey(name: "end_year") int endYear
});




}
/// @nodoc
class __$SeasonCopyWithImpl<$Res>
    implements _$SeasonCopyWith<$Res> {
  __$SeasonCopyWithImpl(this._self, this._then);

  final _Season _self;
  final $Res Function(_Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startYear = null,Object? endYear = null,}) {
  return _then(_Season(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startYear: null == startYear ? _self.startYear : startYear // ignore: cast_nullable_to_non_nullable
as int,endYear: null == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
