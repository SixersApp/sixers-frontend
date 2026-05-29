import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown_v2.dart';
import 'package:sixers/views/components/league_tabs/league_tab_selector.dart';
import 'package:sixers/views/league/components/leaderboard_sheet.dart';
import 'package:sixers/views/league/tabs/matchups_tab.dart';
import 'package:sixers/views/league/tabs/roster_tab.dart';
import 'package:sixers/views/league/tabs/trades_tab.dart';

/// Returns [base] with each team's leaderboard record (wins / losses /
/// matchesCompleted / avgPointsPerGame / matchScores) populated from the
/// matching team in [detail], looked up by team id. League-level fields and
/// any team field not in the record set are taken from [base]. If [detail] is
/// null (still loading or request failed) [base] is returned unchanged.
League _mergeStandings(League base, League? detail) {
  if (detail == null || detail.teams.isEmpty) return base;

  final byId = {for (final t in detail.teams) t.id: t};
  final mergedTeams = base.teams.map((team) {
    final stats = byId[team.id];
    if (stats == null) return team;
    return team.copyWith(
      wins: stats.wins,
      losses: stats.losses,
      matchesCompleted: stats.matchesCompleted,
      avgPointsPerGame: stats.avgPointsPerGame,
      matchScores: stats.matchScores,
    );
  }).toList();

  return base.copyWith(teams: mergedTeams);
}

class ActiveLeagueScreen extends ConsumerStatefulWidget {
  const ActiveLeagueScreen({super.key, required this.league, this.initialTab = 0, this.initialGame});

  final League league;
  final int initialTab;
  final int? initialGame;

  @override
  ConsumerState<ActiveLeagueScreen> createState() => _ActiveLeagueScreenState();
}

class _ActiveLeagueScreenState extends ConsumerState<ActiveLeagueScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTeamIndex = 0;
  late int _selectedGameNum;
  late int _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = widget.initialTab;
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTab);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging && _currentTabIndex != _tabController.index) {
        setState(() => _currentTabIndex = _tabController.index);
      }
    });
    _selectedGameNum = widget.initialGame ?? (widget.league.latestGame > 0 ? widget.league.latestGame : 1);
    // Delay the provider modification until after the widget tree is built
    Future.microtask(() => _loadTeamInstances());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadTeamInstances() async {
    final instances = await ref.read(fantasyTeamInstancesProvider.notifier).loadAllInstancesForLeague(leagueId: widget.league.id);

    // After loading instances, ensure selectedGameNum is valid
    if (instances.isNotEmpty) {
      final availableMatchNums = instances.map((i) => i.match_num).toList()..sort();

      // If the current selectedGameNum isn't in available matches, default to the first one
      if (!availableMatchNums.contains(_selectedGameNum)) {
        setState(() {
          _selectedGameNum = availableMatchNums.first;
        });
      }
    }
  }

  void _onGameChanged(int newGameNum) {
    setState(() {
      _selectedGameNum = newGameNum;
    });
    // No need to reload - all instances are already loaded
  }

  @override
  Widget build(BuildContext context) {
    // Watch the singular endpoint for leaderboard-enriched team data and merge
    // the per-team record fields into widget.league's teams (which come from
    // the list endpoint and carry the full league-level shape). Merging — rather
    // than swapping the whole league — keeps league-level fields the detail
    // endpoint omits (tournament_abbr, season_year, latest_game, …) intact.
    final detailAsync = ref.watch(leagueDetailProvider(widget.league.id));
    final league = _mergeStandings(widget.league, detailAsync.value);
    final teams = league.teams;
    // Guard the selected index against shrinking team lists
    final safeTeamIndex =
        _selectedTeamIndex < teams.length ? _selectedTeamIndex : 0;

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              IconButton(icon: const Icon(Icons.arrow_back_ios, size: 20), onPressed: () => GoRouter.of(context).go('/')),
              // Team icon
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: teams.isNotEmpty
                      ? stringToColor(teams[safeTeamIndex].teamColor)
                      : AppColors.yellow300,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: teams.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          stringToAvatar(teams[safeTeamIndex].teamIcon),
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(Icons.sports, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 10),
              // League name and team name — tappable to show league dropdown
              Expanded(
                child: GestureDetector(
                  onTap: () => showLeagueDropDown(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        league.name.toUpperCase(),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                      Text(
                        teams.isNotEmpty ? teams[safeTeamIndex].teamName : "Kittu's Kool Kids",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.black600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.black100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => showLeaderboardSheet(context, league: league),
              child: Icon(Icons.grid_view, size: 24, color: AppColors.black800),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LeagueTabSelector(tabController: _tabController),
          ),

          const SizedBox(height: 15),

          // Game selector (hidden on matchups tab and trades tab)
          if (_currentTabIndex != 1 && _currentTabIndex != 2) ...[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.black200),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                    onPressed: _selectedGameNum > 1
                        ? () => _onGameChanged(_selectedGameNum - 1)
                        : null,
                    color: _selectedGameNum > 1 ? Colors.white : Colors.grey.shade600,
                  ),
                  Text(
                    'Game $_selectedGameNum',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: _selectedGameNum < league.weeks
                        ? () => _onGameChanged(_selectedGameNum + 1)
                        : null,
                    color: _selectedGameNum < league.weeks
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RosterTab(
                  league: league,
                  selectedTeamIndex: safeTeamIndex,
                  selectedGameNum: _selectedGameNum,
                  onTeamSelected: (index) {
                    setState(() {
                      _selectedTeamIndex = index;
                    });
                  },
                  onGameChanged: _onGameChanged,
                ),
                MatchupsTab(
                  league: league,
                  selectedGameNum: _selectedGameNum,
                  onGameChanged: _onGameChanged,
                ),
                TradesTab(league: widget.league),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
