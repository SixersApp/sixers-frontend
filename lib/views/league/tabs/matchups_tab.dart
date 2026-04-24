import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart' show weekMatchupsProvider;
import 'package:sixers/backend/fantasy_matchup/scoring_utils.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/live_match/active_match_model.dart';
import 'package:sixers/backend/live_match/live_match_provider.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/league/components/player_stats_bottom_sheet.dart';

class MatchupsTab extends ConsumerStatefulWidget {
  const MatchupsTab({
    super.key,
    required this.league,
    required this.selectedGameNum,
    required this.onGameChanged,
  });

  final League league;
  final int selectedGameNum;
  final Function(int) onGameChanged;

  @override
  ConsumerState<MatchupsTab> createState() => _MatchupsTabState();
}

class _MatchupsTabState extends ConsumerState<MatchupsTab> {
  int _selectedMatchupIndex = 0;
  int? _lastGameNum;

  static const _activeSlots = {'bat', 'bowl', 'all', 'flex', 'wicket'};
  bool _isActiveSlot(MatchupPlayer p) =>
      _activeSlots.any((s) => p.slot.toLowerCase().startsWith(s));

  @override
  Widget build(BuildContext context) {
    // Fetch week-specific data for the selected game
    final weekAsync = ref.watch(
      weekMatchupsProvider(widget.league.id, widget.selectedGameNum),
    );
    final liveMatchMap = ref.watch(liveMatchesProvider).value ?? {};
    final perfLookups = buildPerformanceLookup(liveMatchMap);
    final perfLookup = perfLookups.byPerfId;
    final perfByPlayerId = perfLookups.byPlayerId;

    return weekAsync.when(
      data: (weekGroup) {
        final gameMatchups = weekGroup?.matchups ?? [];
        final weekStatus = weekGroup?.status ?? 'upcoming';

        // On week change, default to the matchup containing the user's team
        if (_lastGameNum != widget.selectedGameNum) {
          _lastGameNum = widget.selectedGameNum;
          final userTeamId = widget.league.userTeamId;
          final myIndex = gameMatchups.indexWhere(
            (m) =>
                m.team1.fantasyTeamId == userTeamId ||
                m.team2.fantasyTeamId == userTeamId,
          );
          _selectedMatchupIndex = myIndex >= 0 ? myIndex : 0;
        }

        if (_selectedMatchupIndex >= gameMatchups.length) {
          _selectedMatchupIndex = 0;
        }

        return Column(
          children: [
            // Matchup chips
            if (gameMatchups.isNotEmpty)
              SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: gameMatchups.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final matchup = gameMatchups[index];
                    final isSelected = index == _selectedMatchupIndex;
                    final team1Meta = _findTeamMeta(
                      matchup.team1.fantasyTeamId,
                    );
                    final team2Meta = _findTeamMeta(
                      matchup.team2.fantasyTeamId,
                    );

                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedMatchupIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.black300
                              : AppColors.black200,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.black400,
                            width: 1,
                          ),
                        ),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          clipBehavior: Clip.none,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildChipIcon(team1Meta),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: Text(
                                    isSelected
                                        ? '${team1Meta?.teamName ?? "T1"} vs ${team2Meta?.teamName ?? "T2"}'
                                        : '${_abbreviate(team1Meta?.teamName)} v ${_abbreviate(team2Meta?.teamName)}',
                                    key: ValueKey('chip_$index\_$isSelected'),
                                    style: Theme.of(context).textTheme.labelSmall
                                        ?.copyWith(
                                          color: AppColors.black800,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              _buildChipIcon(team2Meta),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 16),

            // Selected matchup detail view
            if (gameMatchups.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: _buildMatchupDetail(
                    gameMatchups[_selectedMatchupIndex],
                    perfLookup,
                    perfByPlayerId,
                    liveMatchMap,
                    weekStatus,
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: _buildTbdMatchup(),
                ),
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error loading matchups: $err',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // ─── Matchup detail view ───────────────────────────────────────────

  Widget _buildMatchupDetail(
    Matchup matchup,
    Map<String, PlayerPerformance> perfLookup,
    Map<String, PlayerPerformance> perfByPlayerId,
    Map<String, ActiveMatch> liveMatchMap,
    String weekStatus,
  ) {
    final team1Meta = _findTeamMeta(matchup.team1.fantasyTeamId);
    final team2Meta = _findTeamMeta(matchup.team2.fantasyTeamId);

    final activePlayers1 = matchup.team1.players.where(_isActiveSlot).toList();
    final activePlayers2 = matchup.team2.players.where(_isActiveSlot).toList();

    final isActive = weekStatus == 'active';

    // For active weeks, calculate scores from live data.
    // For completed/upcoming, use embedded fantasyPoints from the API.
    late final double team1Score;
    late final double team2Score;

    if (isActive) {
      team1Score = calculateTeamScore(
        activePlayers1,
        perfLookup,
        perfByPlayerId,
        widget.league.scoringRules,
        captainId: matchup.team1.captain,
        viceCaptainId: matchup.team1.viceCaptain,
      );
      team2Score = calculateTeamScore(
        activePlayers2,
        perfLookup,
        perfByPlayerId,
        widget.league.scoringRules,
        captainId: matchup.team2.captain,
        viceCaptainId: matchup.team2.viceCaptain,
      );
    } else {
      team1Score = activePlayers1.fold(
        0.0,
        (sum, p) => sum + (p.fantasyPoints ?? 0),
      );
      team2Score = activePlayers2.fold(
        0.0,
        (sum, p) => sum + (p.fantasyPoints ?? 0),
      );
    }

    // Build per-player stats for win probability
    final rules = widget.league.scoringRules;

    List<({double currentScore, double projectedScore, double initialProjection})> buildPlayerStats(
      List<MatchupPlayer> players,
      MatchupTeam team,
    ) {
      return players.map((p) {
        final perf = isActive
            ? _lookupPerf(p, perfLookup, perfByPlayerId)
            : _embeddedPerf(p);
        double currentScore;
        if (isActive) {
          if (perf == null) {
            currentScore = 0;
          } else {
            final cats = _applicableCategories(p.slot, p.role);
            currentScore = calculatePlayerPoints(
              perf, rules, cats,
              playerId: p.playerId,
              captainId: team.captain,
              viceCaptainId: team.viceCaptain,
            );
          }
        } else {
          currentScore = p.fantasyPoints ?? 0;
        }

        // Apply captain/vc multiplier to the projection baseline
        double adjustedPpg = p.projectedPpg;
        if (p.playerId == team.captain || p.playerId == team.viceCaptain) {
          for (final rule in rules) {
            if (rule.mode != RuleMode.multiplier) continue;
            final stat = rule.stat.toLowerCase();
            if (p.playerId == team.captain && stat == 'captaincy multiplier') {
              adjustedPpg *= (rule.multiplier ?? 1);
            } else if (p.playerId == team.viceCaptain && stat == 'vice captaincy multiplier') {
              adjustedPpg *= (rule.multiplier ?? 1);
            }
          }
        }

        final c = perf != null ? completionRatio(p.slot, p.role, perf) : 0.0;
        final projected = projectedFantasyScore(currentScore, adjustedPpg, c);

        return (
          currentScore: currentScore,
          projectedScore: projected,
          initialProjection: adjustedPpg,
        );
      }).toList();
    }

    final team1Stats = buildPlayerStats(activePlayers1, matchup.team1);
    final team2Stats = buildPlayerStats(activePlayers2, matchup.team2);

    final team1WinPct = winProbability(
      team1Players: team1Stats,
      team2Players: team2Stats,
    );
    final team1Pct = (team1WinPct * 100).round().clamp(1, 99);
    final team2Pct = 100 - team1Pct;

    final team1Color = team1Meta != null
        ? stringToColor(team1Meta.teamColor)
        : Colors.grey;
    final team2Color = team2Meta != null
        ? stringToColor(team2Meta.teamColor)
        : Colors.grey;

    // Group players by category
    final batting1 = activePlayers1
        .where((p) => _slotCategory(p.slot) == 'batting')
        .toList();
    final batting2 = activePlayers2
        .where((p) => _slotCategory(p.slot) == 'batting')
        .toList();
    final bowling1 = activePlayers1
        .where((p) => _slotCategory(p.slot) == 'bowling')
        .toList();
    final bowling2 = activePlayers2
        .where((p) => _slotCategory(p.slot) == 'bowling')
        .toList();
    final wk1 = activePlayers1
        .where((p) => _slotCategory(p.slot) == 'wicket')
        .toList();
    final wk2 = activePlayers2
        .where((p) => _slotCategory(p.slot) == 'wicket')
        .toList();
    final allrounder1 = activePlayers1
        .where((p) => _slotCategory(p.slot) == 'allrounder')
        .toList();
    final allrounder2 = activePlayers2
        .where((p) => _slotCategory(p.slot) == 'allrounder')
        .toList();
    final flex1 = activePlayers1
        .where((p) => _slotCategory(p.slot) == 'flex')
        .toList();
    final flex2 = activePlayers2
        .where((p) => _slotCategory(p.slot) == 'flex')
        .toList();

    return Column(
      children: [
        // ── Score header ──
        _buildScoreHeader(
          matchup: matchup,
          team1Meta: team1Meta,
          team2Meta: team2Meta,
          team1Score: team1Score,
          team2Score: team2Score,
          team1Color: team1Color,
          team2Color: team2Color,
          weekStatus: weekStatus,
          team1Pct: team1Pct,
          team2Pct: team2Pct,
        ),

        // Game selector — outside the padded container
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.black200),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 16),
                onPressed: widget.selectedGameNum > 1
                    ? () {
                        setState(() => _selectedMatchupIndex = 0);
                        widget.onGameChanged(widget.selectedGameNum - 1);
                      }
                    : null,
                color: widget.selectedGameNum > 1
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
              Text(
                'Game ${widget.selectedGameNum}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: widget.selectedGameNum < widget.league.weeks
                    ? () {
                        setState(() => _selectedMatchupIndex = 0);
                        widget.onGameChanged(widget.selectedGameNum + 1);
                      }
                    : null,
                color: widget.selectedGameNum < widget.league.weeks
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ── Player sections ──
        if (batting1.isNotEmpty || batting2.isNotEmpty)
          _buildPlayerSection(
            'BATTING',
            PhosphorIcons.cricket(),
            batting1,
            batting2,
            matchup,
            perfLookup,
            perfByPlayerId,
            liveMatchMap,
            weekStatus,
            team1Meta: team1Meta,
            team2Meta: team2Meta,
          ),
        if (bowling1.isNotEmpty || bowling2.isNotEmpty)
          _buildPlayerSection(
            'BOWLING',
            PhosphorIcons.boules(),
            bowling1,
            bowling2,
            matchup,
            perfLookup,
            perfByPlayerId,
            liveMatchMap,
            weekStatus,
            team1Meta: team1Meta,
            team2Meta: team2Meta,
          ),
        if (wk1.isNotEmpty || wk2.isNotEmpty)
          _buildPlayerSection(
            'WICKET-KEEPER',
            PhosphorIcons.handsClapping(),
            wk1,
            wk2,
            matchup,
            perfLookup,
            perfByPlayerId,
            liveMatchMap,
            weekStatus,
            team1Meta: team1Meta,
            team2Meta: team2Meta,
          ),
        if (allrounder1.isNotEmpty || allrounder2.isNotEmpty)
          _buildPlayerSection(
            'ALL-ROUNDER',
            PhosphorIcons.personSimpleThrow(),
            allrounder1,
            allrounder2,
            matchup,
            perfLookup,
            perfByPlayerId,
            liveMatchMap,
            weekStatus,
            team1Meta: team1Meta,
            team2Meta: team2Meta,
          ),
        if (flex1.isNotEmpty || flex2.isNotEmpty)
          _buildPlayerSection(
            'FLEX',
            PhosphorIcons.shuffleAngular(),
            flex1,
            flex2,
            matchup,
            perfLookup,
            perfByPlayerId,
            liveMatchMap,
            weekStatus,
            team1Meta: team1Meta,
            team2Meta: team2Meta,
          ),

        const SizedBox(height: 24),
      ],
    );
  }

  // ─── Score header ──────────────────────────────────────────────────

  Widget _buildScoreHeader({
    required Matchup matchup,
    required dynamic team1Meta,
    required dynamic team2Meta,
    required double team1Score,
    required double team2Score,
    required Color team1Color,
    required Color team2Color,
    required String weekStatus,
    required int team1Pct,
    required int team2Pct,
  }) {
    final isUpcoming = weekStatus == 'upcoming';
    final isActive = weekStatus == 'active';
    final isCompleted = weekStatus == 'completed';
    final team1Index = team1Meta != null
        ? widget.league.teams.indexOf(team1Meta) + 1
        : 0;
    final team2Index = team2Meta != null
        ? widget.league.teams.indexOf(team2Meta) + 1
        : 0;

    return Column(
      children: [
        // Live indicator
        Container(
          padding: const EdgeInsets.all(20),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: team1Color,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(color: team1Color, blurRadius: 100),
                          ],
                        ),
                        child: team1Meta != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  stringToAvatar(team1Meta.teamIcon),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.sports,
                                color: Colors.white,
                                size: 28,
                              ),
                      ),
                      Positioned(
                        bottom: 1,
                        left: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.black100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '#$team1Index',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: AppColors.black800),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (isActive)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                PhosphorIcons.record(PhosphorIconsStyle.fill),
                                color: AppColors.red100,
                                size: 12,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Live',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: AppColors.red100),
                              ),
                            ],
                          ),
                        if (isCompleted)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Final',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: AppColors.black600),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!isUpcoming)
                              Text(
                                team1Score.toStringAsFixed(0),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.black800),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                isUpcoming ? "UPCOMING" : ':',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.black600),
                              ),
                            ),
                            if (!isUpcoming)
                              Text(
                                team2Score.toStringAsFixed(0),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.black800),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: team2Color,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(color: team2Color, blurRadius: 100),
                          ],
                        ),
                        child: team2Meta != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  stringToAvatar(team2Meta.teamIcon),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.sports,
                                color: Colors.white,
                                size: 28,
                              ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.black100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '#$team2Index',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: AppColors.black800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (team1Meta?.teamName ?? 'Team 1').toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.black800,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        if (team1Meta?.userName != null)
                          Text(
                            'AKA ${team1Meta!.userName}',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: AppColors.black500),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Game ${widget.selectedGameNum}",
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                        Text(
                          widget.league.tournamentAbbr ?? '',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (team2Meta?.teamName ?? 'Team 2').toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.black800,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.right,
                        ),
                        if (team2Meta?.userName != null)
                          Text(
                            'AKA ${team2Meta!.userName}',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: AppColors.black500),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$team1Pct%',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.black800,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'WIN PROBABILITY',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.black600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '$team2Pct%',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.black800,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final total = constraints.maxWidth - 2; // minus gap
                    const minBar = 10.0;
                    final raw1 = total * team1Pct / 100;
                    final raw2 = total * team2Pct / 100;
                    final w1 = raw1 < minBar ? minBar : raw1;
                    final w2 = raw2 < minBar ? minBar : raw2;
                    final scale = total / (w1 + w2);
                    final bar1 = w1 * scale;
                    final bar2 = w2 * scale;

                    return Row(
                      children: [
                        Container(
                          width: bar1,
                          height: 5,
                          decoration: BoxDecoration(
                            color: team1Color,
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          width: bar2,
                          height: 5,
                          decoration: BoxDecoration(
                            color: team2Color,
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── TBD matchup (unscheduled playoff weeks) ───────────────────────

  Widget _buildTbdMatchup() {
    final placeholderColor = AppColors.black400;

    Widget tbdTeamBox() {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: placeholderColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Icon(Icons.question_mark, color: Colors.white38, size: 28),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  tbdTeamBox(),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'UPCOMING',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: AppColors.black600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  tbdTeamBox(),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'TBD',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.black600,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text(
                          'Game ${widget.selectedGameNum}',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                        Text(
                          widget.league.tournamentAbbr ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'TBD',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.black600,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Game selector
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.black200),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 16),
                onPressed: widget.selectedGameNum > 1
                    ? () {
                        setState(() => _selectedMatchupIndex = 0);
                        widget.onGameChanged(widget.selectedGameNum - 1);
                      }
                    : null,
                color: widget.selectedGameNum > 1
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
              Text(
                'Game ${widget.selectedGameNum}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: widget.selectedGameNum < widget.league.weeks
                    ? () {
                        setState(() => _selectedMatchupIndex = 0);
                        widget.onGameChanged(widget.selectedGameNum + 1);
                      }
                    : null,
                color: widget.selectedGameNum < widget.league.weeks
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        Text(
          'Matchups have not been decided yet',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black500),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  // ─── Player section (BATTING / BOWLING / etc.) ─────────────────────

  Widget _buildPlayerSection(
    String title,
    IconData? icon,
    List<MatchupPlayer> team1Players,
    List<MatchupPlayer> team2Players,
    Matchup matchup,
    Map<String, PlayerPerformance> perfLookup,
    Map<String, PlayerPerformance> perfByPlayerId,
    Map<String, ActiveMatch> liveMatchMap,
    String weekStatus, {
    dynamic team1Meta,
    dynamic team2Meta,
  }) {
    final maxRows = team1Players.length > team2Players.length
        ? team1Players.length
        : team2Players.length;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),

          // Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(icon, color: AppColors.black800, size: 20),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: AppColors.black800),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Player rows
          for (int i = 0; i < maxRows; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: _buildPlayerRow(
                i < team1Players.length ? team1Players[i] : null,
                i < team2Players.length ? team2Players[i] : null,
                matchup,
                perfLookup,
                perfByPlayerId,
                liveMatchMap,
                weekStatus,
                team1Meta: team1Meta,
                team2Meta: team2Meta,
              ),
            ),
        ],
      ),
    );
  }

  // ─── Single head-to-head player row ────────────────────────────────

  /// Abbreviate a full name: "Trent Boult" → "T. Boult"
  String _abbreviatePlayerName(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length <= 1) return fullName;
    final lastName = parts.last;
    final initials = parts
        .sublist(0, parts.length - 1)
        .map((p) => '${p[0]}.')
        .join(' ');
    return '$initials $lastName';
  }

  /// Build stat line for a player based on their slot and performance
  String _buildStatLine(MatchupPlayer player, PlayerPerformance? perf) {
    if (perf == null) return '';
    final slot = player.slot.toLowerCase();

    if (slot.startsWith('allrounder') || slot.startsWith('all')) {
      final parts = <String>[];
      if ((perf.ballsFaced ?? 0) > 0) {
        parts.add('${perf.runsScored ?? 0} off ${perf.ballsFaced ?? 0}');
      }
      if ((perf.ballsBowled ?? 0) > 0) {
        final overs = (perf.ballsBowled ?? 0) ~/ 6;
        final balls = (perf.ballsBowled ?? 0) % 6;
        parts.add(
          '${perf.wicketsTaken ?? 0}/${perf.runsConceded ?? 0} ($overs.$balls)',
        );
      }
      return parts.join(' & ');
    }
    if (slot.startsWith('bowl')) {
      if ((perf.ballsBowled ?? 0) > 0) {
        final overs = (perf.ballsBowled ?? 0) ~/ 6;
        final balls = (perf.ballsBowled ?? 0) % 6;
        return '${perf.wicketsTaken ?? 0}/${perf.runsConceded ?? 0} ($overs.$balls)';
      }
      return '';
    }
    // batting / wicket / flex
    if ((perf.ballsFaced ?? 0) > 0) {
      return '${perf.runsScored ?? 0} off ${perf.ballsFaced ?? 0}';
    }
    return '';
  }

  PlayerPerformance? _lookupPerf(
    MatchupPlayer? player,
    Map<String, PlayerPerformance> perfLookup,
    Map<String, PlayerPerformance> perfByPlayerId,
  ) {
    if (player == null) return null;
    if (player.performanceId != null) {
      final perf = perfLookup[player.performanceId!];
      if (perf != null) return perf;
    }
    return perfByPlayerId[player.playerId];
  }

  /// Convert embedded [MatchupPlayerPerformance] to [PlayerPerformance] for
  /// stat-line rendering in non-active weeks.
  PlayerPerformance? _embeddedPerf(MatchupPlayer? player) {
    final p = player?.performance;
    if (p == null) return null;
    return PlayerPerformance(
      playerPerformanceId: '',
      playerId: player!.playerId,
      teamId: '',
      runsScored: p.runsScored,
      ballsFaced: p.ballsFaced,
      fours: p.fours,
      sixes: p.sixes,
      ballsBowled: p.ballsBowled,
      runsConceded: p.runsConceded,
      wicketsTaken: p.wicketsTaken,
      catches: p.catches,
      runOuts: p.runOuts,
      catchesDropped: p.catchesDropped,
      notOut: p.notOut,
    );
  }

  Widget _buildPlayerRow(
    MatchupPlayer? player1,
    MatchupPlayer? player2,
    Matchup matchup,
    Map<String, PlayerPerformance> perfLookup,
    Map<String, PlayerPerformance> perfByPlayerId,
    Map<String, ActiveMatch> liveMatchMap,
    String weekStatus, {
    dynamic team1Meta,
    dynamic team2Meta,
  }) {
    final isActive = weekStatus == 'active';
    final rules = widget.league.scoringRules;

    double getPlayerPoints(MatchupPlayer? player, MatchupTeam team) {
      if (player == null) return 0;
      if (!isActive) return player.fantasyPoints ?? 0;
      final perf = _lookupPerf(player, perfLookup, perfByPlayerId);
      if (perf == null) return 0;
      final categories = _applicableCategories(player.slot, player.role);
      return calculatePlayerPoints(
        perf,
        rules,
        categories,
        playerId: player.playerId,
        captainId: team.captain,
        viceCaptainId: team.viceCaptain,
      );
    }

    final p1Points = getPlayerPoints(player1, matchup.team1);
    final p2Points = getPlayerPoints(player2, matchup.team2);
    final p1Perf = isActive
        ? _lookupPerf(player1, perfLookup, perfByPlayerId)
        : _embeddedPerf(player1);
    final p2Perf = isActive
        ? _lookupPerf(player2, perfLookup, perfByPlayerId)
        : _embeddedPerf(player2);

    final isCaptain1 = player1 != null && player1.playerId == matchup.team1.captain;
    final isViceCaptain1 = player1 != null && player1.playerId == matchup.team1.viceCaptain;
    final isCaptain2 = player2 != null && player2.playerId == matchup.team2.captain;
    final isViceCaptain2 = player2 != null && player2.playerId == matchup.team2.viceCaptain;

    return Row(
      children: [
        // Left player
        Expanded(
          child: player1 != null
              ? _buildPlayerCard(
                  player1,
                  p1Perf,
                  p1Points,
                  isCaptain1,
                  isViceCaptain1,
                  liveMatchMap: liveMatchMap,
                  isLeft: true,
                  teamMeta: team1Meta,
                )
              : Container(color: AppColors.black200),
        ),
        const SizedBox(width: 5),
        // Right player
        Expanded(
          child: player2 != null
              ? _buildPlayerCard(
                  player2,
                  p2Perf,
                  p2Points,
                  isCaptain2,
                  isViceCaptain2,
                  liveMatchMap: liveMatchMap,
                  isLeft: false,
                  teamMeta: team2Meta,
                )
              : Container(color: AppColors.black200),
        ),
      ],
    );
  }

  String _getOpponentAbbr(MatchupPlayer player, Map<String, ActiveMatch> liveMatchMap) {
    if (player.matchId == null) return '';
    final match = liveMatchMap[player.matchId!];
    if (match == null) return '';
    // If player's team is the home team, opponent is away, and vice versa
    final playerTeam = player.teamName.toLowerCase();
    if (match.homeTeamName?.toLowerCase() == playerTeam) {
      return _abbreviate(match.awayTeamName);
    } else {
      return _abbreviate(match.homeTeamName);
    }
  }

  Widget _buildPlayerCard(
    MatchupPlayer player,
    PlayerPerformance? perf,
    double points,
    bool isCaptain,
    bool isViceCaptain, {
    required bool isLeft,
    required Map<String, ActiveMatch> liveMatchMap,
    dynamic teamMeta,
  }) {
    final displayName = _abbreviatePlayerName(player.fullName ?? player.name);
    final teamAbbr = player.teamAbbreviation ?? _abbreviate(player.teamName);
    final opponentAbbr = _getOpponentAbbr(player, liveMatchMap);
    final statLine = _buildStatLine(player, perf);

    // Determine border color based on live match status
    Color? borderColor;
    if (player.matchId != null) {
      final match = liveMatchMap[player.matchId];
      if (match != null && match.status == 'LIVE' && perf != null) {
        final isBatting = (perf.notOut != false) && (perf.ballsFaced ?? 0) > 0;
        final isBowling = (perf.ballsBowled ?? 0) > 0;
        if (isBatting || isBowling) {
          borderColor = AppColors.green300;
        } else {
          // Determine which team is batting in this match
          final homeBalls = match.homeTeamBalls ?? 0;
          final awayBalls = match.awayTeamBalls ?? 0;
          final battingTeamId = (awayBalls == 0) ? match.homeTeamId : match.awayTeamId;
          final bowlingTeamId = (battingTeamId == match.homeTeamId) ? match.awayTeamId : match.homeTeamId;
          if (perf.teamId == bowlingTeamId) {
            borderColor = AppColors.yellow300;
          } else {
            borderColor = AppColors.black700;
          }
        }
      } else if (match != null && match.status == 'LIVE') {
        // In a live match but no performance data yet
        borderColor = AppColors.black700;
      }
    }

    // Build the match info line: "teamAbbr  statLine" with teamAbbr bold and closest to edge
    Widget matchInfoRow() {
      final abbrWidget = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: teamAbbr,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.black700,
                fontWeight: FontWeight.w600
              )
            ),
            if (opponentAbbr.isNotEmpty)
              TextSpan(
                text: ' v $opponentAbbr',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.black600,
                )
              ),
          ],
        ),
      );
      final statWidget = statLine.isNotEmpty
          ? Text(
              statLine,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.black600),
              overflow: TextOverflow.ellipsis,
            )
          : null;

      if (isLeft) {
        return Row(
          children: [
            abbrWidget,
            if (statWidget != null) ...[
              const SizedBox(width: 4),
              Flexible(child: statWidget),
            ],
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (statWidget != null) ...[
              Flexible(child: statWidget),
              const SizedBox(width: 4),
            ],
            abbrWidget,
          ],
        );
      }
    }

    // Points + projection column
    Widget pointsColumn() {
      final c = perf != null
          ? completionRatio(player.slot, player.role, perf)
          : 0.0;

      // Apply captain/vc multiplier to the projection baseline
      double adjustedPpg = player.projectedPpg;
      if (isCaptain || isViceCaptain) {
        for (final rule in widget.league.scoringRules) {
          if (rule.mode != RuleMode.multiplier) continue;
          final stat = rule.stat.toLowerCase();
          if (isCaptain && stat == 'captaincy multiplier') {
            adjustedPpg *= (rule.multiplier ?? 1);
          } else if (isViceCaptain && stat == 'vice captaincy multiplier') {
            adjustedPpg *= (rule.multiplier ?? 1);
          }
        }
      }

      final projected = projectedFantasyScore(points, adjustedPpg, c);
      final initial = adjustedPpg;
      final Widget? caret;
      if (projected > initial) {
        caret = Icon(PhosphorIcons.caretUp(PhosphorIconsStyle.fill), color: AppColors.green300, size: 16);
      } else if (projected < initial) {
        caret = Icon(PhosphorIcons.caretDown(PhosphorIconsStyle.fill), color: AppColors.red100, size: 16);
      } else {
        caret = null;
      }
      return Column(
        crossAxisAlignment: isLeft
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (caret != null && isLeft) caret,
              Text(
                perf != null ? points.toStringAsFixed(0) : '-',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: perf != null ? Colors.white : AppColors.black500,
                ),
              ),
              if (caret != null && !isLeft) caret,
            ],
          ),
          Text(
            projected.toStringAsFixed(0),
            style: TextStyle(color: AppColors.black500, fontSize: 11),
          ),
        ],
      );
    }

    // Name + badge row
    Widget nameRow() {
      final nameWidget = Flexible(
        child: Text(
          displayName,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
          overflow: TextOverflow.ellipsis,
        ),
      );
      final badge = (isCaptain || isViceCaptain)
          ? _buildBadge(isCaptain ? 'C' : 'VC')
          : null;

      if (isLeft) {
        return Row(
          children: [
            nameWidget,
            if (badge != null) ...[const SizedBox(width: 4), badge],
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (badge != null) ...[badge, const SizedBox(width: 4)],
            nameWidget,
          ],
        );
      }
    }

    final cardContent = isLeft
        ? Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameRow(),
                    const SizedBox(height: 2),
                    matchInfoRow(),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              pointsColumn(),
            ],
          )
        : Row(
            children: [
              pointsColumn(),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    nameRow(),
                    const SizedBox(height: 2),
                    matchInfoRow(),
                  ],
                ),
              ),
            ],
          );

    return GestureDetector(
      onTap: () => showPlayerStatsSheet(
        context,
        playerId: player.playerId,
        playerName: player.fullName ?? player.name,
        defaultSeasonId: widget.league.seasonId,
        fantasyTeamName: teamMeta?.teamName,
        fantasyTeamIcon: teamMeta?.teamIcon,
        fantasyTeamColor: teamMeta?.teamColor != null
            ? stringToColor(teamMeta.teamColor)
            : null,
        scoringRules: widget.league.scoringRules,
        captainId: isCaptain ? player.playerId : null,
        viceCaptainId: isViceCaptain ? player.playerId : null,
        initialTab: 1,
        leagueId: widget.league.id,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: isLeft ? 15 : 10,
          right: isLeft ? 10 : 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(5),
          border: borderColor != null
              ? Border(
                  left: isLeft
                      ? BorderSide(color: borderColor, width: 5)
                      : BorderSide.none,
                  right: !isLeft
                      ? BorderSide(color: borderColor, width: 5)
                      : BorderSide.none,
                )
              : null,
        ),
        child: cardContent,
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.black400,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.black800)
      ),
    );
  }

  // ─── Helpers ───────────────────────────────────────────────────────

  dynamic _findTeamMeta(String fantasyTeamId) {
    return widget.league.teams.cast<dynamic>().firstWhere(
      (t) => t.id == fantasyTeamId,
      orElse: () => null,
    );
  }

  Widget _buildChipIcon(dynamic teamMeta) {
    if (teamMeta != null) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: stringToColor(teamMeta.teamColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            stringToAvatar(teamMeta.teamIcon),
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: AppColors.black400,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(Icons.sports, color: Colors.white, size: 10),
    );
  }

  String _abbreviate(String? name) {
    if (name == null || name.isEmpty) return '?';
    final words = name.trim().split(' ');
    if (words.length >= 2) {
      return words
          .map((w) => w.isNotEmpty ? w[0] : '')
          .take(3)
          .join()
          .toUpperCase();
    }
    return name.substring(0, name.length >= 3 ? 3 : name.length).toUpperCase();
  }

  String _slotCategory(String slot) {
    final s = slot.toLowerCase();
    if (s.startsWith('bat')) return 'batting';
    if (s.startsWith('bowl')) return 'bowling';
    if (s.startsWith('wicket')) return 'wicket';
    if (s.startsWith('all')) return 'allrounder';
    if (s.startsWith('flex')) return 'flex';
    return 'other';
  }

  Set<String> _applicableCategories(String slot, String role) {
    final s = slot.toLowerCase();
    if (s.startsWith('all')) return {'batting', 'bowling', 'fielding'};
    if (s.startsWith('bat') || s.startsWith('wicket'))
      return {'batting', 'fielding'};
    if (s.startsWith('bowl')) return {'bowling', 'fielding'};
    if (s.startsWith('flex')) {
      final r = role.toLowerCase();
      if (r.contains('bat') || r.contains('keeper') || r.contains('wicket'))
        return {'batting', 'fielding'};
      if (r.contains('bowl')) return {'bowling', 'fielding'};
      return {'batting', 'bowling', 'fielding'};
    }
    return {};
  }
}
