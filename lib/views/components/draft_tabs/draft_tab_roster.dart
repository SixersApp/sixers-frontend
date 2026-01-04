import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/backend/real_team/real_team_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/draft_widgets/draft_tab_draft_widgets/player_draft_tile.dart';

class DraftTabRoster extends ConsumerWidget {
  const DraftTabRoster({
    super.key,
    required this.myTeamId,
    required this.allPicks,
    required this.playersById,
    required this.tournamentId,
  });

  final String myTeamId;
  final List<DraftPick> allPicks;
  final Map<String, Player> playersById;
  final String tournamentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;

    final realTeamsA = ref.watch(realTeamsProvider(tournamentId: tournamentId));

    final Map<String, String> teamNameById = realTeamsA.maybeWhen(
      data: (teams) => {for (final t in teams) t.id: t.name},
      orElse: () => const {},
    );

    final myPicks = allPicks.where((p) => p.teamId == myTeamId).toList()..sort((a, b) => a.pickNumber.compareTo(b.pickNumber));

    if (myPicks.isEmpty) {
      return const Center(child: Text('No picks yet.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title like the mock ("Your Roster")
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
          child: Text('Your Roster', style: text.titleLarge?.copyWith(color: AppColors.black700)),
        ),

        // Header row ("Rank"  |  "Stats")
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Text('Rank', style: text.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Stats', style: text.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
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
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final pick = myPicks[i];
              final player = playersById[pick.playerId];
              if (player == null) return const SizedBox.shrink();

              final realTeamName = teamNameById[player.realTeamId] ?? '—';

              final isBowler = player.role == 'Bowler';
              final stat1Label = isBowler ? 'Econ' : 'Avg';
              final stat2Label = isBowler ? 'Wkts' : 'SR';

              return PlayerDraftTile(
                rank: (i + 1),
                playerName: player.name,
                realTeamName: realTeamName,
                role: player.role,
                stat1Label: stat1Label,
                stat1Value: '—',
                stat2Label: stat2Label,
                stat2Value: '—',
                enabled: false,
                onAdd: () {},
                isRoster: true,
                draftNumber: '1.1',
              );
            },
          ),
        ),
      ],
    );
  }
}
