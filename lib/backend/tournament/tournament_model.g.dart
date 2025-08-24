// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
  id: json['id'] as String,
  name: json['name'] as String,
  season: (json['season'] as num).toInt(),
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  numMatches: (json['num_matches'] as num).toInt(),
);

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'season': instance.season,
      'start_date': instance.startDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'num_matches': instance.numMatches,
    };
