import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/league_tabs/league_tab_selector.dart';
import 'package:sixers/views/league/team_content.dart';

class LeagueScreen extends ConsumerStatefulWidget {
  const LeagueScreen({super.key, required this.leagueId, required this.matchupId});

  final String leagueId;
  final String? matchupId;

  @override
  ConsumerState<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends ConsumerState<LeagueScreen> with TickerProviderStateMixin {
  League? league;
  bool isLoading = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadLeague();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadLeague() async {
    setState(() {
      isLoading = true;
    });
    league = await ref.read(leaguesProvider.notifier).getLeagueById(widget.leagueId);
    setState(() {
      isLoading = false;
    });
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        TeamContent(league: league!),
        const Center(child: Text('Matchups content goes here')),
        const Center(child: Text('Transactions content goes here')),
      ],
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (league == null) {
      return const Center(child: Text('League not found'));
    }
    return Column(
      children: [
        // Tab Selector
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: LeagueTabSelector(tabController: _tabController),
        ),
        // Tab Content
        Expanded(child: _buildTabContent()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 20), onPressed: () => GoRouter.of(context).go('/')),
        title: LeagueDropdown(
          onSelected: (league) => GoRouter.of(context).go('/league', extra: {"leagueId": league.id}),
          selectedLeague: league,
          width: "fill",
        ),
        backgroundColor: AppColors.black100,
      ),
      body: _buildBody(),
    );
  }
}
