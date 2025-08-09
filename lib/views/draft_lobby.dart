import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:sixers/theme/brand_tokens.dart';
import 'package:sixers/widgets/draft_app_bar.dart';
import 'package:sixers/widgets/draft_tab_board.dart';
import 'package:sixers/widgets/draft_tab_draft.dart';
import 'package:sixers/widgets/draft_tab_roster.dart';
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

/* ───────────────────────────────────────────────
   RIVERPOD GLOBAL STATE
─────────────────────────────────────────────── */

// position filter (existing)
final posFilterProvider = StateProvider<PositionFilter>(
  (_) => PositionFilter.all,
);

// new tab enum + provider
enum DraftTab { draft, board, roster }

final draftTabProvider = StateProvider<DraftTab>((_) => DraftTab.draft);

/* ───────────────────────────────────────────── */

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

class _DraftLobbyState extends ConsumerState<DraftLobby>
    with SingleTickerProviderStateMixin {
  Timer? _ticker;

  // slider TabController (custom duration to feel snappy)
  late final TabController _segController;

  // helper so we don’t hard-code black100 everywhere
  Color _black100(BuildContext c) =>
      Theme.of(c).extension<SurfaceColors>()!.background;

  @override
  void initState() {
    super.initState();
    _segController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 120),
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _segController.dispose();
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
    final secsLeft = state.pickDeadline
        .difference(now)
        .inSeconds
        .clamp(0, 9999);

    final myTeam = teams.firstWhereOrNull(
      (t) => t.leagueId == widget.league.id && t.userId == uid,
    );
    final currentOwnerUid = teams
        .firstWhereOrNull((t) => t.id == state.currentTeamId)
        ?.userId;
    final myTurn = currentOwnerUid == uid;

    final availablePlayers = players
        .where((pl) => picks.every((p) => p.playerId != pl.id))
        .toList();

    final leagueTeams = teams
        .where((t) => t.leagueId == widget.league.id)
        .toList();
    final teamCount = leagueTeams.isEmpty ? 1 : leagueTeams.length;

    // position filtering
    final pos = ref.watch(posFilterProvider);
    final role = roleValue(pos);
    final filteredPlayers = role == null
        ? availablePlayers
        : availablePlayers.where((pl) => pl.role == role).toList();

    // tab switching
    final currentTab = ref.watch(draftTabProvider);

    // keep controller in sync with provider without extra animation delay
    final targetIndex = DraftTab.values.indexOf(currentTab);
    if (_segController.index != targetIndex) {
      _segController.index = targetIndex; // immediate
    }

    return Scaffold(
      appBar: DraftAppBar(
        secsLeft: secsLeft,
        roundNumber: state.roundNumber,
        pickNumber: state.pickNumber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),

          // ─── Drafted picks carousel ──────────────────────────
          SizedBox(
            height: 117,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: picks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final p = picks[i];
                final player = players.firstWhereOrNull(
                  (pl) => pl.id == p.playerId,
                );
                final team = teams.firstWhereOrNull((t) => t.id == p.teamId);

                final round = ((p.pickNumber - 1) ~/ teamCount) + 1;
                final pickInRound = ((p.pickNumber - 1) % teamCount) + 1;

                return DraftedPickCard(
                  playerName: player?.name ?? 'Player',
                  fantasyTeamName: team?.teamName ?? 'Team',
                  roundNumber: round,
                  pickNumber: pickInRound,
                  role: player?.role,
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // ─── Light-gray container with slider + tab body ──────
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface, // black200
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  // ─── Slider (pill) — 46px tall, snappy, black400 selected ──
                  SizedBox(
                    height: 46,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _black100(context), // dark track
                          borderRadius: BorderRadius.circular(90), // 46/2
                        ),
                        child: TabBar(
                          controller: _segController,
                          onTap: (i) {
                            // update provider immediately (no lag)
                            ref.read(draftTabProvider.notifier).state =
                                DraftTab.values[i];
                          },
                          isScrollable: false,
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant,
                          indicator: const ShapeDecoration(
                            color: AppColors.black400, // selected bg
                            shape: StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          tabs: const [
                            Tab(text: 'Draft'),
                            Tab(text: 'Board'),
                            Tab(text: 'Roster'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Active tab body
                  // Active tab body
                  Expanded(
                    child: switch (currentTab) {
                      DraftTab.draft => DraftTabDraft(
                        availablePlayers: availablePlayers,
                        myTurn: myTurn,
                        myTeamId: (myTeam as dynamic)?.id,
                        selectedFilter: ref.watch(posFilterProvider),
                        onFilterChanged: (v) =>
                            ref.read(posFilterProvider.notifier).state = v,
                        onPick: (playerId, teamId) =>
                            _pickPlayer(playerId, teamId),
                      ),
                      DraftTab.board => const DraftTabBoard(),
                      DraftTab.roster => const DraftTabRoster(),
                    },
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
