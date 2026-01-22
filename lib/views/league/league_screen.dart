import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/league_tabs/league_tab_selector.dart';
import 'package:sixers/views/league/tabs/matchups_tab.dart';
import 'package:sixers/views/league/tabs/roster_tab.dart';
import 'package:sixers/views/league/tabs/transactions_tab.dart';

class ActiveLeagueScreen extends ConsumerStatefulWidget {
  const ActiveLeagueScreen({super.key, required this.league});

  final League league;

  @override
  ConsumerState<ActiveLeagueScreen> createState() => _ActiveLeagueScreenState();
}

class _ActiveLeagueScreenState extends ConsumerState<ActiveLeagueScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTeamIndex = 0;
  late int _selectedGameNum;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _selectedGameNum = widget.league.latestGame;
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
                  color: widget.league.teams.isNotEmpty
                      ? stringToColor(widget.league.teams[_selectedTeamIndex].teamColor)
                      : AppColors.yellow300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: widget.league.teams.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          stringToAvatar(widget.league.teams[_selectedTeamIndex].teamIcon),
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(Icons.sports, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              // League name and team name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.league.name,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.league.teams.isNotEmpty ? widget.league.teams[_selectedTeamIndex].teamName : "Kittu's Kool Kids",
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.black100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.grid_view, size: 24), onPressed: () {}),
                PopupMenuButton(icon: const Icon(Icons.arrow_drop_down, size: 24), itemBuilder: (context) => []),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // League name and team icon
          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LeagueTabSelector(tabController: _tabController),
          ),

          const SizedBox(height: 15),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RosterTab(
                  league: widget.league,
                  selectedTeamIndex: _selectedTeamIndex,
                  selectedGameNum: _selectedGameNum,
                  onTeamSelected: (index) {
                    setState(() {
                      _selectedTeamIndex = index;
                    });
                  },
                  onGameChanged: _onGameChanged,
                ),
                MatchupsTab(league: widget.league),
                TransactionsTab(league: widget.league),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
