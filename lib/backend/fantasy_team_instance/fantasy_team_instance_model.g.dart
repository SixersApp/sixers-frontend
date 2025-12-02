// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_instance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FantasyTeamInstance _$FantasyTeamInstanceFromJson(Map<String, dynamic> json) =>
    _FantasyTeamInstance(
      id: json['id'] as String,
      fantasyTeamId: json['fantasyTeamId'] as String,
      matchNum: (json['matchNum'] as num).toInt(),
      isLocked: json['isLocked'] as bool,
      bat1: json['bat1'] as String?,
      bat2: json['bat2'] as String?,
      bat3: json['bat3'] as String?,
      bat4: json['bat4'] as String?,
      bowl1: json['bowl1'] as String?,
      bowl2: json['bowl2'] as String?,
      bowl3: json['bowl3'] as String?,
      bowl4: json['bowl4'] as String?,
      all1: json['all1'] as String?,
      all2: json['all2'] as String?,
      all3: json['all3'] as String?,
      wicket1: json['wicket1'] as String?,
      wicket2: json['wicket2'] as String?,
      bench1: json['bench1'] as String?,
      bench2: json['bench2'] as String?,
      bench3: json['bench3'] as String?,
      bench4: json['bench4'] as String?,
      bench5: json['bench5'] as String?,
      bench6: json['bench6'] as String?,
      bench7: json['bench7'] as String?,
      bench8: json['bench8'] as String?,
      flex1: json['flex1'] as String?,
      flex2: json['flex2'] as String?,
      flex3: json['flex3'] as String?,
      flex4: json['flex4'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FantasyTeamInstanceToJson(
  _FantasyTeamInstance instance,
) => <String, dynamic>{
  'id': instance.id,
  'fantasyTeamId': instance.fantasyTeamId,
  'matchNum': instance.matchNum,
  'isLocked': instance.isLocked,
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
  'createdAt': instance.createdAt.toIso8601String(),
};
