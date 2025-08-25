
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/draft_state/draft_state_model.dart'; 
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/theme/brand_tokens.dart';
import 'package:sixers/widgets/draft_tabs/pre_draft_board.dart';
import 'package:sixers/widgets/draft_widgets/draft_app_bar.dart';
import 'package:sixers/widgets/draft_tabs/draft_tab_board.dart';
import 'package:sixers/widgets/draft_tabs/draft_tab_draft.dart';
import 'package:sixers/widgets/draft_tabs/draft_tab_roster.dart';
import 'package:sixers/widgets/draft_widgets/drafted_pick_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../backend/leagues/league_model.dart';

class DraftLobby extends ConsumerStatefulWidget {
  final League league;
  const DraftLobby({required this.league, super.key});

  @override
  ConsumerState<DraftLobby> createState() => _DraftLobbyState();
}

final posFilterProvider = StateProvider<PositionFilter>(
  (_) => PositionFilter.all,
);

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
  late final TabController _segController;

  Color _black100(BuildContext c) =>
      Theme.of(c).extension<SurfaceColors>()!.background;

  @override
  void initState() {
    super.initState();
    _segController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 220),
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


    final AsyncValue<DraftState?> stateAv = ref.watch(
      draftStateStreamProvider(widget.league.id),
    );

    return stateAv.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => _err(e),
      data: (state) {
        if (state == null) {
          return PreDraftLobby(leagueId: widget.league.id);
        }

        final picksAv = ref.watch(draftPicksProvider(widget.league.id));
        final teamsAv = ref.watch(
          fantasyTeamsProvider(leagueId: widget.league.id),
        );
        final playersAv = ref.watch(
          allPlayersProvider(widget.league.tournamentId),
        );

       
        final initialLoading = [
          picksAv,
          teamsAv,
          playersAv,
        ].any((a) => a.isLoading && !a.hasValue);
        if (initialLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (picksAv.hasError) return _err(picksAv.error);
        if (teamsAv.hasError) return _err(teamsAv.error);
        if (playersAv.hasError) return _err(playersAv.error);

        final picks = picksAv.requireValue;
        final teams = teamsAv.requireValue;
        final players = playersAv.requireValue;

        _ticker ??= Timer.periodic(
          const Duration(seconds: 1),
          (_) => mounted ? setState(() {}) : null,
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

        final leagueTeams = teams
            .where((t) => t.leagueId == widget.league.id)
            .toList();
        final teamCount = leagueTeams.isEmpty ? 1 : leagueTeams.length;

        final availablePlayers = players
            .where((pl) => picks.every((p) => p.playerId != pl.id))
            .toList();

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
                    final team = teams.firstWhereOrNull(
                      (t) => t.id == p.teamId,
                    );

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
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 344,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _black100(context),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: TabBar(
                            controller: _segController,
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
                              color: AppColors.black400,
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
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          controller: _segController,
                          children: [
                            DraftTabDraft(
                              availablePlayers: filteredPlayers,
                              myTurn: myTurn,
                              myTeamId: (myTeam as dynamic)?.id,
                              tournamentId: widget.league.tournamentId,
                              selectedFilter: ref.watch(posFilterProvider),
                              onFilterChanged: (v) =>
                                  ref.read(posFilterProvider.notifier).state =
                                      v,
                              onPick: (playerId, teamId) =>
                                  _pickPlayer(playerId, teamId),
                            ),
                            DraftTabBoard(
                              leagueId: widget.league.id,
                              tournamentId: widget.league.tournamentId,
                            ),
                            DraftTabRoster(
                              myTeamId: (myTeam as dynamic)?.id ?? '',
                              allPicks: picks,
                              playersById: {for (final p in players) p.id: p},
                              tournamentId: widget.league.tournamentId,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Pick failed: $e')));
    }
  }

  Scaffold _err(Object? e) => Scaffold(body: Center(child: Text('Error: $e')));
}
