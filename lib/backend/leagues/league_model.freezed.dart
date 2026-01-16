// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraftSettings {

@JsonKey(name: "time_per_pick") int get timePerPick;@JsonKey(name: "pick_warning_seconds") int get pickWarningSeconds;@JsonKey(name: "snake_draft") bool get snakeDraft;
/// Create a copy of DraftSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftSettingsCopyWith<DraftSettings> get copyWith => _$DraftSettingsCopyWithImpl<DraftSettings>(this as DraftSettings, _$identity);

  /// Serializes this DraftSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftSettings&&(identical(other.timePerPick, timePerPick) || other.timePerPick == timePerPick)&&(identical(other.pickWarningSeconds, pickWarningSeconds) || other.pickWarningSeconds == pickWarningSeconds)&&(identical(other.snakeDraft, snakeDraft) || other.snakeDraft == snakeDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timePerPick,pickWarningSeconds,snakeDraft);

@override
String toString() {
  return 'DraftSettings(timePerPick: $timePerPick, pickWarningSeconds: $pickWarningSeconds, snakeDraft: $snakeDraft)';
}


}

/// @nodoc
abstract mixin class $DraftSettingsCopyWith<$Res>  {
  factory $DraftSettingsCopyWith(DraftSettings value, $Res Function(DraftSettings) _then) = _$DraftSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "time_per_pick") int timePerPick,@JsonKey(name: "pick_warning_seconds") int pickWarningSeconds,@JsonKey(name: "snake_draft") bool snakeDraft
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
@pragma('vm:prefer-inline') @override $Res call({Object? timePerPick = null,Object? pickWarningSeconds = null,Object? snakeDraft = null,}) {
  return _then(_self.copyWith(
timePerPick: null == timePerPick ? _self.timePerPick : timePerPick // ignore: cast_nullable_to_non_nullable
as int,pickWarningSeconds: null == pickWarningSeconds ? _self.pickWarningSeconds : pickWarningSeconds // ignore: cast_nullable_to_non_nullable
as int,snakeDraft: null == snakeDraft ? _self.snakeDraft : snakeDraft // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "time_per_pick")  int timePerPick, @JsonKey(name: "pick_warning_seconds")  int pickWarningSeconds, @JsonKey(name: "snake_draft")  bool snakeDraft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
return $default(_that.timePerPick,_that.pickWarningSeconds,_that.snakeDraft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "time_per_pick")  int timePerPick, @JsonKey(name: "pick_warning_seconds")  int pickWarningSeconds, @JsonKey(name: "snake_draft")  bool snakeDraft)  $default,) {final _that = this;
switch (_that) {
case _DraftSettings():
return $default(_that.timePerPick,_that.pickWarningSeconds,_that.snakeDraft);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "time_per_pick")  int timePerPick, @JsonKey(name: "pick_warning_seconds")  int pickWarningSeconds, @JsonKey(name: "snake_draft")  bool snakeDraft)?  $default,) {final _that = this;
switch (_that) {
case _DraftSettings() when $default != null:
return $default(_that.timePerPick,_that.pickWarningSeconds,_that.snakeDraft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftSettings implements DraftSettings {
  const _DraftSettings({@JsonKey(name: "time_per_pick") required this.timePerPick, @JsonKey(name: "pick_warning_seconds") required this.pickWarningSeconds, @JsonKey(name: "snake_draft") required this.snakeDraft});
  factory _DraftSettings.fromJson(Map<String, dynamic> json) => _$DraftSettingsFromJson(json);

@override@JsonKey(name: "time_per_pick") final  int timePerPick;
@override@JsonKey(name: "pick_warning_seconds") final  int pickWarningSeconds;
@override@JsonKey(name: "snake_draft") final  bool snakeDraft;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftSettings&&(identical(other.timePerPick, timePerPick) || other.timePerPick == timePerPick)&&(identical(other.pickWarningSeconds, pickWarningSeconds) || other.pickWarningSeconds == pickWarningSeconds)&&(identical(other.snakeDraft, snakeDraft) || other.snakeDraft == snakeDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timePerPick,pickWarningSeconds,snakeDraft);

@override
String toString() {
  return 'DraftSettings(timePerPick: $timePerPick, pickWarningSeconds: $pickWarningSeconds, snakeDraft: $snakeDraft)';
}


}

/// @nodoc
abstract mixin class _$DraftSettingsCopyWith<$Res> implements $DraftSettingsCopyWith<$Res> {
  factory _$DraftSettingsCopyWith(_DraftSettings value, $Res Function(_DraftSettings) _then) = __$DraftSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "time_per_pick") int timePerPick,@JsonKey(name: "pick_warning_seconds") int pickWarningSeconds,@JsonKey(name: "snake_draft") bool snakeDraft
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
@override @pragma('vm:prefer-inline') $Res call({Object? timePerPick = null,Object? pickWarningSeconds = null,Object? snakeDraft = null,}) {
  return _then(_DraftSettings(
timePerPick: null == timePerPick ? _self.timePerPick : timePerPick // ignore: cast_nullable_to_non_nullable
as int,pickWarningSeconds: null == pickWarningSeconds ? _self.pickWarningSeconds : pickWarningSeconds // ignore: cast_nullable_to_non_nullable
as int,snakeDraft: null == snakeDraft ? _self.snakeDraft : snakeDraft // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$League {

@JsonKey(name: "id") String get id;@JsonKey(name: "name") String get name;@JsonKey(name: "tournament_id") String get tournamentId;@JsonKey(name: "creator_id") String get creatorId;@JsonKey(name: "user_team_id", defaultValue: "") String get userTeamId;@LeagueStatusConverter()@JsonKey(name: "status") LeagueStatus get status;@JsonKey(name: "max_teams") int get maxTeams;@JsonKey(name: "join_code") String get joinCode;@JsonKey(name: "season_id") String get seasonId;@JsonKey(name: "latest_game") int get latestGame;@JsonKey(name: "teams") List<FantasyTeam> get teams;@JsonKey(name: "tournament_abbr") String? get tournamentAbbr;@JsonKey(name: "season_year") int get seasonYear;@JsonKey(name: "draft_settings") DraftSettings? get draftSettings;@JsonKey(name: "scoring_rules") List<LeagueScoringRule> get scoringRules;
/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueCopyWith<League> get copyWith => _$LeagueCopyWithImpl<League>(this as League, _$identity);

  /// Serializes this League to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is League&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.userTeamId, userTeamId) || other.userTeamId == userTeamId)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.joinCode, joinCode) || other.joinCode == joinCode)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.latestGame, latestGame) || other.latestGame == latestGame)&&const DeepCollectionEquality().equals(other.teams, teams)&&(identical(other.tournamentAbbr, tournamentAbbr) || other.tournamentAbbr == tournamentAbbr)&&(identical(other.seasonYear, seasonYear) || other.seasonYear == seasonYear)&&(identical(other.draftSettings, draftSettings) || other.draftSettings == draftSettings)&&const DeepCollectionEquality().equals(other.scoringRules, scoringRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tournamentId,creatorId,userTeamId,status,maxTeams,joinCode,seasonId,latestGame,const DeepCollectionEquality().hash(teams),tournamentAbbr,seasonYear,draftSettings,const DeepCollectionEquality().hash(scoringRules));

@override
String toString() {
  return 'League(id: $id, name: $name, tournamentId: $tournamentId, creatorId: $creatorId, userTeamId: $userTeamId, status: $status, maxTeams: $maxTeams, joinCode: $joinCode, seasonId: $seasonId, latestGame: $latestGame, teams: $teams, tournamentAbbr: $tournamentAbbr, seasonYear: $seasonYear, draftSettings: $draftSettings, scoringRules: $scoringRules)';
}


}

/// @nodoc
abstract mixin class $LeagueCopyWith<$Res>  {
  factory $LeagueCopyWith(League value, $Res Function(League) _then) = _$LeagueCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name,@JsonKey(name: "tournament_id") String tournamentId,@JsonKey(name: "creator_id") String creatorId,@JsonKey(name: "user_team_id", defaultValue: "") String userTeamId,@LeagueStatusConverter()@JsonKey(name: "status") LeagueStatus status,@JsonKey(name: "max_teams") int maxTeams,@JsonKey(name: "join_code") String joinCode,@JsonKey(name: "season_id") String seasonId,@JsonKey(name: "latest_game") int latestGame,@JsonKey(name: "teams") List<FantasyTeam> teams,@JsonKey(name: "tournament_abbr") String? tournamentAbbr,@JsonKey(name: "season_year") int seasonYear,@JsonKey(name: "draft_settings") DraftSettings? draftSettings,@JsonKey(name: "scoring_rules") List<LeagueScoringRule> scoringRules
});


$DraftSettingsCopyWith<$Res>? get draftSettings;

}
/// @nodoc
class _$LeagueCopyWithImpl<$Res>
    implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._self, this._then);

  final League _self;
  final $Res Function(League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tournamentId = null,Object? creatorId = null,Object? userTeamId = null,Object? status = null,Object? maxTeams = null,Object? joinCode = null,Object? seasonId = null,Object? latestGame = null,Object? teams = null,Object? tournamentAbbr = freezed,Object? seasonYear = null,Object? draftSettings = freezed,Object? scoringRules = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,userTeamId: null == userTeamId ? _self.userTeamId : userTeamId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeagueStatus,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,joinCode: null == joinCode ? _self.joinCode : joinCode // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,latestGame: null == latestGame ? _self.latestGame : latestGame // ignore: cast_nullable_to_non_nullable
as int,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<FantasyTeam>,tournamentAbbr: freezed == tournamentAbbr ? _self.tournamentAbbr : tournamentAbbr // ignore: cast_nullable_to_non_nullable
as String?,seasonYear: null == seasonYear ? _self.seasonYear : seasonYear // ignore: cast_nullable_to_non_nullable
as int,draftSettings: freezed == draftSettings ? _self.draftSettings : draftSettings // ignore: cast_nullable_to_non_nullable
as DraftSettings?,scoringRules: null == scoringRules ? _self.scoringRules : scoringRules // ignore: cast_nullable_to_non_nullable
as List<LeagueScoringRule>,
  ));
}
/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftSettingsCopyWith<$Res>? get draftSettings {
    if (_self.draftSettings == null) {
    return null;
  }

  return $DraftSettingsCopyWith<$Res>(_self.draftSettings!, (value) {
    return _then(_self.copyWith(draftSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [League].
extension LeaguePatterns on League {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _League value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _League value)  $default,){
final _that = this;
switch (_that) {
case _League():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _League value)?  $default,){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "tournament_id")  String tournamentId, @JsonKey(name: "creator_id")  String creatorId, @JsonKey(name: "user_team_id", defaultValue: "")  String userTeamId, @LeagueStatusConverter()@JsonKey(name: "status")  LeagueStatus status, @JsonKey(name: "max_teams")  int maxTeams, @JsonKey(name: "join_code")  String joinCode, @JsonKey(name: "season_id")  String seasonId, @JsonKey(name: "latest_game")  int latestGame, @JsonKey(name: "teams")  List<FantasyTeam> teams, @JsonKey(name: "tournament_abbr")  String? tournamentAbbr, @JsonKey(name: "season_year")  int seasonYear, @JsonKey(name: "draft_settings")  DraftSettings? draftSettings, @JsonKey(name: "scoring_rules")  List<LeagueScoringRule> scoringRules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.userTeamId,_that.status,_that.maxTeams,_that.joinCode,_that.seasonId,_that.latestGame,_that.teams,_that.tournamentAbbr,_that.seasonYear,_that.draftSettings,_that.scoringRules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "tournament_id")  String tournamentId, @JsonKey(name: "creator_id")  String creatorId, @JsonKey(name: "user_team_id", defaultValue: "")  String userTeamId, @LeagueStatusConverter()@JsonKey(name: "status")  LeagueStatus status, @JsonKey(name: "max_teams")  int maxTeams, @JsonKey(name: "join_code")  String joinCode, @JsonKey(name: "season_id")  String seasonId, @JsonKey(name: "latest_game")  int latestGame, @JsonKey(name: "teams")  List<FantasyTeam> teams, @JsonKey(name: "tournament_abbr")  String? tournamentAbbr, @JsonKey(name: "season_year")  int seasonYear, @JsonKey(name: "draft_settings")  DraftSettings? draftSettings, @JsonKey(name: "scoring_rules")  List<LeagueScoringRule> scoringRules)  $default,) {final _that = this;
switch (_that) {
case _League():
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.userTeamId,_that.status,_that.maxTeams,_that.joinCode,_that.seasonId,_that.latestGame,_that.teams,_that.tournamentAbbr,_that.seasonYear,_that.draftSettings,_that.scoringRules);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "name")  String name, @JsonKey(name: "tournament_id")  String tournamentId, @JsonKey(name: "creator_id")  String creatorId, @JsonKey(name: "user_team_id", defaultValue: "")  String userTeamId, @LeagueStatusConverter()@JsonKey(name: "status")  LeagueStatus status, @JsonKey(name: "max_teams")  int maxTeams, @JsonKey(name: "join_code")  String joinCode, @JsonKey(name: "season_id")  String seasonId, @JsonKey(name: "latest_game")  int latestGame, @JsonKey(name: "teams")  List<FantasyTeam> teams, @JsonKey(name: "tournament_abbr")  String? tournamentAbbr, @JsonKey(name: "season_year")  int seasonYear, @JsonKey(name: "draft_settings")  DraftSettings? draftSettings, @JsonKey(name: "scoring_rules")  List<LeagueScoringRule> scoringRules)?  $default,) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.tournamentId,_that.creatorId,_that.userTeamId,_that.status,_that.maxTeams,_that.joinCode,_that.seasonId,_that.latestGame,_that.teams,_that.tournamentAbbr,_that.seasonYear,_that.draftSettings,_that.scoringRules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _League implements League {
  const _League({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "tournament_id") required this.tournamentId, @JsonKey(name: "creator_id") required this.creatorId, @JsonKey(name: "user_team_id", defaultValue: "") this.userTeamId = "", @LeagueStatusConverter()@JsonKey(name: "status") required this.status, @JsonKey(name: "max_teams") required this.maxTeams, @JsonKey(name: "join_code") required this.joinCode, @JsonKey(name: "season_id") required this.seasonId, @JsonKey(name: "latest_game") this.latestGame = 0, @JsonKey(name: "teams") required final  List<FantasyTeam> teams, @JsonKey(name: "tournament_abbr") required this.tournamentAbbr, @JsonKey(name: "season_year") required this.seasonYear, @JsonKey(name: "draft_settings") this.draftSettings, @JsonKey(name: "scoring_rules") final  List<LeagueScoringRule> scoringRules = const []}): _teams = teams,_scoringRules = scoringRules;
  factory _League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "tournament_id") final  String tournamentId;
