import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
sealed class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    required Tournament tournaments,
    required RealTeam real_teams,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
sealed class Tournament with _$Tournament {
  const factory Tournament({required String id, required String name}) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(json);
}

@freezed
sealed class RealTeam with _$RealTeam {
  const factory RealTeam({required String id, required String name}) = _RealTeam;

  factory RealTeam.fromJson(Map<String, dynamic> json) => _$RealTeamFromJson(json);
}
