import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/matchup/matchup_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

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
                    child: user == null
                        ? const Center(child: Text('Sign in to view your matchups'))
                        : Consumer(
                            builder: (context, ref, _) {
                              final matchupsAsync = ref.watch(userMatchupsProvider(userId: user.id));
                              final leaguesAsync = ref.watch(leaguesProvider);
                              if (matchupsAsync.isLoading || leaguesAsync.isLoading) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (matchupsAsync.hasError || leaguesAsync.hasError) {
                                final err = matchupsAsync.error ?? leaguesAsync.error;
                                return Center(child: Text('Failed to load matchups: $err'));
                              }
                              final matchups = matchupsAsync.value ?? [];
                              final leagues = leaguesAsync.value ?? [];

                              // Pre-draft leagues
                              final pendingLeagues = leagues.where((l) => l.status == LeagueStatus.draft_pending).toList();

                              // Combine: show pending leagues first, then matchups
                              final itemCount = pendingLeagues.length + matchups.length;
                              if (itemCount == 0) {
                                return const Center(child: Text('No matchups yet'));
                              }

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemCount,
                                itemBuilder: (context, index) {
                                  final pad = EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10);
                                  if (index < pendingLeagues.length) {
                                    final league = pendingLeagues[index];
                                    return Padding(
                                      padding: pad,
                                      child: PreDraftCard(league: league),
                                    );
                                  }
                                  final m = matchups[index - pendingLeagues.length];
                                  final team1Name = m.team1?.fantasyTeam?.teamName ?? 'Team 1';
                                  final team2Name = m.team2?.fantasyTeam?.teamName ?? 'Team 2';
                                  final team1Score = (m.team1Score ?? 0).toStringAsFixed(1);
                                  final team2Score = (m.team2Score ?? 0).toStringAsFixed(1);

                                  return Padding(
                                    padding: pad,
                                    child: MatchupCard(
                                      team1Name: team1Name,
                                      team1Score: team1Score,
                                      team1PlayersLeft: 0,
                                      team1WinProbability: 50,
                                      team1Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
                                      team2Name: team2Name,
                                      team2Score: team2Score,
                                      team2PlayersLeft: 0,
                                      team2WinProbability: 50,
                                      team2Logo: const Icon(Icons.sports_cricket, color: Colors.white, size: 25),
                                      leagueName: leagues
                                          .firstWhere(
                                            (l) => l.id == m.leagueId,
                                            orElse: () => League(
                                              id: m.leagueId,
                                              name: m.leagueId,
                                              tournamentId: '',
                                              creatorId: '',
                                              status: LeagueStatus.active,
                                              maxTeams: 0,
                                              joinCode: '',
                                            ),
                                          )
                                          .name,
                                      gameNumber: 'Game ${m.matchNum}',
                                      isLive: false,
                                      matchupId: m.id,
                                      leagueId: m.leagueId,
                                    ),
                                  );
                                },
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
}
