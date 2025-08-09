import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
sealed class Player with _$Player {
  const factory Player({
    required String id,
    required String name,

    /// One of: 'Batsman', 'Bowler', 'All-Rounder', 'Wicket-Keeper'
    @JsonKey(name: 'role') required String role,

    /// FK -> tournaments.id
    @JsonKey(name: 'tournament_id') required String tournamentId,

    /// FK -> real_teams.id
    @JsonKey(name: 'real_team_id') required String realTeamId,

    /// Server-generated timestamp (NOT NULL DEFAULT now())
    @JsonKey(name: 'created_at') required DateTime createdAt,

    /// Nullable FK -> profiles.user_id (when a player is tied to a user)
    @JsonKey(name: 'user_id') String? userId,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

/// UI filter enum you already use elsewhere
enum PositionFilter { all, batsman, bowler, wicketKeeper, allRounder }
