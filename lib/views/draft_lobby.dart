import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/draft_settings/draft_settings_provider.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/widgets/draft_app_bar.dart';
import 'package:sixers/widgets/drafted_pick_card.dart';
import 'package:sixers/widgets/player_draft_tile.dart';
import 'package:sixers/widgets/position_filter_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../backend/leagues/league_model.dart';

class DraftLobby extends ConsumerStatefulWidget {
  final League league;
  const DraftLobby({required this.league, super.key});

  @override
  ConsumerState<DraftLobby> createState() => _DraftLobbyState();
}

// -------- Riverpod position filter state --------
final posFilterProvider =
    StateProvider<PositionFilter>((_) => PositionFilter.all);

String labelForFilter(PositionFilter f) {
  switch (f) {
    case PositionFilter.all:
      return 'Position';
    case PositionFilter.batsman:
      return 'Batsman';
    case PositionFilter.bowler:
      return 'Bowler';
    case PositionFilter.wicketKeeper:
      return 'Wicket Keeper';
    case PositionFilter.allRounder:
      return 'All Rounder';
  }
}

String? roleValue(PositionFilter f) {
  // DB roles per your schema
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

class _DraftLobbyState extends ConsumerState<DraftLobby> {
  Timer? _ticker;

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uid = Supabase.instance.client.auth.currentUser!.id;

    final settingsA = ref.watch(draftSettingsProvider(widget.league.id));
    final teamsA = ref.watch(fantasyTeamsProvider(leagueId: widget.league.id));
    final playersA = ref.watch(allPlayersProvider(widget.league.tournamentId));

    if ([settingsA, teamsA, playersA].any((a) => a.isLoading)) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    for (final a in [settingsA, teamsA, playersA]) {
      if (a.hasError) return _err(a.error);
    }

    final stateA = ref.watch(draftStateStreamProvider(widget.league.id));
    final picksA = ref.watch(draftPicksProvider(widget.league.id));

    if (stateA.hasError) return _err(stateA.error);
    if (picksA.hasError) return _err(picksA.error);

    final state = stateA.valueOrNull;

    if (state == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Draft • ${widget.league.name}')),
        body: Center(
          child: widget.league.creatorId == uid
              ? ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(leagueActionsProvider.notifier)
                        .startDraft(widget.league.id);
                  },
                  child: const Text('Start Draft'),
                )
              : const Text('Waiting for commissioner to start the draft…'),
        ),
      );
    }

    final picks = picksA.valueOrNull;
    if (picks == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Draft • ${widget.league.name}')),
        body: const Center(child: Text('Preparing draft room…')),
      );
    }

    final teams = teamsA.requireValue;
    final players = playersA.requireValue;

    _ticker ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );

    final now = DateTime.now();
    final secsLeft =
        state.pickDeadline.difference(now).inSeconds.clamp(0, 9999);

    final myTeam = teams.firstWhereOrNull(
      (t) => t.leagueId == widget.league.id && t.userId == uid,
    );
    final currentOwnerUid =
        teams.firstWhereOrNull((t) => t.id == state.currentTeamId)?.userId;
    final myTurn = currentOwnerUid == uid;

    final availablePlayers = players
        .where((pl) => picks.every((p) => p.playerId != pl.id))
        .toList();

    final leagueTeams =
        teams.where((t) => t.leagueId == widget.league.id).toList();
    final teamCount = leagueTeams.isEmpty ? 1 : leagueTeams.length;

    // -------- use Riverpod filter state --------
    final pos = ref.watch(posFilterProvider);
    final role = roleValue(pos);
    final filteredPlayers = role == null
        ? availablePlayers
        : availablePlayers.where((pl) => pl.role == role).toList();

    return Scaffold(
      appBar: DraftAppBar(
        secsLeft: secsLeft,
        roundNumber: state.roundNumber,
        pickNumber: state.pickNumber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          // -------- Drafted picks carousel (fixed height) --------
          SizedBox(
            height: 114,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: picks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final p = picks[i];
                final player =
                    players.firstWhereOrNull((pl) => pl.id == p.playerId);
                final team = teams.firstWhereOrNull((t) => t.id == p.teamId);

                // Correct round/pick-in-round calculation with safe teamCount
                final round = ((p.pickNumber - 1) ~/ teamCount) + 1;
                final pickInRound = ((p.pickNumber - 1) % teamCount) + 1;

                return DraftedPickCard(
                  playerName: player?.name ?? 'Player',
                  fantasyTeamName: team?.teamName ?? 'Team',
                  roundNumber: round,
                  pickNumber: pickInRound,
                  // avatarUrl: null, // placeholder
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // -------- Available Players section (fills rest, black200) --------
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface, // black200
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: Text(
                      'Your Pick',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.black700,
                          ),
                    ),
                  ),
                  // Filter (uses Riverpod state)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                    child: PositionFilterButton(
                      selected: pos,
                      onChanged: (v) =>
                          ref.read(posFilterProvider.notifier).state = v,
                    ),
                  ),

                  // Header row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rank',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Stats',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Scrollable list of available players (tiles = black300)
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      itemCount: filteredPlayers.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, i) {
                        final pl = filteredPlayers[i];
                        final rank = i + 1; // placeholder

                        return PlayerDraftTile(
                          rank: rank,
                          playerName: pl.name,
                          realTeamName: 'Team', // TODO: wire real team name
                          stat1Label: 'Avg',
                          stat1Value: '—', // TODO
                          stat2Label: 'SR',
                          stat2Value: '—', // TODO
                          enabled: myTurn,
                          onAdd: () => _pickPlayer(pl.id, myTeam?.id),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickPlayer(String playerId, String? myTeamId) async {
    if (myTeamId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your team not found for this league')),
      );
      return;
    }

    try {
      await ref
          .read(draftPickActionsProvider.notifier)
          .makePick(
            leagueId: widget.league.id,
            teamId: myTeamId,
            playerId: playerId,
          );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Pick failed: $e')));
    }
  }

  Scaffold _err(Object? e) => Scaffold(body: Center(child: Text('Error: $e')));
}