@override@JsonKey(name: "creator_id") final  String creatorId;
@override@JsonKey(name: "user_team_id", defaultValue: "") final  String userTeamId;
@override@LeagueStatusConverter()@JsonKey(name: "status") final  LeagueStatus status;
@override@JsonKey(name: "max_teams") final  int maxTeams;
@override@JsonKey(name: "join_code") final  String joinCode;
@override@JsonKey(name: "season_id") final  String seasonId;
@override@JsonKey(name: "latest_game") final  int latestGame;
 final  List<FantasyTeam> _teams;
@override@JsonKey(name: "teams") List<FantasyTeam> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

@override@JsonKey(name: "tournament_abbr") final  String? tournamentAbbr;
@override@JsonKey(name: "season_year") final  int seasonYear;
@override@JsonKey(name: "draft_settings") final  DraftSettings? draftSettings;
 final  List<LeagueScoringRule> _scoringRules;
@override@JsonKey(name: "scoring_rules") List<LeagueScoringRule> get scoringRules {
  if (_scoringRules is EqualUnmodifiableListView) return _scoringRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scoringRules);
}


/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueCopyWith<_League> get copyWith => __$LeagueCopyWithImpl<_League>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _League&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.userTeamId, userTeamId) || other.userTeamId == userTeamId)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.joinCode, joinCode) || other.joinCode == joinCode)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.latestGame, latestGame) || other.latestGame == latestGame)&&const DeepCollectionEquality().equals(other._teams, _teams)&&(identical(other.tournamentAbbr, tournamentAbbr) || other.tournamentAbbr == tournamentAbbr)&&(identical(other.seasonYear, seasonYear) || other.seasonYear == seasonYear)&&(identical(other.draftSettings, draftSettings) || other.draftSettings == draftSettings)&&const DeepCollectionEquality().equals(other._scoringRules, _scoringRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tournamentId,creatorId,userTeamId,status,maxTeams,joinCode,seasonId,latestGame,const DeepCollectionEquality().hash(_teams),tournamentAbbr,seasonYear,draftSettings,const DeepCollectionEquality().hash(_scoringRules));

