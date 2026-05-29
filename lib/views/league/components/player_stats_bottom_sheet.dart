import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/fantasy_matchup/scoring_utils.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/live_match/active_match_model.dart' as live;
import 'package:sixers/backend/live_match/live_match_provider.dart';
import 'package:sixers/backend/player_stats/game_log_model.dart';
import 'package:sixers/backend/player_stats/player_stats_model.dart';
import 'package:sixers/backend/player_stats/player_stats_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/helpers.dart';

class PlayerStatsBottomSheet extends ConsumerStatefulWidget {
  final String playerId;
  final String playerName;
  final String? defaultSeasonId;
  final String? fantasyTeamName;
  final String? fantasyTeamIcon;
  final Color? fantasyTeamColor;
  final List<LeagueScoringRule> scoringRules;
  final String? captainId;
  final String? viceCaptainId;
  final int initialTab;
  final String? leagueId;

  const PlayerStatsBottomSheet({
    super.key,
    required this.playerId,
    required this.playerName,
    this.defaultSeasonId,
    this.fantasyTeamName,
    this.fantasyTeamIcon,
    this.fantasyTeamColor,
    this.scoringRules = const [],
    this.captainId,
    this.viceCaptainId,
    this.initialTab = 0,
    this.leagueId,
  });

  @override
  ConsumerState<PlayerStatsBottomSheet> createState() =>
      _PlayerStatsBottomSheetState();
}

