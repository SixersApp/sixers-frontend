import 'package:freezed_annotation/freezed_annotation.dart';

part 'fantasy_team_instance_model.freezed.dart';
part 'fantasy_team_instance_model.g.dart';

@freezed
sealed class RosterPlayerData with _$RosterPlayerData {
  const factory RosterPlayerData({
    required String id,
    @JsonKey(name: 'player_name') required String playerName,
    @JsonKey(name: 'full_name') required String fullName,
    required String image,
    required String role,
    @JsonKey(name: 'country_name') required String countryName,
    @JsonKey(name: 'country_image') required String countryImage,
  }) = _RosterPlayerData;

  factory RosterPlayerData.fromJson(Map<String, dynamic> json) => _$RosterPlayerDataFromJson(json);
}

@freezed
sealed class RosterPlayers with _$RosterPlayers {
  const factory RosterPlayers({
    RosterPlayerData? bat1,
    RosterPlayerData? bat2,
    RosterPlayerData? bat3,
    RosterPlayerData? bat4,
    RosterPlayerData? bowl1,
    RosterPlayerData? bowl2,
    RosterPlayerData? bowl3,
    RosterPlayerData? bowl4,
    RosterPlayerData? all1,
    RosterPlayerData? all2,
    RosterPlayerData? all3,
    RosterPlayerData? wicket1,
    RosterPlayerData? wicket2,
    RosterPlayerData? bench1,
    RosterPlayerData? bench2,
    RosterPlayerData? bench3,
    RosterPlayerData? bench4,
    RosterPlayerData? bench5,
    RosterPlayerData? bench6,
    RosterPlayerData? bench7,
    RosterPlayerData? bench8,
    RosterPlayerData? flex1,
    RosterPlayerData? flex2,
    RosterPlayerData? flex3,
    RosterPlayerData? flex4,
  }) = _RosterPlayers;

  factory RosterPlayers.fromJson(Map<String, dynamic> json) => _$RosterPlayersFromJson(json);
}

@freezed
sealed class FantasyTeamInstance with _$FantasyTeamInstance {
  const factory FantasyTeamInstance({
    required String id,
    required String fantasy_team_id,
    required int match_num,
    required bool is_locked,
    String? captain,
    String? vice_captain,
    RosterPlayers? players,
  }) = _FantasyTeamInstance;

  factory FantasyTeamInstance.fromJson(Map<String, dynamic> json) => _$FantasyTeamInstanceFromJson(json);
}
