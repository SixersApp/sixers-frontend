// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_instance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RosterPlayerData _$RosterPlayerDataFromJson(Map<String, dynamic> json) =>
    _RosterPlayerData(
      id: json['id'] as String,
      playerName: json['player_name'] as String,
      fullName: json['full_name'] as String,
      image: json['image'] as String,
      role: json['role'] as String,
      countryName: json['country_name'] as String,
      countryImage: json['country_image'] as String,
    );

Map<String, dynamic> _$RosterPlayerDataToJson(_RosterPlayerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player_name': instance.playerName,
      'full_name': instance.fullName,
      'image': instance.image,
      'role': instance.role,
      'country_name': instance.countryName,
      'country_image': instance.countryImage,
    };

_RosterPlayers _$RosterPlayersFromJson(Map<String, dynamic> json) =>
    _RosterPlayers(
      bat1: json['bat1'] == null
          ? null
          : RosterPlayerData.fromJson(json['bat1'] as Map<String, dynamic>),
      bat2: json['bat2'] == null
          ? null
          : RosterPlayerData.fromJson(json['bat2'] as Map<String, dynamic>),
      bat3: json['bat3'] == null
          ? null
          : RosterPlayerData.fromJson(json['bat3'] as Map<String, dynamic>),
      bat4: json['bat4'] == null
          ? null
          : RosterPlayerData.fromJson(json['bat4'] as Map<String, dynamic>),
      bowl1: json['bowl1'] == null
          ? null
          : RosterPlayerData.fromJson(json['bowl1'] as Map<String, dynamic>),
      bowl2: json['bowl2'] == null
          ? null
          : RosterPlayerData.fromJson(json['bowl2'] as Map<String, dynamic>),
      bowl3: json['bowl3'] == null
          ? null
          : RosterPlayerData.fromJson(json['bowl3'] as Map<String, dynamic>),
      bowl4: json['bowl4'] == null
          ? null
          : RosterPlayerData.fromJson(json['bowl4'] as Map<String, dynamic>),
      all1: json['all1'] == null
          ? null
          : RosterPlayerData.fromJson(json['all1'] as Map<String, dynamic>),
      all2: json['all2'] == null
          ? null
          : RosterPlayerData.fromJson(json['all2'] as Map<String, dynamic>),
      all3: json['all3'] == null
          ? null
          : RosterPlayerData.fromJson(json['all3'] as Map<String, dynamic>),
      wicket1: json['wicket1'] == null
          ? null
          : RosterPlayerData.fromJson(json['wicket1'] as Map<String, dynamic>),
      wicket2: json['wicket2'] == null
          ? null
          : RosterPlayerData.fromJson(json['wicket2'] as Map<String, dynamic>),
      bench1: json['bench1'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench1'] as Map<String, dynamic>),
      bench2: json['bench2'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench2'] as Map<String, dynamic>),
      bench3: json['bench3'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench3'] as Map<String, dynamic>),
      bench4: json['bench4'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench4'] as Map<String, dynamic>),
      bench5: json['bench5'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench5'] as Map<String, dynamic>),
      bench6: json['bench6'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench6'] as Map<String, dynamic>),
      bench7: json['bench7'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench7'] as Map<String, dynamic>),
      bench8: json['bench8'] == null
          ? null
          : RosterPlayerData.fromJson(json['bench8'] as Map<String, dynamic>),
      flex1: json['flex1'] == null
          ? null
          : RosterPlayerData.fromJson(json['flex1'] as Map<String, dynamic>),
      flex2: json['flex2'] == null
          ? null
          : RosterPlayerData.fromJson(json['flex2'] as Map<String, dynamic>),
      flex3: json['flex3'] == null
          ? null
          : RosterPlayerData.fromJson(json['flex3'] as Map<String, dynamic>),
      flex4: json['flex4'] == null
          ? null
          : RosterPlayerData.fromJson(json['flex4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RosterPlayersToJson(_RosterPlayers instance) =>
    <String, dynamic>{
      'bat1': instance.bat1,
      'bat2': instance.bat2,
      'bat3': instance.bat3,
      'bat4': instance.bat4,
      'bowl1': instance.bowl1,
      'bowl2': instance.bowl2,
      'bowl3': instance.bowl3,
      'bowl4': instance.bowl4,
      'all1': instance.all1,
      'all2': instance.all2,
      'all3': instance.all3,
      'wicket1': instance.wicket1,
      'wicket2': instance.wicket2,
      'bench1': instance.bench1,
      'bench2': instance.bench2,
      'bench3': instance.bench3,
      'bench4': instance.bench4,
      'bench5': instance.bench5,
      'bench6': instance.bench6,
      'bench7': instance.bench7,
      'bench8': instance.bench8,
      'flex1': instance.flex1,
      'flex2': instance.flex2,
      'flex3': instance.flex3,
      'flex4': instance.flex4,
    };

_FantasyTeamInstance _$FantasyTeamInstanceFromJson(Map<String, dynamic> json) =>
    _FantasyTeamInstance(
      id: json['id'] as String,
      fantasy_team_id: json['fantasy_team_id'] as String,
      match_num: (json['match_num'] as num).toInt(),
      is_locked: json['is_locked'] as bool,
      captain: json['captain'] as String?,
      vice_captain: json['vice_captain'] as String?,
      players: json['players'] == null
          ? null
          : RosterPlayers.fromJson(json['players'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FantasyTeamInstanceToJson(
  _FantasyTeamInstance instance,
) => <String, dynamic>{
  'id': instance.id,
  'fantasy_team_id': instance.fantasy_team_id,
  'match_num': instance.match_num,
  'is_locked': instance.is_locked,
  'captain': instance.captain,
  'vice_captain': instance.vice_captain,
  'players': instance.players,
};
