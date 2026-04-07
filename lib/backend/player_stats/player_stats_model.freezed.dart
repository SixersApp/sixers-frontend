// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatEntry {

@JsonKey(fromJson: _toDouble) double? get value;@JsonKey(fromJson: _toDouble) double? get percentile;
/// Create a copy of StatEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatEntryCopyWith<StatEntry> get copyWith => _$StatEntryCopyWithImpl<StatEntry>(this as StatEntry, _$identity);

  /// Serializes this StatEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatEntry&&(identical(other.value, value) || other.value == value)&&(identical(other.percentile, percentile) || other.percentile == percentile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,percentile);

@override
String toString() {
  return 'StatEntry(value: $value, percentile: $percentile)';
}


}

/// @nodoc
abstract mixin class $StatEntryCopyWith<$Res>  {
  factory $StatEntryCopyWith(StatEntry value, $Res Function(StatEntry) _then) = _$StatEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toDouble) double? value,@JsonKey(fromJson: _toDouble) double? percentile
});




}
/// @nodoc
class _$StatEntryCopyWithImpl<$Res>
    implements $StatEntryCopyWith<$Res> {
  _$StatEntryCopyWithImpl(this._self, this._then);

  final StatEntry _self;
  final $Res Function(StatEntry) _then;

/// Create a copy of StatEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? percentile = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,percentile: freezed == percentile ? _self.percentile : percentile // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatEntry].
extension StatEntryPatterns on StatEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatEntry value)  $default,){
final _that = this;
switch (_that) {
case _StatEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatEntry value)?  $default,){
final _that = this;
switch (_that) {
case _StatEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toDouble)  double? value, @JsonKey(fromJson: _toDouble)  double? percentile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatEntry() when $default != null:
return $default(_that.value,_that.percentile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toDouble)  double? value, @JsonKey(fromJson: _toDouble)  double? percentile)  $default,) {final _that = this;
switch (_that) {
case _StatEntry():
return $default(_that.value,_that.percentile);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toDouble)  double? value, @JsonKey(fromJson: _toDouble)  double? percentile)?  $default,) {final _that = this;
switch (_that) {
case _StatEntry() when $default != null:
return $default(_that.value,_that.percentile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatEntry implements StatEntry {
  const _StatEntry({@JsonKey(fromJson: _toDouble) this.value, @JsonKey(fromJson: _toDouble) this.percentile});
  factory _StatEntry.fromJson(Map<String, dynamic> json) => _$StatEntryFromJson(json);

@override@JsonKey(fromJson: _toDouble) final  double? value;
@override@JsonKey(fromJson: _toDouble) final  double? percentile;

/// Create a copy of StatEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatEntryCopyWith<_StatEntry> get copyWith => __$StatEntryCopyWithImpl<_StatEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatEntry&&(identical(other.value, value) || other.value == value)&&(identical(other.percentile, percentile) || other.percentile == percentile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,percentile);

@override
String toString() {
  return 'StatEntry(value: $value, percentile: $percentile)';
}


}

/// @nodoc
abstract mixin class _$StatEntryCopyWith<$Res> implements $StatEntryCopyWith<$Res> {
  factory _$StatEntryCopyWith(_StatEntry value, $Res Function(_StatEntry) _then) = __$StatEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toDouble) double? value,@JsonKey(fromJson: _toDouble) double? percentile
});




}
/// @nodoc
class __$StatEntryCopyWithImpl<$Res>
    implements _$StatEntryCopyWith<$Res> {
  __$StatEntryCopyWithImpl(this._self, this._then);

  final _StatEntry _self;
  final $Res Function(_StatEntry) _then;

/// Create a copy of StatEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? percentile = freezed,}) {
  return _then(_StatEntry(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,percentile: freezed == percentile ? _self.percentile : percentile // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$BattingStats {

 StatEntry? get matchesBatted; StatEntry? get totalRuns; StatEntry? get halfCenturies; StatEntry? get centuries; StatEntry? get strikeRate; StatEntry? get battingAverage;
/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattingStatsCopyWith<BattingStats> get copyWith => _$BattingStatsCopyWithImpl<BattingStats>(this as BattingStats, _$identity);

  /// Serializes this BattingStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattingStats&&(identical(other.matchesBatted, matchesBatted) || other.matchesBatted == matchesBatted)&&(identical(other.totalRuns, totalRuns) || other.totalRuns == totalRuns)&&(identical(other.halfCenturies, halfCenturies) || other.halfCenturies == halfCenturies)&&(identical(other.centuries, centuries) || other.centuries == centuries)&&(identical(other.strikeRate, strikeRate) || other.strikeRate == strikeRate)&&(identical(other.battingAverage, battingAverage) || other.battingAverage == battingAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesBatted,totalRuns,halfCenturies,centuries,strikeRate,battingAverage);

@override
String toString() {
  return 'BattingStats(matchesBatted: $matchesBatted, totalRuns: $totalRuns, halfCenturies: $halfCenturies, centuries: $centuries, strikeRate: $strikeRate, battingAverage: $battingAverage)';
}


}

/// @nodoc
abstract mixin class $BattingStatsCopyWith<$Res>  {
  factory $BattingStatsCopyWith(BattingStats value, $Res Function(BattingStats) _then) = _$BattingStatsCopyWithImpl;
@useResult
$Res call({
 StatEntry? matchesBatted, StatEntry? totalRuns, StatEntry? halfCenturies, StatEntry? centuries, StatEntry? strikeRate, StatEntry? battingAverage
});


$StatEntryCopyWith<$Res>? get matchesBatted;$StatEntryCopyWith<$Res>? get totalRuns;$StatEntryCopyWith<$Res>? get halfCenturies;$StatEntryCopyWith<$Res>? get centuries;$StatEntryCopyWith<$Res>? get strikeRate;$StatEntryCopyWith<$Res>? get battingAverage;

}
/// @nodoc
class _$BattingStatsCopyWithImpl<$Res>
    implements $BattingStatsCopyWith<$Res> {
  _$BattingStatsCopyWithImpl(this._self, this._then);

  final BattingStats _self;
  final $Res Function(BattingStats) _then;

/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchesBatted = freezed,Object? totalRuns = freezed,Object? halfCenturies = freezed,Object? centuries = freezed,Object? strikeRate = freezed,Object? battingAverage = freezed,}) {
  return _then(_self.copyWith(
matchesBatted: freezed == matchesBatted ? _self.matchesBatted : matchesBatted // ignore: cast_nullable_to_non_nullable
as StatEntry?,totalRuns: freezed == totalRuns ? _self.totalRuns : totalRuns // ignore: cast_nullable_to_non_nullable
as StatEntry?,halfCenturies: freezed == halfCenturies ? _self.halfCenturies : halfCenturies // ignore: cast_nullable_to_non_nullable
as StatEntry?,centuries: freezed == centuries ? _self.centuries : centuries // ignore: cast_nullable_to_non_nullable
as StatEntry?,strikeRate: freezed == strikeRate ? _self.strikeRate : strikeRate // ignore: cast_nullable_to_non_nullable
as StatEntry?,battingAverage: freezed == battingAverage ? _self.battingAverage : battingAverage // ignore: cast_nullable_to_non_nullable
as StatEntry?,
  ));
}
/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get matchesBatted {
    if (_self.matchesBatted == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.matchesBatted!, (value) {
    return _then(_self.copyWith(matchesBatted: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get totalRuns {
    if (_self.totalRuns == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.totalRuns!, (value) {
    return _then(_self.copyWith(totalRuns: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get halfCenturies {
    if (_self.halfCenturies == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.halfCenturies!, (value) {
    return _then(_self.copyWith(halfCenturies: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get centuries {
    if (_self.centuries == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.centuries!, (value) {
    return _then(_self.copyWith(centuries: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get strikeRate {
    if (_self.strikeRate == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.strikeRate!, (value) {
    return _then(_self.copyWith(strikeRate: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get battingAverage {
    if (_self.battingAverage == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.battingAverage!, (value) {
    return _then(_self.copyWith(battingAverage: value));
  });
}
}


/// Adds pattern-matching-related methods to [BattingStats].
extension BattingStatsPatterns on BattingStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattingStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattingStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattingStats value)  $default,){
final _that = this;
switch (_that) {
case _BattingStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattingStats value)?  $default,){
final _that = this;
switch (_that) {
case _BattingStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatEntry? matchesBatted,  StatEntry? totalRuns,  StatEntry? halfCenturies,  StatEntry? centuries,  StatEntry? strikeRate,  StatEntry? battingAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattingStats() when $default != null:
return $default(_that.matchesBatted,_that.totalRuns,_that.halfCenturies,_that.centuries,_that.strikeRate,_that.battingAverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatEntry? matchesBatted,  StatEntry? totalRuns,  StatEntry? halfCenturies,  StatEntry? centuries,  StatEntry? strikeRate,  StatEntry? battingAverage)  $default,) {final _that = this;
switch (_that) {
case _BattingStats():
return $default(_that.matchesBatted,_that.totalRuns,_that.halfCenturies,_that.centuries,_that.strikeRate,_that.battingAverage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatEntry? matchesBatted,  StatEntry? totalRuns,  StatEntry? halfCenturies,  StatEntry? centuries,  StatEntry? strikeRate,  StatEntry? battingAverage)?  $default,) {final _that = this;
switch (_that) {
case _BattingStats() when $default != null:
return $default(_that.matchesBatted,_that.totalRuns,_that.halfCenturies,_that.centuries,_that.strikeRate,_that.battingAverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BattingStats implements BattingStats {
  const _BattingStats({this.matchesBatted, this.totalRuns, this.halfCenturies, this.centuries, this.strikeRate, this.battingAverage});
  factory _BattingStats.fromJson(Map<String, dynamic> json) => _$BattingStatsFromJson(json);

@override final  StatEntry? matchesBatted;
@override final  StatEntry? totalRuns;
@override final  StatEntry? halfCenturies;
@override final  StatEntry? centuries;
@override final  StatEntry? strikeRate;
@override final  StatEntry? battingAverage;

/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattingStatsCopyWith<_BattingStats> get copyWith => __$BattingStatsCopyWithImpl<_BattingStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BattingStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattingStats&&(identical(other.matchesBatted, matchesBatted) || other.matchesBatted == matchesBatted)&&(identical(other.totalRuns, totalRuns) || other.totalRuns == totalRuns)&&(identical(other.halfCenturies, halfCenturies) || other.halfCenturies == halfCenturies)&&(identical(other.centuries, centuries) || other.centuries == centuries)&&(identical(other.strikeRate, strikeRate) || other.strikeRate == strikeRate)&&(identical(other.battingAverage, battingAverage) || other.battingAverage == battingAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesBatted,totalRuns,halfCenturies,centuries,strikeRate,battingAverage);

@override
String toString() {
  return 'BattingStats(matchesBatted: $matchesBatted, totalRuns: $totalRuns, halfCenturies: $halfCenturies, centuries: $centuries, strikeRate: $strikeRate, battingAverage: $battingAverage)';
}


}

/// @nodoc
abstract mixin class _$BattingStatsCopyWith<$Res> implements $BattingStatsCopyWith<$Res> {
  factory _$BattingStatsCopyWith(_BattingStats value, $Res Function(_BattingStats) _then) = __$BattingStatsCopyWithImpl;
@override @useResult
$Res call({
 StatEntry? matchesBatted, StatEntry? totalRuns, StatEntry? halfCenturies, StatEntry? centuries, StatEntry? strikeRate, StatEntry? battingAverage
});


@override $StatEntryCopyWith<$Res>? get matchesBatted;@override $StatEntryCopyWith<$Res>? get totalRuns;@override $StatEntryCopyWith<$Res>? get halfCenturies;@override $StatEntryCopyWith<$Res>? get centuries;@override $StatEntryCopyWith<$Res>? get strikeRate;@override $StatEntryCopyWith<$Res>? get battingAverage;

}
/// @nodoc
class __$BattingStatsCopyWithImpl<$Res>
    implements _$BattingStatsCopyWith<$Res> {
  __$BattingStatsCopyWithImpl(this._self, this._then);

  final _BattingStats _self;
  final $Res Function(_BattingStats) _then;

/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchesBatted = freezed,Object? totalRuns = freezed,Object? halfCenturies = freezed,Object? centuries = freezed,Object? strikeRate = freezed,Object? battingAverage = freezed,}) {
  return _then(_BattingStats(
matchesBatted: freezed == matchesBatted ? _self.matchesBatted : matchesBatted // ignore: cast_nullable_to_non_nullable
as StatEntry?,totalRuns: freezed == totalRuns ? _self.totalRuns : totalRuns // ignore: cast_nullable_to_non_nullable
as StatEntry?,halfCenturies: freezed == halfCenturies ? _self.halfCenturies : halfCenturies // ignore: cast_nullable_to_non_nullable
as StatEntry?,centuries: freezed == centuries ? _self.centuries : centuries // ignore: cast_nullable_to_non_nullable
as StatEntry?,strikeRate: freezed == strikeRate ? _self.strikeRate : strikeRate // ignore: cast_nullable_to_non_nullable
as StatEntry?,battingAverage: freezed == battingAverage ? _self.battingAverage : battingAverage // ignore: cast_nullable_to_non_nullable
as StatEntry?,
  ));
}

/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get matchesBatted {
    if (_self.matchesBatted == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.matchesBatted!, (value) {
    return _then(_self.copyWith(matchesBatted: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get totalRuns {
    if (_self.totalRuns == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.totalRuns!, (value) {
    return _then(_self.copyWith(totalRuns: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get halfCenturies {
    if (_self.halfCenturies == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.halfCenturies!, (value) {
    return _then(_self.copyWith(halfCenturies: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get centuries {
    if (_self.centuries == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.centuries!, (value) {
    return _then(_self.copyWith(centuries: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get strikeRate {
    if (_self.strikeRate == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.strikeRate!, (value) {
    return _then(_self.copyWith(strikeRate: value));
  });
}/// Create a copy of BattingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get battingAverage {
    if (_self.battingAverage == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.battingAverage!, (value) {
    return _then(_self.copyWith(battingAverage: value));
  });
}
}


/// @nodoc
mixin _$BowlingStats {

 StatEntry? get matchesBowled; StatEntry? get totalWickets; StatEntry? get threeWicketHauls; StatEntry? get fiveWicketHauls; StatEntry? get bowlingAverage; StatEntry? get bowlingEconomy;
/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BowlingStatsCopyWith<BowlingStats> get copyWith => _$BowlingStatsCopyWithImpl<BowlingStats>(this as BowlingStats, _$identity);

  /// Serializes this BowlingStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BowlingStats&&(identical(other.matchesBowled, matchesBowled) || other.matchesBowled == matchesBowled)&&(identical(other.totalWickets, totalWickets) || other.totalWickets == totalWickets)&&(identical(other.threeWicketHauls, threeWicketHauls) || other.threeWicketHauls == threeWicketHauls)&&(identical(other.fiveWicketHauls, fiveWicketHauls) || other.fiveWicketHauls == fiveWicketHauls)&&(identical(other.bowlingAverage, bowlingAverage) || other.bowlingAverage == bowlingAverage)&&(identical(other.bowlingEconomy, bowlingEconomy) || other.bowlingEconomy == bowlingEconomy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesBowled,totalWickets,threeWicketHauls,fiveWicketHauls,bowlingAverage,bowlingEconomy);

@override
String toString() {
  return 'BowlingStats(matchesBowled: $matchesBowled, totalWickets: $totalWickets, threeWicketHauls: $threeWicketHauls, fiveWicketHauls: $fiveWicketHauls, bowlingAverage: $bowlingAverage, bowlingEconomy: $bowlingEconomy)';
}


}

/// @nodoc
abstract mixin class $BowlingStatsCopyWith<$Res>  {
  factory $BowlingStatsCopyWith(BowlingStats value, $Res Function(BowlingStats) _then) = _$BowlingStatsCopyWithImpl;
@useResult
$Res call({
 StatEntry? matchesBowled, StatEntry? totalWickets, StatEntry? threeWicketHauls, StatEntry? fiveWicketHauls, StatEntry? bowlingAverage, StatEntry? bowlingEconomy
});


$StatEntryCopyWith<$Res>? get matchesBowled;$StatEntryCopyWith<$Res>? get totalWickets;$StatEntryCopyWith<$Res>? get threeWicketHauls;$StatEntryCopyWith<$Res>? get fiveWicketHauls;$StatEntryCopyWith<$Res>? get bowlingAverage;$StatEntryCopyWith<$Res>? get bowlingEconomy;

}
/// @nodoc
class _$BowlingStatsCopyWithImpl<$Res>
    implements $BowlingStatsCopyWith<$Res> {
  _$BowlingStatsCopyWithImpl(this._self, this._then);

  final BowlingStats _self;
  final $Res Function(BowlingStats) _then;

/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchesBowled = freezed,Object? totalWickets = freezed,Object? threeWicketHauls = freezed,Object? fiveWicketHauls = freezed,Object? bowlingAverage = freezed,Object? bowlingEconomy = freezed,}) {
  return _then(_self.copyWith(
matchesBowled: freezed == matchesBowled ? _self.matchesBowled : matchesBowled // ignore: cast_nullable_to_non_nullable
as StatEntry?,totalWickets: freezed == totalWickets ? _self.totalWickets : totalWickets // ignore: cast_nullable_to_non_nullable
as StatEntry?,threeWicketHauls: freezed == threeWicketHauls ? _self.threeWicketHauls : threeWicketHauls // ignore: cast_nullable_to_non_nullable
as StatEntry?,fiveWicketHauls: freezed == fiveWicketHauls ? _self.fiveWicketHauls : fiveWicketHauls // ignore: cast_nullable_to_non_nullable
as StatEntry?,bowlingAverage: freezed == bowlingAverage ? _self.bowlingAverage : bowlingAverage // ignore: cast_nullable_to_non_nullable
as StatEntry?,bowlingEconomy: freezed == bowlingEconomy ? _self.bowlingEconomy : bowlingEconomy // ignore: cast_nullable_to_non_nullable
as StatEntry?,
  ));
}
/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get matchesBowled {
    if (_self.matchesBowled == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.matchesBowled!, (value) {
    return _then(_self.copyWith(matchesBowled: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get totalWickets {
    if (_self.totalWickets == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.totalWickets!, (value) {
    return _then(_self.copyWith(totalWickets: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get threeWicketHauls {
    if (_self.threeWicketHauls == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.threeWicketHauls!, (value) {
    return _then(_self.copyWith(threeWicketHauls: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get fiveWicketHauls {
    if (_self.fiveWicketHauls == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.fiveWicketHauls!, (value) {
    return _then(_self.copyWith(fiveWicketHauls: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get bowlingAverage {
    if (_self.bowlingAverage == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.bowlingAverage!, (value) {
    return _then(_self.copyWith(bowlingAverage: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get bowlingEconomy {
    if (_self.bowlingEconomy == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.bowlingEconomy!, (value) {
    return _then(_self.copyWith(bowlingEconomy: value));
  });
}
}


/// Adds pattern-matching-related methods to [BowlingStats].
extension BowlingStatsPatterns on BowlingStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BowlingStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BowlingStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BowlingStats value)  $default,){
final _that = this;
switch (_that) {
case _BowlingStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BowlingStats value)?  $default,){
final _that = this;
switch (_that) {
case _BowlingStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatEntry? matchesBowled,  StatEntry? totalWickets,  StatEntry? threeWicketHauls,  StatEntry? fiveWicketHauls,  StatEntry? bowlingAverage,  StatEntry? bowlingEconomy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BowlingStats() when $default != null:
return $default(_that.matchesBowled,_that.totalWickets,_that.threeWicketHauls,_that.fiveWicketHauls,_that.bowlingAverage,_that.bowlingEconomy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatEntry? matchesBowled,  StatEntry? totalWickets,  StatEntry? threeWicketHauls,  StatEntry? fiveWicketHauls,  StatEntry? bowlingAverage,  StatEntry? bowlingEconomy)  $default,) {final _that = this;
switch (_that) {
case _BowlingStats():
return $default(_that.matchesBowled,_that.totalWickets,_that.threeWicketHauls,_that.fiveWicketHauls,_that.bowlingAverage,_that.bowlingEconomy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatEntry? matchesBowled,  StatEntry? totalWickets,  StatEntry? threeWicketHauls,  StatEntry? fiveWicketHauls,  StatEntry? bowlingAverage,  StatEntry? bowlingEconomy)?  $default,) {final _that = this;
switch (_that) {
case _BowlingStats() when $default != null:
return $default(_that.matchesBowled,_that.totalWickets,_that.threeWicketHauls,_that.fiveWicketHauls,_that.bowlingAverage,_that.bowlingEconomy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BowlingStats implements BowlingStats {
  const _BowlingStats({this.matchesBowled, this.totalWickets, this.threeWicketHauls, this.fiveWicketHauls, this.bowlingAverage, this.bowlingEconomy});
  factory _BowlingStats.fromJson(Map<String, dynamic> json) => _$BowlingStatsFromJson(json);

@override final  StatEntry? matchesBowled;
@override final  StatEntry? totalWickets;
@override final  StatEntry? threeWicketHauls;
@override final  StatEntry? fiveWicketHauls;
@override final  StatEntry? bowlingAverage;
@override final  StatEntry? bowlingEconomy;

/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BowlingStatsCopyWith<_BowlingStats> get copyWith => __$BowlingStatsCopyWithImpl<_BowlingStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BowlingStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BowlingStats&&(identical(other.matchesBowled, matchesBowled) || other.matchesBowled == matchesBowled)&&(identical(other.totalWickets, totalWickets) || other.totalWickets == totalWickets)&&(identical(other.threeWicketHauls, threeWicketHauls) || other.threeWicketHauls == threeWicketHauls)&&(identical(other.fiveWicketHauls, fiveWicketHauls) || other.fiveWicketHauls == fiveWicketHauls)&&(identical(other.bowlingAverage, bowlingAverage) || other.bowlingAverage == bowlingAverage)&&(identical(other.bowlingEconomy, bowlingEconomy) || other.bowlingEconomy == bowlingEconomy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesBowled,totalWickets,threeWicketHauls,fiveWicketHauls,bowlingAverage,bowlingEconomy);

@override
String toString() {
  return 'BowlingStats(matchesBowled: $matchesBowled, totalWickets: $totalWickets, threeWicketHauls: $threeWicketHauls, fiveWicketHauls: $fiveWicketHauls, bowlingAverage: $bowlingAverage, bowlingEconomy: $bowlingEconomy)';
}


}

/// @nodoc
abstract mixin class _$BowlingStatsCopyWith<$Res> implements $BowlingStatsCopyWith<$Res> {
  factory _$BowlingStatsCopyWith(_BowlingStats value, $Res Function(_BowlingStats) _then) = __$BowlingStatsCopyWithImpl;
@override @useResult
$Res call({
 StatEntry? matchesBowled, StatEntry? totalWickets, StatEntry? threeWicketHauls, StatEntry? fiveWicketHauls, StatEntry? bowlingAverage, StatEntry? bowlingEconomy
});


@override $StatEntryCopyWith<$Res>? get matchesBowled;@override $StatEntryCopyWith<$Res>? get totalWickets;@override $StatEntryCopyWith<$Res>? get threeWicketHauls;@override $StatEntryCopyWith<$Res>? get fiveWicketHauls;@override $StatEntryCopyWith<$Res>? get bowlingAverage;@override $StatEntryCopyWith<$Res>? get bowlingEconomy;

}
/// @nodoc
class __$BowlingStatsCopyWithImpl<$Res>
    implements _$BowlingStatsCopyWith<$Res> {
  __$BowlingStatsCopyWithImpl(this._self, this._then);

  final _BowlingStats _self;
  final $Res Function(_BowlingStats) _then;

/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchesBowled = freezed,Object? totalWickets = freezed,Object? threeWicketHauls = freezed,Object? fiveWicketHauls = freezed,Object? bowlingAverage = freezed,Object? bowlingEconomy = freezed,}) {
  return _then(_BowlingStats(
matchesBowled: freezed == matchesBowled ? _self.matchesBowled : matchesBowled // ignore: cast_nullable_to_non_nullable
as StatEntry?,totalWickets: freezed == totalWickets ? _self.totalWickets : totalWickets // ignore: cast_nullable_to_non_nullable
as StatEntry?,threeWicketHauls: freezed == threeWicketHauls ? _self.threeWicketHauls : threeWicketHauls // ignore: cast_nullable_to_non_nullable
as StatEntry?,fiveWicketHauls: freezed == fiveWicketHauls ? _self.fiveWicketHauls : fiveWicketHauls // ignore: cast_nullable_to_non_nullable
as StatEntry?,bowlingAverage: freezed == bowlingAverage ? _self.bowlingAverage : bowlingAverage // ignore: cast_nullable_to_non_nullable
as StatEntry?,bowlingEconomy: freezed == bowlingEconomy ? _self.bowlingEconomy : bowlingEconomy // ignore: cast_nullable_to_non_nullable
as StatEntry?,
  ));
}

/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get matchesBowled {
    if (_self.matchesBowled == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.matchesBowled!, (value) {
    return _then(_self.copyWith(matchesBowled: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get totalWickets {
    if (_self.totalWickets == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.totalWickets!, (value) {
    return _then(_self.copyWith(totalWickets: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get threeWicketHauls {
    if (_self.threeWicketHauls == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.threeWicketHauls!, (value) {
    return _then(_self.copyWith(threeWicketHauls: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get fiveWicketHauls {
    if (_self.fiveWicketHauls == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.fiveWicketHauls!, (value) {
    return _then(_self.copyWith(fiveWicketHauls: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get bowlingAverage {
    if (_self.bowlingAverage == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.bowlingAverage!, (value) {
    return _then(_self.copyWith(bowlingAverage: value));
  });
}/// Create a copy of BowlingStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatEntryCopyWith<$Res>? get bowlingEconomy {
    if (_self.bowlingEconomy == null) {
    return null;
  }

  return $StatEntryCopyWith<$Res>(_self.bowlingEconomy!, (value) {
    return _then(_self.copyWith(bowlingEconomy: value));
  });
}
}


/// @nodoc
mixin _$SeasonStats {

 String get seasonId; int get endYear; String? get tournamentName; String? get tournamentAbbreviation; String get teamName; String? get teamImage; String? get teamAbbreviation; String get role; BattingStats? get batting; BowlingStats? get bowling;
/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonStatsCopyWith<SeasonStats> get copyWith => _$SeasonStatsCopyWithImpl<SeasonStats>(this as SeasonStats, _$identity);

  /// Serializes this SeasonStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonStats&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.endYear, endYear) || other.endYear == endYear)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentAbbreviation, tournamentAbbreviation) || other.tournamentAbbreviation == tournamentAbbreviation)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.role, role) || other.role == role)&&(identical(other.batting, batting) || other.batting == batting)&&(identical(other.bowling, bowling) || other.bowling == bowling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonId,endYear,tournamentName,tournamentAbbreviation,teamName,teamImage,teamAbbreviation,role,batting,bowling);

@override
String toString() {
  return 'SeasonStats(seasonId: $seasonId, endYear: $endYear, tournamentName: $tournamentName, tournamentAbbreviation: $tournamentAbbreviation, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, role: $role, batting: $batting, bowling: $bowling)';
}


}

/// @nodoc
abstract mixin class $SeasonStatsCopyWith<$Res>  {
  factory $SeasonStatsCopyWith(SeasonStats value, $Res Function(SeasonStats) _then) = _$SeasonStatsCopyWithImpl;
@useResult
$Res call({
 String seasonId, int endYear, String? tournamentName, String? tournamentAbbreviation, String teamName, String? teamImage, String? teamAbbreviation, String role, BattingStats? batting, BowlingStats? bowling
});


$BattingStatsCopyWith<$Res>? get batting;$BowlingStatsCopyWith<$Res>? get bowling;

}
/// @nodoc
class _$SeasonStatsCopyWithImpl<$Res>
    implements $SeasonStatsCopyWith<$Res> {
  _$SeasonStatsCopyWithImpl(this._self, this._then);

  final SeasonStats _self;
  final $Res Function(SeasonStats) _then;

/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonId = null,Object? endYear = null,Object? tournamentName = freezed,Object? tournamentAbbreviation = freezed,Object? teamName = null,Object? teamImage = freezed,Object? teamAbbreviation = freezed,Object? role = null,Object? batting = freezed,Object? bowling = freezed,}) {
  return _then(_self.copyWith(
seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,endYear: null == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,tournamentAbbreviation: freezed == tournamentAbbreviation ? _self.tournamentAbbreviation : tournamentAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: freezed == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,batting: freezed == batting ? _self.batting : batting // ignore: cast_nullable_to_non_nullable
as BattingStats?,bowling: freezed == bowling ? _self.bowling : bowling // ignore: cast_nullable_to_non_nullable
as BowlingStats?,
  ));
}
/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattingStatsCopyWith<$Res>? get batting {
    if (_self.batting == null) {
    return null;
  }

  return $BattingStatsCopyWith<$Res>(_self.batting!, (value) {
    return _then(_self.copyWith(batting: value));
  });
}/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BowlingStatsCopyWith<$Res>? get bowling {
    if (_self.bowling == null) {
    return null;
  }

  return $BowlingStatsCopyWith<$Res>(_self.bowling!, (value) {
    return _then(_self.copyWith(bowling: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeasonStats].
extension SeasonStatsPatterns on SeasonStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonStats value)  $default,){
final _that = this;
switch (_that) {
case _SeasonStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonStats value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String seasonId,  int endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  String role,  BattingStats? batting,  BowlingStats? bowling)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonStats() when $default != null:
return $default(_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.role,_that.batting,_that.bowling);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String seasonId,  int endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  String role,  BattingStats? batting,  BowlingStats? bowling)  $default,) {final _that = this;
switch (_that) {
case _SeasonStats():
return $default(_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.role,_that.batting,_that.bowling);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String seasonId,  int endYear,  String? tournamentName,  String? tournamentAbbreviation,  String teamName,  String? teamImage,  String? teamAbbreviation,  String role,  BattingStats? batting,  BowlingStats? bowling)?  $default,) {final _that = this;
switch (_that) {
case _SeasonStats() when $default != null:
return $default(_that.seasonId,_that.endYear,_that.tournamentName,_that.tournamentAbbreviation,_that.teamName,_that.teamImage,_that.teamAbbreviation,_that.role,_that.batting,_that.bowling);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonStats implements SeasonStats {
  const _SeasonStats({required this.seasonId, required this.endYear, this.tournamentName, this.tournamentAbbreviation, this.teamName = '', this.teamImage, this.teamAbbreviation, this.role = '', this.batting, this.bowling});
  factory _SeasonStats.fromJson(Map<String, dynamic> json) => _$SeasonStatsFromJson(json);

@override final  String seasonId;
@override final  int endYear;
@override final  String? tournamentName;
@override final  String? tournamentAbbreviation;
@override@JsonKey() final  String teamName;
@override final  String? teamImage;
@override final  String? teamAbbreviation;
@override@JsonKey() final  String role;
@override final  BattingStats? batting;
@override final  BowlingStats? bowling;

/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonStatsCopyWith<_SeasonStats> get copyWith => __$SeasonStatsCopyWithImpl<_SeasonStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonStats&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.endYear, endYear) || other.endYear == endYear)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentAbbreviation, tournamentAbbreviation) || other.tournamentAbbreviation == tournamentAbbreviation)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.teamImage, teamImage) || other.teamImage == teamImage)&&(identical(other.teamAbbreviation, teamAbbreviation) || other.teamAbbreviation == teamAbbreviation)&&(identical(other.role, role) || other.role == role)&&(identical(other.batting, batting) || other.batting == batting)&&(identical(other.bowling, bowling) || other.bowling == bowling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonId,endYear,tournamentName,tournamentAbbreviation,teamName,teamImage,teamAbbreviation,role,batting,bowling);

@override
String toString() {
  return 'SeasonStats(seasonId: $seasonId, endYear: $endYear, tournamentName: $tournamentName, tournamentAbbreviation: $tournamentAbbreviation, teamName: $teamName, teamImage: $teamImage, teamAbbreviation: $teamAbbreviation, role: $role, batting: $batting, bowling: $bowling)';
}


}

/// @nodoc
abstract mixin class _$SeasonStatsCopyWith<$Res> implements $SeasonStatsCopyWith<$Res> {
  factory _$SeasonStatsCopyWith(_SeasonStats value, $Res Function(_SeasonStats) _then) = __$SeasonStatsCopyWithImpl;
@override @useResult
$Res call({
 String seasonId, int endYear, String? tournamentName, String? tournamentAbbreviation, String teamName, String? teamImage, String? teamAbbreviation, String role, BattingStats? batting, BowlingStats? bowling
});


@override $BattingStatsCopyWith<$Res>? get batting;@override $BowlingStatsCopyWith<$Res>? get bowling;

}
/// @nodoc
class __$SeasonStatsCopyWithImpl<$Res>
    implements _$SeasonStatsCopyWith<$Res> {
  __$SeasonStatsCopyWithImpl(this._self, this._then);

  final _SeasonStats _self;
  final $Res Function(_SeasonStats) _then;

/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonId = null,Object? endYear = null,Object? tournamentName = freezed,Object? tournamentAbbreviation = freezed,Object? teamName = null,Object? teamImage = freezed,Object? teamAbbreviation = freezed,Object? role = null,Object? batting = freezed,Object? bowling = freezed,}) {
  return _then(_SeasonStats(
seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,endYear: null == endYear ? _self.endYear : endYear // ignore: cast_nullable_to_non_nullable
as int,tournamentName: freezed == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String?,tournamentAbbreviation: freezed == tournamentAbbreviation ? _self.tournamentAbbreviation : tournamentAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,teamImage: freezed == teamImage ? _self.teamImage : teamImage // ignore: cast_nullable_to_non_nullable
as String?,teamAbbreviation: freezed == teamAbbreviation ? _self.teamAbbreviation : teamAbbreviation // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,batting: freezed == batting ? _self.batting : batting // ignore: cast_nullable_to_non_nullable
as BattingStats?,bowling: freezed == bowling ? _self.bowling : bowling // ignore: cast_nullable_to_non_nullable
as BowlingStats?,
  ));
}

/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattingStatsCopyWith<$Res>? get batting {
    if (_self.batting == null) {
    return null;
  }

  return $BattingStatsCopyWith<$Res>(_self.batting!, (value) {
    return _then(_self.copyWith(batting: value));
  });
}/// Create a copy of SeasonStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BowlingStatsCopyWith<$Res>? get bowling {
    if (_self.bowling == null) {
    return null;
  }

  return $BowlingStatsCopyWith<$Res>(_self.bowling!, (value) {
    return _then(_self.copyWith(bowling: value));
  });
}
}


/// @nodoc
mixin _$PlayerStats {

 String? get playerId; String get name; String get image; List<SeasonStats> get seasons;
/// Create a copy of PlayerStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStatsCopyWith<PlayerStats> get copyWith => _$PlayerStatsCopyWithImpl<PlayerStats>(this as PlayerStats, _$identity);

  /// Serializes this PlayerStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStats&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.seasons, seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,image,const DeepCollectionEquality().hash(seasons));

@override
String toString() {
  return 'PlayerStats(playerId: $playerId, name: $name, image: $image, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class $PlayerStatsCopyWith<$Res>  {
  factory $PlayerStatsCopyWith(PlayerStats value, $Res Function(PlayerStats) _then) = _$PlayerStatsCopyWithImpl;
@useResult
$Res call({
 String? playerId, String name, String image, List<SeasonStats> seasons
});




}
/// @nodoc
class _$PlayerStatsCopyWithImpl<$Res>
    implements $PlayerStatsCopyWith<$Res> {
  _$PlayerStatsCopyWithImpl(this._self, this._then);

  final PlayerStats _self;
  final $Res Function(PlayerStats) _then;

/// Create a copy of PlayerStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = freezed,Object? name = null,Object? image = null,Object? seasons = null,}) {
  return _then(_self.copyWith(
playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,seasons: null == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonStats>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerStats].
extension PlayerStatsPatterns on PlayerStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerStats value)  $default,){
final _that = this;
switch (_that) {
case _PlayerStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerStats value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? playerId,  String name,  String image,  List<SeasonStats> seasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerStats() when $default != null:
return $default(_that.playerId,_that.name,_that.image,_that.seasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? playerId,  String name,  String image,  List<SeasonStats> seasons)  $default,) {final _that = this;
switch (_that) {
case _PlayerStats():
return $default(_that.playerId,_that.name,_that.image,_that.seasons);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? playerId,  String name,  String image,  List<SeasonStats> seasons)?  $default,) {final _that = this;
switch (_that) {
case _PlayerStats() when $default != null:
return $default(_that.playerId,_that.name,_that.image,_that.seasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerStats implements PlayerStats {
  const _PlayerStats({this.playerId, this.name = '', this.image = '', final  List<SeasonStats> seasons = const []}): _seasons = seasons;
  factory _PlayerStats.fromJson(Map<String, dynamic> json) => _$PlayerStatsFromJson(json);

@override final  String? playerId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String image;
 final  List<SeasonStats> _seasons;
@override@JsonKey() List<SeasonStats> get seasons {
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasons);
}


/// Create a copy of PlayerStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStatsCopyWith<_PlayerStats> get copyWith => __$PlayerStatsCopyWithImpl<_PlayerStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStats&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._seasons, _seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,image,const DeepCollectionEquality().hash(_seasons));

@override
String toString() {
  return 'PlayerStats(playerId: $playerId, name: $name, image: $image, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class _$PlayerStatsCopyWith<$Res> implements $PlayerStatsCopyWith<$Res> {
  factory _$PlayerStatsCopyWith(_PlayerStats value, $Res Function(_PlayerStats) _then) = __$PlayerStatsCopyWithImpl;
@override @useResult
$Res call({
 String? playerId, String name, String image, List<SeasonStats> seasons
});




}
/// @nodoc
class __$PlayerStatsCopyWithImpl<$Res>
    implements _$PlayerStatsCopyWith<$Res> {
  __$PlayerStatsCopyWithImpl(this._self, this._then);

  final _PlayerStats _self;
  final $Res Function(_PlayerStats) _then;

/// Create a copy of PlayerStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = freezed,Object? name = null,Object? image = null,Object? seasons = null,}) {
  return _then(_PlayerStats(
playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,seasons: null == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonStats>,
  ));
}


}

// dart format on
