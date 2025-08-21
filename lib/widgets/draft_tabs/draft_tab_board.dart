import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'package:sixers/widgets/draft_widgets/draft_tab_board_widgets/board_grid.dart';

class DraftTabBoard extends ConsumerWidget {
  const DraftTabBoard({
    super.key,
    required this.leagueId,
    required this.tournamentId,
  });

  final String leagueId;
  final String tournamentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // All three watch → rebuild live as data changes.
    final teamsA = ref.watch(fantasyTeamsProvider(leagueId: leagueId));
    final picksA = ref.watch(draftPicksProvider(leagueId));
    final playersA = ref.watch(allPlayersProvider(tournamentId));

    final teams = teamsA.requireValue.toList()
      ..sort((a, b) => (a.draftOrder ?? 0).compareTo(b.draftOrder ?? 0));
    final picks = picksA.requireValue;
    final players = playersA.requireValue;
    final playersById = {for (final p in players) p.id: p};

    final teamCount = teams.isEmpty ? 1 : teams.length;
    final rounds = picks.isEmpty
        ? 1
        : ((picks.length + teamCount - 1) ~/ teamCount);

    return BoardGrid(
      teams: teams,
      picks: picks,
      playersById: playersById,
      teamCount: teamCount,
      rounds: rounds,
    );
  }
}
