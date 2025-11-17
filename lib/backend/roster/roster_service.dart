import 'package:collection/collection.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/matchup/matchup_model.dart';
import 'package:sixers/backend/players/player_model.dart';

class TeamRoster {
  TeamRoster({
    required this.team,
    required this.batting,
    required this.bowling,
    required this.allRounders,
    required this.isEditable,
  });

  final FantasyTeam team;
  final List<RosterPlayer> batting;
  final List<RosterPlayer> bowling;
  final List<RosterPlayer> allRounders;
  final bool isEditable;

  bool get isEmpty => batting.isEmpty && bowling.isEmpty && allRounders.isEmpty;
}

class RosterPlayer {
  const RosterPlayer({
    required this.id,
    required this.name,
    required this.role,
    required this.realTeamName,
    this.matchDetails,
    this.score,
    this.points,
    this.basePoints,
    this.isCaptain = false,
    this.isViceCaptain = false,
    this.hasInjury = false,
  });

  final String id;
  final String name;
  final String role;
  final String realTeamName;
  final String? matchDetails;
  final String? score;
  final double? points;
  final double? basePoints;
  final bool isCaptain;
  final bool isViceCaptain;
  final bool hasInjury;
}

class TeamContentData {
  TeamContentData({required this.teams, required this.rosterByTeamId, required this.userTeamId, required this.matchups});

  final List<FantasyTeam> teams;
  final Map<String, TeamRoster> rosterByTeamId;
  final String? userTeamId;
  final List<Matchup> matchups;
}

class RosterService {
  TeamContentData buildTeamContentData({
    required List<FantasyTeam> teams,
    required List<DraftPick> picks,
    required List<Player> players,
    required Map<String, String> realTeamNameById,
    required String? currentUserId,
    required List<Matchup> matchups,
  }) {
    final playersById = {for (final p in players) p.id: p};
    final rosterByTeamId = _buildRosters(
      teams: teams,
      picks: picks,
      playersById: playersById,
      realTeamNameById: realTeamNameById,
      currentUserId: currentUserId,
    );

    final userTeamId = teams.firstWhereOrNull((team) => team.userId == currentUserId)?.id;

    final sortedTeams = [...teams]..sort((a, b) => a.teamName.compareTo(b.teamName));
    final sortedMatchups = [...matchups]..sort((a, b) => a.matchNum.compareTo(b.matchNum));

    return TeamContentData(teams: sortedTeams, rosterByTeamId: rosterByTeamId, userTeamId: userTeamId, matchups: sortedMatchups);
  }

  Map<String, TeamRoster> _buildRosters({
    required List<FantasyTeam> teams,
    required List<DraftPick> picks,
    required Map<String, Player> playersById,
    required Map<String, String> realTeamNameById,
    required String? currentUserId,
  }) {
    final picksByTeam = picks.sortedBy((p) => p.pickNumber).groupListsBy((p) => p.teamId);
    final rosterByTeamId = <String, TeamRoster>{};

    for (final team in teams) {
      final teamPicks = picksByTeam[team.id] ?? const <DraftPick>[];
      final batting = <RosterPlayer>[];
      final bowling = <RosterPlayer>[];
      final allRounders = <RosterPlayer>[];

      for (final pick in teamPicks) {
        final player = playersById[pick.playerId];
        if (player == null) continue;

        final rosterPlayer = RosterPlayer(
          id: player.id,
          name: player.name,
          role: player.role,
          realTeamName: realTeamNameById[player.realTeamId] ?? '—',
        );

        switch (player.role.toLowerCase()) {
          case 'bowler':
            bowling.add(rosterPlayer);
            break;
          case 'all-rounder':
            allRounders.add(rosterPlayer);
            break;
          default:
            batting.add(rosterPlayer);
            break;
        }
      }

      rosterByTeamId[team.id] = TeamRoster(
        team: team,
        batting: batting,
        bowling: bowling,
        allRounders: allRounders,
        isEditable: currentUserId != null && team.userId == currentUserId,
      );
    }

    return rosterByTeamId;
  }
}
