import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/draft/draft_player_model.dart';
import 'package:sixers/backend/draft/draft_player_provider.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/draft_state/draft_state_model.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/helpers.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/views/home/home_screen.dart';

// ── Screen ───────────────────────────────────────────────────────────────────

class DraftScreen extends ConsumerStatefulWidget {
  final String leagueId;
  const DraftScreen({super.key, required this.leagueId});

  @override
  ConsumerState<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends ConsumerState<DraftScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final TabController _tabController;
  Timer? _ticker;
  PositionFilter _selectedFilter = PositionFilter.all;
  final ScrollController _timelineScrollController = ScrollController();
  int _lastPickCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 3, vsync: this);
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ticker?.cancel();
    _tabController.dispose();
    _timelineScrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // WebSocket subscription likely died while backgrounded.
      // Invalidate to re-fetch full state and re-subscribe.
      ref.invalidate(draftStateStreamProvider(widget.leagueId));
    }
  }

  void _scrollTimelineToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_timelineScrollController.hasClients) {
        _timelineScrollController.animateTo(
          _timelineScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  int _computeSecondsLeft(String pickExpiresAt) {
    final deadline = DateTime.tryParse(pickExpiresAt);
    if (deadline == null) return 0;
    return deadline.difference(DateTime.now()).inSeconds.clamp(0, 9999);
  }

  String _formatTimer(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final draftStateAsync = ref.watch(
      draftStateStreamProvider(widget.leagueId),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: draftStateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              e.toString().replaceFirst('Exception: ', ''),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.black700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        data: (state) {
          if (state == null) {
            return const Center(child: Text('Waiting for draft to start...'));
          }

          final secsLeft = _computeSecondsLeft(state.pickExpiresAt);

          final leaguesAsync = ref.watch(leaguesProvider);
          final userTeamId = leaguesAsync.whenOrNull(
            data: (leagues) {
              final match =
                  leagues.where((l) => l.id == widget.leagueId);
              return match.isNotEmpty ? match.first.userTeamId : null;
            },
          );
          final isMyTurn = userTeamId != null &&
              userTeamId.isNotEmpty &&
              state.currentTeamId == userTeamId;

          // Number of teams for computing pick-in-round
          final numTeams = leaguesAsync.whenOrNull(
            data: (leagues) {
              final match = leagues.where((l) => l.id == widget.leagueId);
              return match.isNotEmpty ? match.first.teams.length : null;
            },
          ) ?? 1;

          int pickInRound(int overallPick) =>
              ((overallPick - 1) % numTeams) + 1;

          return SafeArea(
            child: Column(
              children: [
                // ── Header ─────────────────────────────────────
                _DraftHeader(
                  onBack: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go(HomeScreen.route);
                    }
                  },
                  timerText: _formatTimer(secsLeft),
                  round: state.currentRound,
                  pick: pickInRound(state.currentPick),
                  isMyTurn: isMyTurn,
                ),

                // ── Pick timeline ──────────────────────────────
                if (state.picks.isNotEmpty)
                  Builder(builder: (_) {
                    if (state.picks.length != _lastPickCount) {
                      _lastPickCount = state.picks.length;
                      _scrollTimelineToEnd();
                    }
                    // Build team name lookup from league teams
                    final teamNames = <String, String>{};
                    final league = leaguesAsync.whenOrNull(
                      data: (leagues) {
                        final match = leagues.where(
                            (l) => l.id == widget.leagueId);
                        return match.isNotEmpty ? match.first : null;
                      },
                    );
                    if (league != null) {
                      for (final t in league.teams) {
                        teamNames[t.id] = t.teamName;
                      }
                    }

                    // Build player name/image lookup from draft players
                    final playersState = ref.watch(
                        draftPlayersProvider(widget.leagueId));
                    final playerNames = <String, String>{};
                    final playerImages = <String, String?>{};
                    final playerRoles = <String, String>{};
                    for (final p in playersState.players) {
                      playerNames[p.id] = p.fullName ?? p.playerName;
                      playerImages[p.id] = p.image;
                      playerRoles[p.id] = p.role;
                    }

                    return SizedBox(
                      height: 85,
                      child: ListView.separated(
                        controller: _timelineScrollController,
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: state.picks.length,
                        separatorBuilder: (_, i) {
                          // Add a round divider if the next pick is in a different round
                          final currentRound = state.picks[i].roundNumber;
                          final nextRound = (i + 1 < state.picks.length)
                              ? state.picks[i + 1].roundNumber
                              : currentRound;
                          if (currentRound != nextRound) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.black400,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox(width: 10);
                        },
                        itemBuilder: (_, i) {
                          final pick = state.picks[i];
                          return _PickTimelineCard(
                            pick: pick,
                            numTeams: numTeams,
                            teamName: teamNames[pick.teamId],
                            playerName: playerNames[pick.playerId],
                            playerImage: playerImages[pick.playerId],
                            playerRole: playerRoles[pick.playerId],
                          );
                        },
                      ),
                    );
                  }),
                if (state.picks.isNotEmpty) const SizedBox(height: 12),

                // ── Tab bar ────────────────────────────────────
                _DraftTabBar(controller: _tabController),

                // ── Tab content ────────────────────────────────
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _DraftTab(
                        leagueId: widget.leagueId,
                        draftState: state,
                        selectedFilter: _selectedFilter,
                        onFilterChanged: (f) =>
                            setState(() => _selectedFilter = f),
                      ),
                      _BoardTab(
                        leagueId: widget.leagueId,
                        draftState: state,
                      ),
                      _RosterTab(
                        leagueId: widget.leagueId,
                        draftState: state,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ── Header ───────────────────────────────────────────────────────────────────

class _DraftHeader extends StatelessWidget {
  final VoidCallback onBack;
  final String timerText;
  final int round;
  final int pick;
  final bool isMyTurn;

  const _DraftHeader({
    required this.onBack,
    required this.timerText,
    required this.round,
    required this.pick,
    required this.isMyTurn,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onBack,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: PhosphorIcon(
                    PhosphorIcons.caretLeft(),
                    size: 24,
                    color: AppColors.black800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'DRAFT',
                style: t.headlineMedium?.copyWith(color: AppColors.black800),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                timerText,
                style: t.headlineMedium?.copyWith(
                  color: isMyTurn ? AppColors.green300 : AppColors.black800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Round $round, Pick $pick',
                style: t.labelMedium?.copyWith(color: AppColors.black600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Pick Timeline Card ───────────────────────────────────────────────────────

class _PickTimelineCard extends StatelessWidget {
  final DraftPick pick;
  final String? teamName;
  final String? playerName;
  final String? playerImage;
  final String? playerRole;
  final int numTeams;

  const _PickTimelineCard({
    required this.pick,
    required this.numTeams,
    this.teamName,
    this.playerName,
    this.playerImage,
    this.playerRole,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final role = roleIconAndColor(playerRole ?? '');

    return Container(
      width: 190,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          // ── Role color strip with pattern (right side) ──
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: 170,
            child: Container(
              color: role.color,
              child: CustomPaint(
                painter: _OpaquePatternPainter(
                  image: rolePatternImage(playerRole ?? ''),
                ),
                size: Size.infinite,
              ),
            ),
          ),

          // ── Card content ──
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row 1: Team name + pick chip
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        teamName ?? pick.teamId,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.labelSmall
                            ?.copyWith(color: AppColors.black600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.black100,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'GT',
                            style: t.labelSmall,
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            '${pick.roundNumber}.${(((pick.pickNumber - 1) % numTeams) + 1).toString().padLeft(2, '0')}',
                            style: t.titleSmall?.copyWith(color: AppColors.black800)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),  
                const SizedBox(height: 5,),              // Row 2: Player name + player image
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        (playerName ?? pick.playerId).toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: t.bodySmall?.copyWith(
                          color: AppColors.black800,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 39,
                      height: 39,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: AppColors.black200, width: 2),
                        color: AppColors.black300,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: playerImage != null
                          ? Image.network(
                              playerImage!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const SizedBox(),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tab Bar ──────────────────────────────────────────────────────────────────

class _DraftTabBar extends StatelessWidget {
  final TabController controller;
  const _DraftTabBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black100,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF101010),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: TabBar(
          controller: controller,
          isScrollable: false,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          labelColor: AppColors.black800,
          unselectedLabelColor: AppColors.black600,
          indicator: BoxDecoration(
            color: AppColors.black400,
            borderRadius: BorderRadius.circular(5),
          ),
          tabs: const [
            Tab(text: 'Draft', height: 40),
            Tab(text: 'Board', height: 40),
            Tab(text: 'Roster', height: 40),
          ],
        ),
      ),
    );
  }
}

// ── Draft Tab ────────────────────────────────────────────────────────────────

class _DraftTab extends ConsumerStatefulWidget {
  final String leagueId;
  final DraftState draftState;
  final PositionFilter selectedFilter;
  final ValueChanged<PositionFilter> onFilterChanged;

  const _DraftTab({
    required this.leagueId,
    required this.draftState,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  ConsumerState<_DraftTab> createState() => _DraftTabState();
}

class _DraftTabState extends ConsumerState<_DraftTab> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(draftPlayersProvider(widget.leagueId).notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final playersState = ref.watch(draftPlayersProvider(widget.leagueId));
    final leaguesAsync = ref.watch(leaguesProvider);

    final filterAbbr = _filterToAbbr(widget.selectedFilter);

    // IDs of players already drafted
    final pickedPlayerIds =
        widget.draftState.picks.map((p) => p.playerId).toSet();

    // Determine current user's team ID from the league
    final userTeamId = leaguesAsync.whenOrNull(
      data: (leagues) {
        final match = leagues.where((l) => l.id == widget.leagueId);
        return match.isNotEmpty ? match.first.userTeamId : null;
      },
    );

    final isMyTurn = userTeamId != null &&
        userTeamId.isNotEmpty &&
        widget.draftState.currentTeamId == userTeamId;

    // Compute which roles still have room on the user's roster
    final myPicks = widget.draftState.picks
        .where((p) => p.teamId == userTeamId)
        .toList();
    final myPickedPlayers = <DraftPlayer>[];
    for (final pick in myPicks) {
      final idx = playersState.players.indexWhere((p) => p.id == pick.playerId);
      if (idx != -1) myPickedPlayers.add(playersState.players[idx]);
    }
    final fullRoles = _computeFullRoles(myPickedPlayers);

    final filtered = playersState.players.where((p) {
      // Exclude already-picked players
      if (pickedPlayerIds.contains(p.id)) return false;
      if (filterAbbr != null && p.roleAbbr != filterAbbr) return false;
      return true;
    }).toList();

    return Container(
      color: AppColors.black100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // Position filter chips
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: PositionFilter.values.map((f) {
                final isSelected = f == widget.selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => widget.onFilterChanged(f),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.black800
                            : AppColors.black300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        _filterLabel(f),
                        style: t.bodyMedium?.copyWith(
                          color: isSelected
                              ? AppColors.black100
                              : AppColors.black600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Column headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Text(
                  'Rank',
                  style: t.labelMedium?.copyWith(color: AppColors.black600),
                ),
                const Spacer(),
                Text(
                  'PPG',
                  style: t.labelMedium?.copyWith(color: AppColors.black600),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Player list with infinite scroll
          Expanded(
            child: _buildPlayerList(filtered, playersState,
                isMyTurn: isMyTurn, fullRoles: fullRoles),
          ),
        ],
      ),
    );
  }

  Future<void> _onPickPlayer(DraftPlayer player) async {
    final leaguesAsync = ref.read(leaguesProvider);
    final userTeamId = leaguesAsync.whenOrNull(
      data: (leagues) {
        final match = leagues.where((l) => l.id == widget.leagueId);
        return match.isNotEmpty ? match.first.userTeamId : null;
      },
    );
    if (userTeamId == null || userTeamId.isEmpty) return;

    logDebug('Pick attempt: userTeamId=$userTeamId, '
        'currentTeamId=${widget.draftState.currentTeamId}, '
        'round=${widget.draftState.currentRound}, '
        'pick=${widget.draftState.currentPick}');

    await ref.read(draftPickActionsProvider.notifier).makePick(
          leagueId: widget.leagueId,
          teamId: userTeamId,
          playerId: player.id,
          roundNumber: widget.draftState.currentRound,
          pickNumber: widget.draftState.currentPick,
        );
  }

  Widget _buildPlayerList(
      List<DraftPlayer> filtered, DraftPlayersState playersState,
      {required bool isMyTurn, required Set<String> fullRoles}) {
    // Initial loading
    if (playersState.isLoading && playersState.players.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error on initial load
    if (playersState.error != null && playersState.players.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              playersState.error!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => ref
                  .read(draftPlayersProvider(widget.leagueId).notifier)
                  .reset(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          'No players found',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black600),
        ),
      );
    }

    // +1 for the loading indicator at the bottom
    final itemCount =
        filtered.length + (playersState.hasMore ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i >= filtered.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        final canPick = isMyTurn && !fullRoles.contains(filtered[i].roleAbbr);
        return _PlayerCard(
          player: filtered[i],
          onPick: canPick ? () => _onPickPlayer(filtered[i]) : null,
        );
      },
    );
  }

  /// Returns the set of role abbreviations that have no remaining roster space.
  /// Roster: 2 BAT + 1 WK (under batsman), 3 BWL, 1 AR, 1 flex (any), 3 bench (any) = 11 total.
  Set<String> _computeFullRoles(List<DraftPlayer> myPlayers) {
    const roleCaps = {'BAT': 2, 'WK': 1, 'BWL': 3, 'AR': 1};
    const totalSlots = 11; // 2 BAT + 1 WK + 3 BWL + 1 AR + 1 flex + 3 bench

    // Count how many of each role the user already has
    final roleCounts = <String, int>{};
    for (final p in myPlayers) {
      roleCounts[p.roleAbbr] = (roleCounts[p.roleAbbr] ?? 0) + 1;
    }

    // Compute how many players overflow their dedicated slots into flex/bench
    int overflowIntoFlexBench = 0;
    for (final entry in roleCounts.entries) {
      final cap = roleCaps[entry.key] ?? 0;
      if (entry.value > cap) {
        overflowIntoFlexBench += entry.value - cap;
      }
    }

    // flex + bench = 4 shared slots
    const flexBenchSlots = 4;
    final flexBenchRemaining = flexBenchSlots - overflowIntoFlexBench;

    final full = <String>{};

    // If total roster is full, everything is full
    if (myPlayers.length >= totalSlots) {
      return {'BAT', 'BWL', 'AR', 'WK'};
    }

    // A role is full when its dedicated slots are filled AND flex/bench has no room
    for (final role in roleCaps.keys) {
      final count = roleCounts[role] ?? 0;
      final cap = roleCaps[role]!;
      if (count >= cap && flexBenchRemaining <= 0) {
        full.add(role);
      }
    }

    // WK reservation: if no WK has been picked yet, we must reserve at least
    // one remaining slot for a WK. Block BAT if picking another would leave
    // no room for the mandatory WK.
    final wkCount = roleCounts['WK'] ?? 0;
    if (wkCount == 0) {
      final remaining = totalSlots - myPlayers.length;
      if (remaining <= 1) {
        full.add('BAT');
      }
    }

    return full;
  }

  String _filterLabel(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return 'All';
      case PositionFilter.bowler:
        return 'Bowler';
      case PositionFilter.batsman:
        return 'Batsman';
      case PositionFilter.allRounder:
        return 'All Rounder';
      case PositionFilter.wicketKeeper:
        return 'Wicket Keeper';
    }
  }

  String? _filterToAbbr(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return null;
      case PositionFilter.batsman:
        return 'BAT';
      case PositionFilter.bowler:
        return 'BWL';
      case PositionFilter.allRounder:
        return 'AR';
      case PositionFilter.wicketKeeper:
        return 'WK';
    }
  }
}

// ── Player Card ──────────────────────────────────────────────────────────────

class _PlayerCard extends StatelessWidget {
  final DraftPlayer player;
  final VoidCallback? onPick;
  const _PlayerCard({
    required this.player,
    this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final r = roleIconAndColor(player.role);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          // Rank
          Text(
            '${player.rank}',
            style: t.labelSmall?.copyWith(color: AppColors.black800),
          ),
          // Avatar
          const SizedBox(width: 10),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF464646),
            ),
            clipBehavior: Clip.antiAlias,
            child: player.image != null
                ? Image.network(
                    player.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  )
                : const SizedBox(),
          ),
          const SizedBox(width: 10),
          // Name + role + team
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        player.fullName ?? player.playerName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.bodyMedium?.copyWith(
                          color: AppColors.black800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColors.black400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            player.roleAbbr,
                            style: t.labelSmall?.copyWith(
                              color: AppColors.black800,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          PhosphorIcon(
                            r.icon as PhosphorIconData,
                            size: 12,
                            color: r.color,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  player.teamName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: t.labelSmall?.copyWith(color: AppColors.black600),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // PPG
          Text(
            player.initialProjection != null
                ? player.initialProjection!.toStringAsFixed(1)
                : '—',
            style: t.bodyLarge?.copyWith(color: AppColors.black700),
          ),
          if (onPick != null) ...[
            const SizedBox(width: 12),
            InkWell(
              onTap: onPick,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.black400,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.green300,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Board Tab ───────────────────────────────────────────────────────────────

class _BoardTab extends ConsumerWidget {
  final String leagueId;
  final DraftState draftState;

  const _BoardTab({required this.leagueId, required this.draftState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider);
    final league = leaguesAsync.whenOrNull(
      data: (leagues) {
        final match = leagues.where((l) => l.id == leagueId);
        return match.isNotEmpty ? match.first : null;
      },
    );

    // Get draft players for name/image/role lookup
    final playersState = ref.watch(draftPlayersProvider(leagueId));
    final playerMap = <String, DraftPlayer>{};
    for (final p in playersState.players) {
      playerMap[p.id] = p;
    }

    if (league == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Teams sorted by draft order
    final teams = List<FantasyTeam>.from(league.teams)
      ..sort((a, b) => (a.draftOrder ?? 0).compareTo(b.draftOrder ?? 0));
    final numTeams = teams.length;
    if (numTeams == 0) {
      return const Center(
        child: Text('No teams', style: TextStyle(color: AppColors.black600)),
      );
    }

    // Build a grid: rows = rounds, columns = teams (in draft-order for that round)
    // Snake draft: odd rounds L→R, even rounds R→L
    final numRounds = draftState.picks.isEmpty
        ? 0
        : draftState.picks.map((p) => p.roundNumber).reduce(
            (a, b) => a > b ? a : b);

    // Index picks by (roundNumber, teamId)
    final pickIndex = <(int, String), DraftPick>{};
    for (final pick in draftState.picks) {
      pickIndex[(pick.roundNumber, pick.teamId)] = pick;
    }

    // Compute pick-in-round for each cell (snake order)
    int pickInRound(int round, int colIndex) {
      final isReversed = round.isEven;
      return isReversed ? (numTeams - colIndex) : (colIndex + 1);
    }

    const double columnWidth = 120;
    const double rowHeight = 80;
    const double headerHeight = 80;
    const double gap = 2;

    final scrollControllerH = ScrollController();

    return Container(
      color: AppColors.black100,
      child: SingleChildScrollView(
        controller: scrollControllerH,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          width: numTeams * (columnWidth + gap) - gap,
          child: Column(
            children: [
              // ── Team headers ──
              SizedBox(
                height: headerHeight,
                child: Row(
                  children: [
                    for (int c = 0; c < numTeams; c++) ...[
                      if (c > 0) const SizedBox(width: gap),
                      SizedBox(
                        width: columnWidth,
                        child: _BoardTeamHeader(team: teams[c]),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 6),
              // ── Pick grid ──
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int r = 1; r <= numRounds; r++) ...[
                        if (r > 1) const SizedBox(height: gap),
                        SizedBox(
                          height: rowHeight,
                          child: Row(
                            children: [
                              for (int c = 0; c < numTeams; c++) ...[
                                if (c > 0) const SizedBox(width: gap),
                                SizedBox(
                                  width: columnWidth,
                                  child: _buildBoardCell(
                                    context,
                                    round: r,
                                    colIndex: c,
                                    teams: teams,
                                    pickIndex: pickIndex,
                                    playerMap: playerMap,
                                    pickInRound: pickInRound(r, c),
                                    numTeams: numTeams,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoardCell(
    BuildContext context, {
    required int round,
    required int colIndex,
    required List<FantasyTeam> teams,
    required Map<(int, String), DraftPick> pickIndex,
    required Map<String, DraftPlayer> playerMap,
    required int pickInRound,
    required int numTeams,
  }) {
    // Snake: even rounds reverse the column order
    final isReversed = round.isEven;
    final teamIndex = isReversed ? (numTeams - 1 - colIndex) : colIndex;
    final team = teams[teamIndex];
    final pick = pickIndex[(round, team.id)];

    if (pick == null) {
      // Empty cell — not yet picked
      return Container(
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }

    final player = playerMap[pick.playerId];
    final role = roleIconAndColor(player?.role ?? '');

    final t = Theme.of(context).textTheme;
    final pickLabel = '$round.${pickInRound.toString().padLeft(2, '0')}';

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: role.color.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: role.color, width: 2),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: role icon + team abbr + pick number
          Row(
            children: [
              PhosphorIcon(
                role.icon as PhosphorIconData,
                size: 12,
                color: AppColors.black700,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  player?.teamName?.toUpperCase() ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: t.bodySmall?.copyWith(color: AppColors.black700, fontWeight: FontWeight.w700,),
                ),
              ),
              Text(
                pickLabel,
                style: t.labelSmall?.copyWith(
                  color: AppColors.black700,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          // Player name
          Text(
            (player?.fullName ?? player?.playerName ?? pick.playerId),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: t.bodyMedium?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
        ],
      ),
    );
  }
}

class _BoardTeamHeader extends StatelessWidget {
  final FantasyTeam team;
  const _BoardTeamHeader({required this.team});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final color = stringToColor(team.teamColor);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              stringToAvatar(team.teamIcon),
              width: 30,
              height: 30,
              errorBuilder: (_, __, ___) => Icon(
                Icons.shield,
                size: 30,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          team.teamName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: t.titleSmall?.copyWith(color: AppColors.black800),
        ),
      ],
    );
  }
}

// ── Roster Tab ──────────────────────────────────────────────────────────────

/// Slot definition: label + required role abbreviation (null = flex/bench).
class _RosterSlot {
  final String label;
  final String? roleAbbr; // null means any role (flex / bench)
  DraftPlayer? player;

  _RosterSlot({required this.label, this.roleAbbr, this.player});
}

class _RosterTab extends ConsumerWidget {
  final String leagueId;
  final DraftState draftState;

  const _RosterTab({required this.leagueId, required this.draftState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).textTheme;

    // Resolve user's team ID
    final leaguesAsync = ref.watch(leaguesProvider);
    final userTeamId = leaguesAsync.whenOrNull(
      data: (leagues) {
        final match = leagues.where((l) => l.id == leagueId);
        return match.isNotEmpty ? match.first.userTeamId : null;
      },
    );

    // Get all draft players for name/image lookup
    final playersState = ref.watch(draftPlayersProvider(leagueId));
    final playerMap = <String, DraftPlayer>{};
    for (final p in playersState.players) {
      playerMap[p.id] = p;
    }

    // Filter picks for user's team
    final myPicks = draftState.picks
        .where((p) => p.teamId == userTeamId)
        .toList();

    // Resolve picked players
    final pickedPlayers = <DraftPlayer>[];
    for (final pick in myPicks) {
      final player = playerMap[pick.playerId];
      if (player != null) pickedPlayers.add(player);
    }

    // Build roster slots
    final slots = _buildSlots(pickedPlayers);

    // Group slots by section
    final sections = <String, List<_RosterSlot>>{};
    for (final slot in slots) {
      sections.putIfAbsent(slot.label, () => []).add(slot);
    }

    return Container(
      color: AppColors.black100,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Text(
            'Your Roster',
            style: t.titleMedium?.copyWith(color: AppColors.black800),
          ),
          const SizedBox(height: 8),
          for (final entry in sections.entries) ...[
            _SectionHeader(title: entry.key),
            const SizedBox(height: 8),
            for (final slot in entry.value) ...[
              slot.player != null
                  ? _PlayerCard(player: slot.player!)
                  : _EmptySlotCard(roleLabel: slot.label),
              const SizedBox(height: 8),
            ],
          ],
        ],
      ),
    );
  }

  List<_RosterSlot> _buildSlots(List<DraftPlayer> picked) {
    // Sort all picked players by rank (lower = better)
    final sorted = List<DraftPlayer>.from(picked)
      ..sort((a, b) => a.rank.compareTo(b.rank));

    // Separate into pools by role
    final batsmen = sorted.where((p) => p.roleAbbr == 'BAT').toList();
    final bowlers = sorted.where((p) => p.roleAbbr == 'BWL').toList();
    final allRounders = sorted.where((p) => p.roleAbbr == 'AR').toList();
    final keepers = sorted.where((p) => p.roleAbbr == 'WK').toList();

    // Track players assigned to starting roster
    final assigned = <String>{};

    // ── Wicket Keeper slot (one of the 3 batsman slots) ──
    // Use the highest-ranked WK if available
    DraftPlayer? wkStarter;
    if (keepers.isNotEmpty) {
      wkStarter = keepers.first;
      assigned.add(wkStarter.id);
    }

    // ── Batsman slots: 2 remaining after WK ──
    final batStarters = <DraftPlayer>[];
    for (final p in batsmen) {
      if (batStarters.length >= 2) break;
      batStarters.add(p);
      assigned.add(p.id);
    }

    // ── Bowler slots: 3 ──
    final bwlStarters = <DraftPlayer>[];
    for (final p in bowlers) {
      if (bwlStarters.length >= 3) break;
      bwlStarters.add(p);
      assigned.add(p.id);
    }

    // ── All Rounder slot: 1 ──
    DraftPlayer? arStarter;
    if (allRounders.isNotEmpty) {
      arStarter = allRounders.first;
      assigned.add(arStarter.id);
    }

    // ── Flex slot: best remaining unassigned player by rank ──
    DraftPlayer? flexStarter;
    for (final p in sorted) {
      if (!assigned.contains(p.id)) {
        flexStarter = p;
        assigned.add(p.id);
        break;
      }
    }

    // ── Bench: all remaining unassigned, sorted by rank ──
    final bench = sorted.where((p) => !assigned.contains(p.id)).toList();

    // ── Build slots ──
    final slots = <_RosterSlot>[
      // Wicket Keeper (shown under Batsman section)
      _RosterSlot(label: 'Batsman', roleAbbr: 'WK', player: wkStarter),
      // 2 Batsmen
      for (int i = 0; i < 2; i++)
        _RosterSlot(
          label: 'Batsman',
          roleAbbr: 'BAT',
          player: i < batStarters.length ? batStarters[i] : null,
        ),
      // 3 Bowlers
      for (int i = 0; i < 3; i++)
        _RosterSlot(
          label: 'Bowler',
          roleAbbr: 'BWL',
          player: i < bwlStarters.length ? bwlStarters[i] : null,
        ),
      // 1 All Rounder
      _RosterSlot(label: 'All Rounder', roleAbbr: 'AR', player: arStarter),
      // 1 Flex
      _RosterSlot(label: 'Flex', player: flexStarter),
      // 3 Bench
      for (int i = 0; i < 3; i++)
        _RosterSlot(
          label: 'Bench',
          player: i < bench.length ? bench[i] : null,
        ),
    ];

    return slots;
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 2),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.black600, letterSpacing: 1),
      ),
    );
  }
}

class _EmptySlotCard extends StatelessWidget {
  final String roleLabel;
  const _EmptySlotCard({required this.roleLabel});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.black300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Empty rank area
          const SizedBox(width: 20),
          const SizedBox(width: 10),
          // Placeholder avatar
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.black300,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Empty $roleLabel Slot',
              style: t.bodyMedium?.copyWith(color: AppColors.black500),
            ),
          ),
          // Dashed outline placeholder for PPG
          Text(
            '—',
            style: t.bodyLarge?.copyWith(color: AppColors.black400),
          ),
          const SizedBox(width: 42),
        ],
      ),
    );
  }
}

class _OpaquePatternPainter extends CustomPainter {
  final ui.Image image;

  _OpaquePatternPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = 1.0;
    final matrix = Matrix4.identity()..scale(scale, scale);
    final paint = Paint()
      ..shader = ImageShader(
          image, TileMode.repeated, TileMode.repeated, matrix.storage);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _OpaquePatternPainter oldDelegate) {
    return oldDelegate.image != image;
  }
}
