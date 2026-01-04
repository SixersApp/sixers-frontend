// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedGroupModel _$FeedGroupModelFromJson(Map<String, dynamic> json) =>
    _FeedGroupModel(
      tournamentId: json['tournament_id'] as String,
      tournamentName: json['tournament_name'] as String,
      matches: (json['matches'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      abbreviation: json['abbreviation'] as String,
    );

Map<String, dynamic> _$FeedGroupModelToJson(_FeedGroupModel instance) =>
    <String, dynamic>{
      'tournament_id': instance.tournamentId,
      'tournament_name': instance.tournamentName,
      'matches': instance.matches,
      'abbreviation': instance.abbreviation,
    };