@override
String toString() {
  return 'League(id: $id, name: $name, tournamentId: $tournamentId, creatorId: $creatorId, userTeamId: $userTeamId, status: $status, maxTeams: $maxTeams, joinCode: $joinCode, seasonId: $seasonId, latestGame: $latestGame, teams: $teams, tournamentAbbr: $tournamentAbbr, seasonYear: $seasonYear, draftSettings: $draftSettings, scoringRules: $scoringRules)';
}


}

/// @nodoc
abstract mixin class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) _then) = __$LeagueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "name") String name,@JsonKey(name: "tournament_id") String tournamentId,@JsonKey(name: "creator_id") String creatorId,@JsonKey(name: "user_team_id", defaultValue: "") String userTeamId,@LeagueStatusConverter()@JsonKey(name: "status") LeagueStatus status,@JsonKey(name: "max_teams") int maxTeams,@JsonKey(name: "join_code") String joinCode,@JsonKey(name: "season_id") String seasonId,@JsonKey(name: "latest_game") int latestGame,@JsonKey(name: "teams") List<FantasyTeam> teams,@JsonKey(name: "tournament_abbr") String? tournamentAbbr,@JsonKey(name: "season_year") int seasonYear,@JsonKey(name: "draft_settings") DraftSettings? draftSettings,@JsonKey(name: "scoring_rules") List<LeagueScoringRule> scoringRules
});


