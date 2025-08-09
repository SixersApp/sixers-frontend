import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/widgets/draft_widgets/player_draft_tile.dart';
import 'package:sixers/widgets/draft_widgets/position_filter_button.dart';

// add these:
import 'package:sixers/backend/real_team/real_team_model.dart';
import 'package:sixers/backend/real_team/real_team_provider.dart';

/// The Draft tab content only (no outer background).
/// Parent provides: available players, whose turn, team id, and filter state.
class DraftTabDraft extends ConsumerWidget {
  const DraftTabDraft({
    super.key,
    required this.availablePlayers,
    required this.myTurn,
    required this.myTeamId,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onPick,
  });

  final List<Player> availablePlayers;
  final bool myTurn;
  final String? myTeamId;

  final PositionFilter selectedFilter;
  final ValueChanged<PositionFilter> onFilterChanged;

  /// onPick(playerId, myTeamId)
  final void Function(String, String?) onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Figure out which tournament to load real teams for
    final String? tournamentId = availablePlayers.isNotEmpty
        ? availablePlayers.first.tournamentId
        : null;

    // Fetch real teams for that tournament (empty if we don't know yet)
    final AsyncValue<List<RealTeam>> realTeamsA = ref.watch(
      realTeamsProvider(tournamentId: tournamentId),
    );

    final role = _roleValue(selectedFilter);
    final filteredPlayers = role == null
        ? availablePlayers
        : availablePlayers.where((p) => p.role == role).toList();

    // Build a map id -> name (fallback to empty map while loading/error)
    final Map<String, String> teamNameById = realTeamsA.maybeWhen(
      data: (teams) => {for (final t in teams) t.id: t.name},
      orElse: () => const {},
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Your Pick',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.black700),
          ),
        ),
        // Position filter
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: PositionFilterButton(
            selected: selectedFilter,
            onChanged: onFilterChanged,
          ),
        ),
        // Header row
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Rank',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Stats',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: filteredPlayers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) {
              final pl = filteredPlayers[i];
              final rank = i + 1; // placeholder rank

              // Look up the real team name by id
              final realTeamName = teamNameById[pl.realTeamId] ?? 'Team';

              return PlayerDraftTile(
                rank: rank,
                playerName: pl.name,
                realTeamName: realTeamName,
                stat1Label: 'Avg',
                stat1Value: '—',
                stat2Label: 'SR',
                stat2Value: '—',
                enabled: myTurn,
                onAdd: () => onPick(pl.id, myTeamId),
                role: pl.role,
              );
            },
          ),
        ),
      ],
    );
  }

  // Map PositionFilter -> DB role string (matches your schema)
  String? _roleValue(PositionFilter f) {
    switch (f) {
      case PositionFilter.batsman:
        return 'Batsman';
      case PositionFilter.bowler:
        return 'Bowler';
      case PositionFilter.wicketKeeper:
        return 'Wicket-Keeper';
      case PositionFilter.allRounder:
        return 'All-Rounder';
      case PositionFilter.all:
        return null;
    }
  }
}
