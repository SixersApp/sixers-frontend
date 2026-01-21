import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/league_tabs/league_tab_selector.dart';
import 'package:sixers/views/league/tabs/matchups_tab.dart';
import 'package:sixers/views/league/tabs/team_tab.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadTeamInstance();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadTeamInstance() async {
    await ref
        .read(fantasyTeamInstanceProvider.notifier)
        .getInstanceForLeague(leagueId: widget.league.id, match_num: widget.league.latestGame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 20), onPressed: () => GoRouter.of(context).go('/')),
        title: LeagueDropdown(
          onSelected: (league) => GoRouter.of(context).go('/leagues/${league.id}'),
          selectedLeague: widget.league,
          width: "fill",
        ),
        backgroundColor: AppColors.black100,
        actions: [
          IconButton(icon: const Icon(Icons.grid_view, size: 24), onPressed: () {}),
          PopupMenuButton(icon: const Icon(Icons.arrow_drop_down, size: 24), itemBuilder: (context) => []),
        ],
      ),
      body: Column(
        children: [
          // League name and team icon
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Row(
              children: [
                // Back arrow
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
                // Team icon
                Container(
                  width: 40,
                  height: 40,
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
                            width: 40,
                            height: 40,
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

          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LeagueTabSelector(tabController: _tabController),
          ),

          const SizedBox(height: 16),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TeamTab(
                  league: widget.league,
                  selectedTeamIndex: _selectedTeamIndex,
                  onTeamSelected: (index) {
                    setState(() {
                      _selectedTeamIndex = index;
                    });
                  },
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
