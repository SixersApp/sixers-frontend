import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class LeagueTabSelector extends StatelessWidget {
  const LeagueTabSelector({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFF101010)),
      padding: const EdgeInsets.all(5),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(color: AppColors.black300, borderRadius: BorderRadius.circular(8)),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: AppColors.black800,
        unselectedLabelColor: AppColors.black600,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        tabs: const [
          Tab(text: 'Team'),
          Tab(text: 'Matchups'),
          Tab(text: 'Transactions'),
        ],
      ),
    );
  }
}
