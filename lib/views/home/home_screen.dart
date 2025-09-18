import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LeagueDropdown(
                              onSelected: (league) => GoRouter.of(context).push('/league', extra: {"leagueId": league.id}),
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: FilledButton(
                                onPressed: () => GoRouter.of(context).push('/settings'),
                                style: FilledButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor: AppColors.black400,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Icon(Icons.settings, color: AppColors.black800, size: 25),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Your Matches',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal, color: AppColors.black600),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 155,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Add more cards to demonstrate scrolling
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10),
                          child: _buildMatchupCard(index),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.black100,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Live/Upcoming Games',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal, color: AppColors.black600),
                        ),
                        const SizedBox(height: 10),
                        // Horizontal scrolling cards that go off-screen
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchupCard(int index) {
    switch (index) {
      case 0:
        return MatchupCard(
          team1Name: 'KKK',
          team1Score: '110.3',
          team1PlayersLeft: 3,
          team1WinProbability: 74,
          team1Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          team2Name: 'CAT',
          team2Score: '15.1',
          team2PlayersLeft: 1,
          team2WinProbability: 26,
          team2Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          leagueName: 'CRICGGAS • IPL',
          gameNumber: 'Game 7',
          isLive: true,
          matchupId: '1',
          leagueId: '1',
        );
      case 1:
        return MatchupCard(
          team1Name: 'RCB',
          team1Score: '89.2',
          team1PlayersLeft: 2,
          team1WinProbability: 45,
          team1Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          team2Name: 'MI',
          team2Score: '95.7',
          team2PlayersLeft: 4,
          team2WinProbability: 55,
          team2Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          leagueName: 'CRICGGAS • IPL',
          gameNumber: 'Game 8',
          isLive: false,
          matchupId: '2',
          leagueId: '1',
        );
      case 2:
        return MatchupCard(
          team1Name: 'CSK',
          team1Score: '156.8',
          team1PlayersLeft: 5,
          team1WinProbability: 68,
          team1Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          team2Name: 'DC',
          team2Score: '142.3',
          team2PlayersLeft: 3,
          team2WinProbability: 32,
          team2Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
          leagueName: 'CRICGGAS • IPL',
          gameNumber: 'Game 9',
          isLive: true,
          matchupId: '3',
          leagueId: '1',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
