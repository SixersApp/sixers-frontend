import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_instance_model.freezed.dart';
part 'fantasy_team_instance_model.g.dart';

@freezed
sealed class FantasyTeamInstance with _$FantasyTeamInstance {
  const factory FantasyTeamInstance({
    required String id,
    required String fantasyTeamId,
    required int matchNum,
    required bool isLocked,

    // You can keep players as raw fields for now
    String? bat1,
    String? bat2,
    String? bat3,
    String? bat4,
    String? bowl1,
    String? bowl2,
    String? bowl3,
    String? bowl4,
    String? all1,
    String? all2,
    String? all3,
    String? wicket1,
    String? wicket2,
    String? bench1,
    String? bench2,
    String? bench3,
    String? bench4,
    String? bench5,
    String? bench6,
    String? bench7,
    String? bench8,
    String? flex1,
    String? flex2,
    String? flex3,
    String? flex4,

    required DateTime createdAt,
  }) = _FantasyTeamInstance;

  factory FantasyTeamInstance.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamInstanceFromJson(json);
}