class _PlayerStatsBottomSheetState
    extends ConsumerState<PlayerStatsBottomSheet>
    with TickerProviderStateMixin {
  PlayerStats? _stats;
  bool _loading = true;
  String? _error;
  String? _selectedSeasonId;
  late final TabController _tabController;

  // Game log state
  GameLogResponse? _gameLog;
  bool _gameLogLoading = false;
  String? _gameLogError;
  int? _selectedGameIndex;
  bool _gameLogFetched = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTab,
    );
    _tabController.addListener(_onTabChanged);
    _fetchStats();
    if (widget.initialTab == 1) {
      _fetchGameLog();
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.index == 1 && !_gameLogFetched) {
      _fetchGameLog();
    }
  }

  Future<void> _fetchStats() async {
    try {
      final stats = await PlayerStatsService().getPlayerStats(widget.playerId);
      if (!mounted) return;
      setState(() {
        _stats = stats;
        _loading = false;
        if (stats != null && stats.seasons.isNotEmpty) {
          _selectedSeasonId =
              stats.seasons
                  .where((s) => s.seasonId == widget.defaultSeasonId)
                  .firstOrNull
                  ?.seasonId ??
              stats.seasons.first.seasonId;
        }
      });
    } catch (e, st) {
      debugPrint('PlayerStats error: $e\n$st');
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _fetchGameLog() async {
    _gameLogFetched = true;
    setState(() {
      _gameLogLoading = true;
      _gameLogError = null;
    });
    try {
      final gameLog = await PlayerStatsService()
          .getPlayerPerformances(widget.playerId, leagueId: widget.leagueId);
      if (!mounted) return;
      setState(() {
        _gameLog = gameLog;
        _gameLogLoading = false;
        if (gameLog != null && gameLog.performances.isNotEmpty) {
          _selectedGameIndex = gameLog.performances.length - 1;
        }
      });
    } catch (e, st) {
      debugPrint('GameLog error: $e\n$st');
      if (!mounted) return;
      setState(() {
        _gameLogError = e.toString();
        _gameLogLoading = false;
      });
    }
  }

  List<SeasonStats> get _tournamentSeasons {
    if (_stats == null || _selectedSeasonId == null) return [];
    final current = _stats!.seasons
        .where((s) => s.seasonId == _selectedSeasonId)
        .firstOrNull;
    if (current == null || current.tournamentName == null)
      return _stats!.seasons;
    return _stats!.seasons
        .where((s) => s.tournamentName == current.tournamentName)
        .toList();
  }

  SeasonStats? get _selectedSeason {
    if (_stats == null || _selectedSeasonId == null) return null;
    return _stats!.seasons
        .where((s) => s.seasonId == _selectedSeasonId)
        .firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.black100,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          clipBehavior: Clip.antiAlias,
          child: _loading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : _error != null
              ? Center(
                  child: Text(
                    'Failed to load stats',
                    style: TextStyle(color: AppColors.black600),
                  ),
                )
              : _stats != null && _selectedSeason != null
              ? _buildContent(scrollController)
              : Center(
                  child: Text(
                    'No stats available',
                    style: TextStyle(color: AppColors.black600),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildContent(ScrollController scrollController) {
    final stats = _stats!;
    final season = _selectedSeason!;
    return Column(
      children: [
        // Non-scrollable header area
        Column(
          children: [
            _buildHeader(stats, season),
            // Tab bar matching LeagueTabSelector style
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF101010),
              ),
              padding: const EdgeInsets.all(5),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.black300,
                  borderRadius: BorderRadius.circular(5),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.black800,
                unselectedLabelColor: AppColors.black600,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                tabs: const [
                  Tab(text: 'Stats'),
                  Tab(text: 'Game Log'),
                  Tab(text: 'Transactions'),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        // Swipeable tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildStatsTab(season, scrollController),
              _buildGameLogTab(),
              _buildTransactionsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsTab(SeasonStats season, ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '"%" Represent Percentile Rankings',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.black500),
              ),
            ),
            if (_tournamentSeasons.length > 1)
              _buildSeasonDropdown(_tournamentSeasons),
          ],
        ),

        const SizedBox(height: 20),

        // For bowlers, show bowling first; otherwise batting first
        ..._buildOrderedStatsSections(season),

        const SizedBox(height: 32),
      ],
    );
  }

  List<Widget> _buildBattingSection(SeasonStats season) {
    if (season.batting == null) return [];
    return [
      Text(
        'BATTING',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.w700,
            ),
      ),
      const SizedBox(height: 12),
      _buildStatsGrid([
        if (season.batting!.matchesBatted != null)
          _StatItem('Matches', season.batting!.matchesBatted!),
        if (season.batting!.totalRuns != null)
          _StatItem('Runs', season.batting!.totalRuns!),
        if (season.batting!.halfCenturies != null)
          _StatItem('Half Centuries', season.batting!.halfCenturies!),
        if (season.batting!.centuries != null)
          _StatItem('Centuries', season.batting!.centuries!),
        if (season.batting!.strikeRate != null)
          _StatItem('Strike Rate', season.batting!.strikeRate!),
        if (season.batting!.battingAverage != null)
          _StatItem('Average', season.batting!.battingAverage!),
      ]),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _buildBowlingSection(SeasonStats season) {
    if (season.bowling == null) return [];
    return [
      Text(
        'BOWLING',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.w700,
            ),
      ),
      const SizedBox(height: 12),
      _buildStatsGrid([
        if (season.bowling!.matchesBowled != null)
          _StatItem('Matches', season.bowling!.matchesBowled!),
        if (season.bowling!.totalWickets != null)
          _StatItem('Wickets', season.bowling!.totalWickets!),
        if (season.bowling!.threeWicketHauls != null)
          _StatItem('3-wicket hauls', season.bowling!.threeWicketHauls!),
        if (season.bowling!.fiveWicketHauls != null)
          _StatItem('5-wicket hauls', season.bowling!.fiveWicketHauls!),
        if (season.bowling!.bowlingAverage != null)
          _StatItem('Average', season.bowling!.bowlingAverage!),
        if (season.bowling!.bowlingEconomy != null)
          _StatItem('Economy', season.bowling!.bowlingEconomy!),
      ]),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _buildOrderedStatsSections(SeasonStats season) {
    final primaryRole = _stats?.seasons.isNotEmpty == true
        ? _stats!.seasons.first.role
        : season.role;
    final r = primaryRole.toLowerCase();
    final isBowler = r.contains('bowl') &&
        !r.contains('allrounder') &&
        !r.contains('all-rounder');
    if (isBowler) {
      return [
        ..._buildBowlingSection(season),
        ..._buildBattingSection(season),
      ];
    }
    return [
      ..._buildBattingSection(season),
      ..._buildBowlingSection(season),
    ];
  }

  /// Convert a [GameLogPerformance] to a [live.PlayerPerformance] for scoring.
  live.PlayerPerformance _toLivePerf(GameLogPerformance g) {
    return live.PlayerPerformance(
      playerPerformanceId: g.matchId,
      playerId: widget.playerId,
      teamId: '',
      runsScored: g.runsScored,
      ballsFaced: g.ballsFaced,
      fours: g.fours,
      sixes: g.sixes,
      ballsBowled: g.ballsBowled,
      runsConceded: g.runsConceded,
      wicketsTaken: g.wicketsTaken,
      catches: g.catches,
      runOuts: g.runOuts,
      catchesDropped: g.catchesDropped,
      notOut: g.notOut,
    );
  }

  /// All scoring categories — the game log evaluates every rule and lets
  /// the actual stat values determine which ones produce points (0 stats = 0
  /// points). This avoids mismatches between role strings and slot-based
  /// category filtering used on the matchup page.
  static const Set<String> _allCategories = {'batting', 'bowling', 'fielding'};

  /// Format balls to overs.balls display (e.g. 24 balls → "4.0", 26 balls → "4.2").
  String _ballsToOvers(int balls) {
    final overs = balls ~/ 6;
    final remaining = balls % 6;
    return '$overs.$remaining';
  }

  /// Merge live match data into the game log performances.
  /// If any active match contains a performance for this player, update or
  /// append the corresponding entry so the UI stays in sync with the
  /// subscription.
  List<GameLogPerformance> _mergeWithLiveData(
      List<GameLogPerformance> apiPerfs) {
    final liveMatchMap = ref.watch(liveMatchesProvider).value;
    if (liveMatchMap == null || liveMatchMap.isEmpty) return apiPerfs;

    final merged = List<GameLogPerformance>.from(apiPerfs);

    for (final match in liveMatchMap.values) {
      // Find this player's performance in the live match
      final livePerf = match.playerPerformances
          .where((p) => p.playerId == widget.playerId)
          .firstOrNull;
      if (livePerf == null) continue;

      // Build a GameLogPerformance from the live data
      final liveEntry = GameLogPerformance(
        matchId: match.id,
        matchDate: match.matchDate,
        matchStatus: match.status,
        homeTeamName: match.homeTeamName,
        homeTeamImage: match.homeTeamImage,
        homeTeamAbbreviation: match.homeTeamAbbreviation,
        awayTeamName: match.awayTeamName,
        awayTeamImage: match.awayTeamImage,
        awayTeamAbbreviation: match.awayTeamAbbreviation,
        runsScored: livePerf.runsScored ?? 0,
        ballsFaced: livePerf.ballsFaced ?? 0,
        fours: livePerf.fours ?? 0,
        sixes: livePerf.sixes ?? 0,
        ballsBowled: livePerf.ballsBowled,
        runsConceded: livePerf.runsConceded,
        wicketsTaken: livePerf.wicketsTaken,
        catches: livePerf.catches ?? 0,
        runOuts: livePerf.runOuts ?? 0,
        catchesDropped: livePerf.catchesDropped ?? 0,
        notOut: livePerf.notOut ?? true,
      );

      // Replace existing entry or append
      final idx = merged.indexWhere((p) => p.matchId == match.id);
      if (idx != -1) {
        merged[idx] = liveEntry;
      } else {
        merged.add(liveEntry);
      }
    }

    return merged;
  }

  Widget _buildGameLogTab() {
    if (_gameLogLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }
    if (_gameLogError != null) {
      return Center(
        child: Text(
          'Failed to load game log',
          style: TextStyle(color: AppColors.black600),
        ),
      );
    }

    final role = _gameLog?.role ?? _selectedSeason?.role ?? '';
    final performances = _mergeWithLiveData(_gameLog?.performances ?? []);

    if (performances.isEmpty) {
      return Center(
        child: Text(
          'No game data available',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black500),
        ),
      );
    }

    // Auto-select the latest game if nothing is selected yet
    if (_selectedGameIndex == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _selectedGameIndex = performances.length - 1;
          });
        }
      });
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        if (widget.scoringRules.isNotEmpty && _selectedGameIndex != null)
          _buildScoreBreakdown(performances, performances, role),
        const SizedBox(height: 24),
        _buildGameLogTable(performances, performances, role),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildScoreBreakdown(
    List<GameLogPerformance> allPerfs,
    List<GameLogPerformance> playedPerfs,
    String role,
  ) {
    final selectedPerf = allPerfs[_selectedGameIndex!];
    final livePerf = _toLivePerf(selectedPerf);
    final categories = _allCategories;
    final breakdown = calculateScoreBreakdown(
      livePerf,
      widget.scoringRules,
      categories,
      playerId: widget.playerId,
      captainId: widget.captainId,
      viceCaptainId: widget.viceCaptainId,
    );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SCORE BREAKDOWN',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.black800,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              _buildGameDropdown(allPerfs, playedPerfs),
            ],
          ),
          const SizedBox(height: 10),
          // Column headers
          _breakdownHeaderRow(),
          const Divider(color: Color(0xFF333333), height: 1),
          // Rule rows
          ...breakdown.items.map((item) => _breakdownRow(
                item.label,
                item.statDisplay,
                item.ptsPerDisplay,
                item.points,
              )),
          // Subtotal
          const Divider(color: Color(0xFF333333), height: 1),
          _breakdownTotalRow('Subtotal', breakdown.subtotal),
          // Multipliers
          if (breakdown.multipliers.isNotEmpty) ...[
            const Divider(color: Color(0xFF333333), height: 1),
            ...breakdown.multipliers.map((item) => _breakdownRow(
                  item.label,
                  item.statDisplay,
                  item.ptsPerDisplay,
                  item.points,
                )),
          ],
          // Total
          const Divider(color: Color(0xFF333333), height: 1),
          _breakdownTotalRow('Total', breakdown.total, isBold: true),
        ],
      ),
    );
  }

  Widget _buildGameDropdown(
    List<GameLogPerformance> allPerfs,
    List<GameLogPerformance> playedPerfs,
  ) {
    // Build dropdown items for all non-upcoming games
    final items = <DropdownMenuItem<int>>[];
    for (int i = 0; i < allPerfs.length; i++) {
      final suffix = allPerfs[i].matchStatus == 'LIVE' ? ' (Live)' : '';
      items.add(DropdownMenuItem(
        value: i,
        child: Text('Game ${i + 1}$suffix  '),
      ));
    }

    return DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _selectedGameIndex,
          isDense: true,
          dropdownColor: AppColors.black300,
          icon: PhosphorIcon(
            PhosphorIcons.caretDown(),
            color: AppColors.black800,
            size: 16,
          ),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.black800,
                fontWeight: FontWeight.w600,
              ),
          items: items,
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedGameIndex = value);
            }
          },
        ),
      );
  }

  Widget _breakdownHeaderRow() {
    final style = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(color: AppColors.black500);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text('Scoring Category', style: style)),
          Expanded(
              flex: 2,
              child: Text('Stat', style: style, textAlign: TextAlign.center)),
          Expanded(
              flex: 2,
              child:
                  Text('Pts. Per', style: style, textAlign: TextAlign.center)),
          Expanded(
              flex: 2,
              child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Points', style: style, textAlign: TextAlign.right),
                  )),
        ],
      ),
    );
  }

  Widget _breakdownRow(
      String label, String stat, String ptsPer, double points) {
    final labelStyle = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(color: AppColors.black800);
    final valueStyle = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(color: AppColors.black600);
    final pointsStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.black800,
          fontWeight: FontWeight.w700,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(label, style: labelStyle)),
          Expanded(
              flex: 2,
              child: Text(stat, style: valueStyle, textAlign: TextAlign.center)),
          Expanded(
              flex: 2,
              child: Text(ptsPer,
                  style: valueStyle, textAlign: TextAlign.center)),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  points.toInt().toString(),
                  style: pointsStyle,
                  textAlign: TextAlign.right,
                ),
              )),
        ],
      ),
    );
  }

  Widget _breakdownTotalRow(String label, double value,
      {bool isBold = false}) {
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.black800,
          fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 8, child: Text(label, style: style)),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                value.toInt().toString(),
                style: style,
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameLogTable(
    List<GameLogPerformance> allPerfs,
    List<GameLogPerformance> playedPerfs,
    String role,
  ) {
    final r = role.toLowerCase();
    final isBatsman = r.contains('bat') || r.contains('keeper') || r.contains('wicket');
    final isBowler = r.contains('bowl');
    final isAllRounder = r.contains('allrounder') || r.contains('all-rounder');
    final categories = _allCategories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GAME LOG',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.black800,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.black200,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // Table header
              _gameLogHeaderRow(isBatsman, isBowler, isAllRounder),
              // Table rows
              ...List.generate(playedPerfs.length, (i) {
                final perf = playedPerfs[i];
                return _gameLogRow(
                  i + 1,
                  perf,
                  isBatsman,
                  isBowler,
                  isAllRounder,
                  categories,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _gameLogHeaderRow(bool isBatsman, bool isBowler, bool isAllRounder) {
    final style = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(color: AppColors.black500, fontSize: 11);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF333333), width: 1)),
      ),
      child: Row(
        children: [
          SizedBox(width: 24, child: Text('#', style: style)),
          Expanded(
              flex: 2,
              child: Text('Opp', style: style)),
          Expanded(
              flex: 2,
              child: Text('Pts', style: style, textAlign: TextAlign.left)),
          Expanded(
              flex: 3,
              child: Text('Score', style: style, textAlign: TextAlign.left)),
          if (isBatsman || isAllRounder) ...[
            Expanded(
                flex: 1,
                child: Text('4s', style: style, textAlign: TextAlign.center)),
            Expanded(
                flex: 1,
                child: Text('6s', style: style, textAlign: TextAlign.center)),
          ],
          if (isBatsman || isAllRounder)
            Expanded(
                flex: 2,
                child: Text('S/R', style: style, textAlign: TextAlign.right)),
          if (isBowler)
            Expanded(
                flex: 2,
                child: Text('Wkts', style: style, textAlign: TextAlign.center)),
          if (isBowler || isAllRounder)
            Expanded(
                flex: 2,
                child: Text('Econ', style: style, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _gameLogRow(
    int gameNum,
    GameLogPerformance perf,
    bool isBatsman,
    bool isBowler,
    bool isAllRounder,
    Set<String> categories,
  ) {
    // Determine opponent abbreviation
    final teamAbbr = _gameLog!.teamAbbreviation ?? '';
    final isHome = perf.homeTeamAbbreviation == teamAbbr;
    final oppAbbr = isHome
        ? (perf.awayTeamAbbreviation ?? '??')
        : (perf.homeTeamAbbreviation ?? '??');

    // Calculate fantasy points
    double pts = 0;
    if (widget.scoringRules.isNotEmpty) {
      final livePerf = _toLivePerf(perf);
      pts = calculatePlayerPoints(
        livePerf,
        widget.scoringRules,
        categories,
        playerId: widget.playerId,
        captainId: widget.captainId,
        viceCaptainId: widget.viceCaptainId,
      );
    }

    // Format batting score: runs (overs.balls)
    String battingScore = '${perf.runsScored} (${_ballsToOvers(perf.ballsFaced)})';

    // Format bowling score: wickets-runs (overs.balls)
    String bowlingScore = '';
    if (perf.ballsBowled != null && perf.ballsBowled! > 0) {
      bowlingScore =
          '${perf.wicketsTaken ?? 0}-${perf.runsConceded ?? 0} (${_ballsToOvers(perf.ballsBowled!)})';
    }

    // Strike rate
    final sr = perf.ballsFaced > 0
        ? ((perf.runsScored / perf.ballsFaced) * 100).toStringAsFixed(0)
        : '-';

    // Economy
    final econ = (perf.ballsBowled ?? 0) > 0
        ? ((perf.runsConceded ?? 0) / (perf.ballsBowled! / 6))
            .toStringAsFixed(1)
        : '-';

    final textStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: AppColors.black700, fontSize: 12);
    final boldStyle = textStyle?.copyWith(
        color: AppColors.black800, fontWeight: FontWeight.w700);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF262626), width: 1)),
      ),
      child: isAllRounder
          ? _allRounderRow(
              gameNum, oppAbbr, pts, battingScore, bowlingScore, perf, sr, econ,
              textStyle!, boldStyle!)
          : Row(
              children: [
                SizedBox(
                    width: 24, child: Text('$gameNum', style: textStyle)),
                Expanded(
                    flex: 2,
                    child: Text(oppAbbr, style: boldStyle)),
                Expanded(
                    flex: 2,
                    child: Text(pts.toInt().toString(),
                        style: boldStyle, textAlign: TextAlign.left)),
                Expanded(
                    flex: 3,
                    child: Text(
                      isBowler ? bowlingScore : battingScore,
                      style: textStyle,
                      textAlign: TextAlign.left,
                    )),
                if (isBatsman) ...[
                  Expanded(
                      flex: 1,
                      child: Text('${perf.fours}',
                          style: textStyle, textAlign: TextAlign.center)),
                  Expanded(
                      flex: 1,
                      child: Text('${perf.sixes}',
                          style: textStyle, textAlign: TextAlign.center)),
                  Expanded(
                      flex: 2,
                      child:
                          Text(sr, style: textStyle, textAlign: TextAlign.right)),
                ],
                if (isBowler) ...[
                  Expanded(
                      flex: 2,
                      child: Text('${perf.wicketsTaken ?? 0}',
                          style: textStyle, textAlign: TextAlign.center)),
                  Expanded(
                      flex: 2,
                      child: Text(econ,
                          style: textStyle, textAlign: TextAlign.right)),
                ],
              ],
            ),
    );
  }

  Widget _allRounderRow(
    int gameNum,
    String oppAbbr,
    double pts,
    String battingScore,
    String bowlingScore,
    GameLogPerformance perf,
    String sr,
    String econ,
    TextStyle textStyle,
    TextStyle boldStyle,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 24, child: Text('$gameNum', style: textStyle)),
        Expanded(
            flex: 2,
            child: Text(oppAbbr, style: boldStyle)),
        Expanded(
            flex: 2,
            child: Text(pts.toInt().toString(),
                style: boldStyle, textAlign: TextAlign.left)),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(battingScore, style: textStyle),
              if (bowlingScore.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(bowlingScore, style: textStyle),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('${perf.fours}',
              style: textStyle, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 1,
          child: Text('${perf.sixes}',
              style: textStyle, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(sr, style: textStyle),
              if (econ != '-')
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(econ, style: textStyle),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionsTab() {
    return Center(
      child: Text(
        'Transactions coming soon',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.black500),
      ),
    );
  }

  Widget _buildSeasonDropdown(List<SeasonStats> seasons) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedSeasonId,
          isDense: true,
          dropdownColor: AppColors.black300,
          icon: PhosphorIcon(
            PhosphorIcons.caretDown(),
            color: AppColors.black800,
            size: 16,
          ),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.black800,
            fontWeight: FontWeight.w600,
          ),
          items: seasons.map((s) {
            final abbr = s.tournamentAbbreviation ?? s.tournamentName ?? '';
            final label =  '${s.endYear}  ';
            return DropdownMenuItem(value: s.seasonId, child: Text(label));
          }).toList(),
          onChanged: (value) {
            if (value != null && value != _selectedSeasonId) {
              setState(() => _selectedSeasonId = value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeader(PlayerStats stats, SeasonStats season) {
    final primaryRole = stats.seasons.isNotEmpty ? stats.seasons.first.role : season.role;
    final role = roleIconAndColor(primaryRole);
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          height: 40,
          color: role.color,
          child: CustomPaint(
            painter: _OpaquePatternPainter(
              image: rolePatternImage(primaryRole),
            ),
            size: Size.infinite,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Player image
                  Container(
                    width: 47,
                    height: 47,
                    decoration: BoxDecoration(
                      color: AppColors.black400,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.black100, width: 2),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: stats.image.isNotEmpty
                          ? Image.network(
                              stats.image,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.person,
                                color: Colors.white38,
                                size: 32,
                              ),
                            )
                          : const Icon(Icons.person, color: Colors.white38, size: 32),
                    ),
                  ),
                  const Spacer(),
                  // Fantasy team info
                  if (widget.fantasyTeamName != null)
                    Container(
                      width: 47,
                      height: 47,
                      decoration: BoxDecoration(
                        color: widget.fantasyTeamColor ?? AppColors.black400,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: AppColors.black100, width: 2),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: widget.fantasyTeamIcon != null
                          ? Image.asset(
                              stringToAvatar(widget.fantasyTeamIcon),
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const SizedBox(),
                            )
                          : const SizedBox(),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                stats.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.black800,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              role.icon as PhosphorIconData,
                              color: role.color,
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          season.teamName,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                      ],
                    ),
                  ),
                  if (widget.fantasyTeamName != null)
                    Text(
                      widget.fantasyTeamName!,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(List<_StatItem> items) {
    final rows = <Widget>[];
    for (int i = 0; i < items.length; i += 2) {
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: i + 2 < items.length ? 8 : 0),
          child: Row(
            children: [
              Expanded(child: _AnimatedStatCard(item: items[i], percentileColor: _percentileColor, formatValue: _formatValue)),
              const SizedBox(width: 8),
              Expanded(
                child: i + 1 < items.length
                    ? _AnimatedStatCard(item: items[i + 1], percentileColor: _percentileColor, formatValue: _formatValue)
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }

  // Stat cards are now _AnimatedStatCard widgets

  String _formatValue(double value) {
    if (value == value.roundToDouble()) {
      final intStr = value.toInt().toString();
      if (intStr.length <= 4) return intStr;
      if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}k';
      return intStr.substring(0, 4);
    }
    final intPart = value.toInt().toString();
    if (intPart.length >= 3) return intPart;
    final decimals = 4 - intPart.length - 1;
    return value.toStringAsFixed(decimals > 0 ? decimals : 0);
  }

  Color _percentileColor(double percentile) {
    if (percentile >= 0.66) return AppColors.green300;
    if (percentile >= 0.33) return AppColors.yellow300;
    return AppColors.red100;
  }
}

class _StatItem {
  final String label;
  final StatEntry entry;
  const _StatItem(this.label, this.entry);
}

class _AnimatedStatCard extends StatefulWidget {
  final _StatItem item;
  final Color Function(double) percentileColor;
  final String Function(double) formatValue;

  const _AnimatedStatCard({
    required this.item,
    required this.percentileColor,
    required this.formatValue,
  });

  @override
  State<_AnimatedStatCard> createState() => _AnimatedStatCardState();
}

class _AnimatedStatCardState extends State<_AnimatedStatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void didUpdateWidget(_AnimatedStatCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.entry != widget.item.entry) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentile = widget.item.entry.percentile ?? 0;
    final value = widget.item.entry.value ?? 0;
    final color = widget.percentileColor(percentile);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final targetInt = value.round();
        final animatedInt = (targetInt * _animation.value).round();
        final animatedValue = animatedInt.toDouble();
        final animatedPercentile = percentile * _animation.value;
        final animatedPctInt = (animatedPercentile * 100).round();

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.black200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.item.label,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.black600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '$animatedPctInt%',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.formatValue(animatedValue),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.black800,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: CustomPaint(
                      size: const Size(80, 30),
                      painter: _BellCurvePainter(
                        percentile: animatedPercentile,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BellCurvePainter extends CustomPainter {
  final double percentile;
  final Color color;

  _BellCurvePainter({required this.percentile, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const steps = 100;

    final outlinePath = Path();
    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final x = t * w;
      final y = h - _bellY(t) * h * 0.85;
      if (i == 0) {
        outlinePath.moveTo(x, y);
      } else {
        outlinePath.lineTo(x, y);
      }
    }

    final greyFill = Path.from(outlinePath)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(greyFill, Paint()..color = AppColors.black400);

    final colorPath = Path();
    final pxEnd = (percentile * w).clamp(0.0, w);
    final colorSteps = (percentile * steps).round();
    for (int i = 0; i <= colorSteps; i++) {
      final t = i / steps;
      final x = t * w;
      final y = h - _bellY(t) * h * 0.85;
      if (i == 0) {
        colorPath.moveTo(x, y);
      } else {
        colorPath.lineTo(x, y);
      }
    }
    colorPath.lineTo(pxEnd, h);
    colorPath.lineTo(0, h);
    colorPath.close();
    canvas.drawPath(colorPath, Paint()..color = color);

    // Vertical marker line — always 20px tall
    final markerX = pxEnd;
    final curveY = h - _bellY(percentile) * h * 0.85;
    const lineHeight = 20.0;
    final lineTop = h - lineHeight;
    canvas.drawLine(
      Offset(markerX, lineTop),
      Offset(markerX, h),
      Paint()
        ..color = color
        ..strokeWidth = 2,
    );

    // White circle with black border at the curve intersection
    const circleRadius = 3.0;
    canvas.drawCircle(
      Offset(markerX, curveY),
      circleRadius,
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      Offset(markerX, curveY),
      circleRadius,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  double _bellY(double t) {
    const mean = 0.5;
    const sigma = 0.18;
    final exponent = -math.pow(t - mean, 2) / (2 * sigma * sigma);
    return math.exp(exponent);
  }

  @override
  bool shouldRepaint(covariant _BellCurvePainter oldDelegate) =>
      oldDelegate.percentile != percentile || oldDelegate.color != color;
}

/// Show the player stats bottom sheet.
void showPlayerStatsSheet(
  BuildContext context, {
  required String playerId,
  required String playerName,
  String? defaultSeasonId,
  String? fantasyTeamName,
  String? fantasyTeamIcon,
  Color? fantasyTeamColor,
  List<LeagueScoringRule> scoringRules = const [],
  String? captainId,
  String? viceCaptainId,
  int initialTab = 0,
  String? leagueId,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (_) => PlayerStatsBottomSheet(
      playerId: playerId,
      playerName: playerName,
      defaultSeasonId: defaultSeasonId,
      fantasyTeamName: fantasyTeamName,
      fantasyTeamIcon: fantasyTeamIcon,
      fantasyTeamColor: fantasyTeamColor,
      scoringRules: scoringRules,
      captainId: captainId,
      viceCaptainId: viceCaptainId,
      initialTab: initialTab,
      leagueId: leagueId,
    ),
  );
}

class _OpaquePatternPainter extends CustomPainter {
  final ui.Image image;

  _OpaquePatternPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final matrix = Matrix4.identity()..scale(2.0, 2.0);
    final paint = Paint()
      ..shader = ImageShader(
          image, TileMode.repeated, TileMode.repeated, matrix.storage);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _OpaquePatternPainter oldDelegate) {
    return oldDelegate.image != image;
  }
}
