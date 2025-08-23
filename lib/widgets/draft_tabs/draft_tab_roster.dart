import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/backend/real_team/real_team_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/widgets/draft_widgets/draft_tab_draft_widgets/player_draft_tile.dart';

/// Roster tab: list of MY team's draft picks (ordered by pickNumber).
class DraftTabRoster extends ConsumerWidget {
  const DraftTabRoster({
    super.key,
    required this.myTeamId,
    required this.allPicks,      // List<DraftPick>
    required this.playersById,   // Map<String, Player>
    required this.tournamentId,
  });

  final String myTeamId;
  final List<DraftPick> allPicks;
  final Map<String, Player> playersById;
  final String tournamentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;

    // Load real teams for this tournament
    final realTeamsA = ref.watch(realTeamsProvider(tournamentId: tournamentId));

    // Build a lookup map id -> team name
    final Map<String, String> teamNameById = realTeamsA.maybeWhen(
      data: (teams) => {for (final t in teams) t.id: t.name},
      orElse: () => const {},
    );

    // Filter to my team's picks and keep draft order
    final myPicks = allPicks
        .where((p) => p.teamId == myTeamId)
        .toList()
      ..sort((a, b) => a.pickNumber.compareTo(b.pickNumber));

    if (myPicks.isEmpty) {
      return const Center(child: Text('No picks yet.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title like the mock ("Your Roster")
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
          child: Text(
            'Your Roster',
            style: text.titleLarge?.copyWith(color: AppColors.black700),
          ),
        ),

        // Header row ("Rank"  |  "Stats")
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Rank',
                  style: text.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Stats',
                    style: text.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // List of my picks
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            itemCount: myPicks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final pick = myPicks[i];
              final player = playersById[pick.playerId];
              if (player == null) return const SizedBox.shrink();

              final realTeamName = teamNameById[player.realTeamId] ?? '—';

              // Role-aware stat labels to match the mock
              final isBowler = player.role == 'Bowler';
              final stat1Label = isBowler ? 'Econ' : 'Avg';
              final stat2Label = isBowler ? 'Wkts' : 'SR';

              return PlayerDraftTile(
                // Show the player's overall rank on the left (like the mock)
                rank: (i + 1),
                playerName: player.name,
                realTeamName: realTeamName,
                role: player.role ?? 'Batsman',
                stat1Label: stat1Label,
                stat1Value: '—', // plug real values when available
                stat2Label: stat2Label,
                stat2Value: '—',
                enabled: false,  // roster view shouldn't allow adding
                onAdd: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
