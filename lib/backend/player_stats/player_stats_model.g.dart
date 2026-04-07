// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatEntry _$StatEntryFromJson(Map<String, dynamic> json) => _StatEntry(
  value: _toDouble(json['value']),
  percentile: _toDouble(json['percentile']),
);

Map<String, dynamic> _$StatEntryToJson(_StatEntry instance) =>
    <String, dynamic>{
      'value': instance.value,
      'percentile': instance.percentile,
    };

_BattingStats _$BattingStatsFromJson(Map<String, dynamic> json) =>
    _BattingStats(
      matchesBatted: json['matchesBatted'] == null
          ? null
          : StatEntry.fromJson(json['matchesBatted'] as Map<String, dynamic>),
      totalRuns: json['totalRuns'] == null
          ? null
          : StatEntry.fromJson(json['totalRuns'] as Map<String, dynamic>),
      halfCenturies: json['halfCenturies'] == null
          ? null
          : StatEntry.fromJson(json['halfCenturies'] as Map<String, dynamic>),
      centuries: json['centuries'] == null
          ? null
          : StatEntry.fromJson(json['centuries'] as Map<String, dynamic>),
      strikeRate: json['strikeRate'] == null
          ? null
          : StatEntry.fromJson(json['strikeRate'] as Map<String, dynamic>),
      battingAverage: json['battingAverage'] == null
          ? null
          : StatEntry.fromJson(json['battingAverage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BattingStatsToJson(_BattingStats instance) =>
    <String, dynamic>{
      'matchesBatted': instance.matchesBatted,
      'totalRuns': instance.totalRuns,
      'halfCenturies': instance.halfCenturies,
      'centuries': instance.centuries,
      'strikeRate': instance.strikeRate,
      'battingAverage': instance.battingAverage,
    };

_BowlingStats _$BowlingStatsFromJson(Map<String, dynamic> json) =>
    _BowlingStats(
      matchesBowled: json['matchesBowled'] == null
          ? null
          : StatEntry.fromJson(json['matchesBowled'] as Map<String, dynamic>),
      totalWickets: json['totalWickets'] == null
          ? null
          : StatEntry.fromJson(json['totalWickets'] as Map<String, dynamic>),
      threeWicketHauls: json['threeWicketHauls'] == null
          ? null
          : StatEntry.fromJson(
              json['threeWicketHauls'] as Map<String, dynamic>,
            ),
      fiveWicketHauls: json['fiveWicketHauls'] == null
          ? null
          : StatEntry.fromJson(json['fiveWicketHauls'] as Map<String, dynamic>),
      bowlingAverage: json['bowlingAverage'] == null
          ? null
          : StatEntry.fromJson(json['bowlingAverage'] as Map<String, dynamic>),
      bowlingEconomy: json['bowlingEconomy'] == null
          ? null
          : StatEntry.fromJson(json['bowlingEconomy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BowlingStatsToJson(_BowlingStats instance) =>
    <String, dynamic>{
      'matchesBowled': instance.matchesBowled,
      'totalWickets': instance.totalWickets,
      'threeWicketHauls': instance.threeWicketHauls,
      'fiveWicketHauls': instance.fiveWicketHauls,
      'bowlingAverage': instance.bowlingAverage,
      'bowlingEconomy': instance.bowlingEconomy,
    };

_SeasonStats _$SeasonStatsFromJson(Map<String, dynamic> json) => _SeasonStats(
  seasonId: json['seasonId'] as String,
  endYear: (json['endYear'] as num).toInt(),
  tournamentName: json['tournamentName'] as String?,
  tournamentAbbreviation: json['tournamentAbbreviation'] as String?,
  teamName: json['teamName'] as String? ?? '',
  teamImage: json['teamImage'] as String?,
  teamAbbreviation: json['teamAbbreviation'] as String?,
  role: json['role'] as String? ?? '',
  batting: json['batting'] == null
      ? null
      : BattingStats.fromJson(json['batting'] as Map<String, dynamic>),
  bowling: json['bowling'] == null
      ? null
      : BowlingStats.fromJson(json['bowling'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SeasonStatsToJson(_SeasonStats instance) =>
    <String, dynamic>{
      'seasonId': instance.seasonId,
      'endYear': instance.endYear,
      'tournamentName': instance.tournamentName,
      'tournamentAbbreviation': instance.tournamentAbbreviation,
      'teamName': instance.teamName,
      'teamImage': instance.teamImage,
      'teamAbbreviation': instance.teamAbbreviation,
      'role': instance.role,
      'batting': instance.batting,
      'bowling': instance.bowling,
    };

_PlayerStats _$PlayerStatsFromJson(Map<String, dynamic> json) => _PlayerStats(
  playerId: json['playerId'] as String?,
  name: json['name'] as String? ?? '',
  image: json['image'] as String? ?? '',
  seasons:
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeasonStats.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PlayerStatsToJson(_PlayerStats instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'name': instance.name,
      'image': instance.image,
      'seasons': instance.seasons,
    };