@override $DraftSettingsCopyWith<$Res>? get draftSettings;

}
/// @nodoc
class __$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(this._self, this._then);

  final _League _self;
  final $Res Function(_League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tournamentId = null,Object? creatorId = null,Object? userTeamId = null,Object? status = null,Object? maxTeams = null,Object? joinCode = null,Object? seasonId = null,Object? latestGame = null,Object? teams = null,Object? tournamentAbbr = freezed,Object? seasonYear = null,Object? draftSettings = freezed,Object? scoringRules = null,}) {
  return _then(_League(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,userTeamId: null == userTeamId ? _self.userTeamId : userTeamId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeagueStatus,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,joinCode: null == joinCode ? _self.joinCode : joinCode // ignore: cast_nullable_to_non_nullable
as String,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,latestGame: null == latestGame ? _self.latestGame : latestGame // ignore: cast_nullable_to_non_nullable
as int,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<FantasyTeam>,tournamentAbbr: freezed == tournamentAbbr ? _self.tournamentAbbr : tournamentAbbr // ignore: cast_nullable_to_non_nullable
as String?,seasonYear: null == seasonYear ? _self.seasonYear : seasonYear // ignore: cast_nullable_to_non_nullable
as int,draftSettings: freezed == draftSettings ? _self.draftSettings : draftSettings // ignore: cast_nullable_to_non_nullable
as DraftSettings?,scoringRules: null == scoringRules ? _self._scoringRules : scoringRules // ignore: cast_nullable_to_non_nullable
as List<LeagueScoringRule>,
  ));
}

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftSettingsCopyWith<$Res>? get draftSettings {
    if (_self.draftSettings == null) {
    return null;
  }

  return $DraftSettingsCopyWith<$Res>(_self.draftSettings!, (value) {
    return _then(_self.copyWith(draftSettings: value));
  });
}
}

// dart format on
