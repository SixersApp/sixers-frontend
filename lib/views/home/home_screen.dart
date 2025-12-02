import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/theme/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProviderProvider);

    return authAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, _) =>
          Scaffold(body: Center(child: Text("Authentication error: $err"))),
      data: (session) {
        final userId = session?.userId ?? "";

        // Leagues always load
        final leaguesAsync = ref.watch(leaguesProvider);

        // Matchups loaded by matchNum only
        final matchupsAsync = userId.isEmpty
            ? const AsyncValue.data([])
            : ref.watch(userMatchupsProvider(1));

        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(leaguesProvider.notifier).refresh();
                if (userId.isNotEmpty) {
                  ref.refresh(userMatchupsProvider(1));
                }
              },
              child: ListView(
                children: [
                  // ------------------ HEADER -------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeagueDropdown(
                              onSelected: (league) => GoRouter.of(context)
                                  .push('/league', extra: {
                                "leagueId": league.id,
                              }),
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.black400,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () =>
                                    GoRouter.of(context).push('/settings'),
                                child: Icon(Icons.settings,
                                    color: AppColors.black800, size: 25),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Your Matches",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.black600),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  // ---------------- MATCHUPS -------------------
                  SizedBox(
                    height: 155,
                    child: matchupsAsync.when(
                      loading: () => const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                      error: (err, _) =>
                          Center(child: Text("Failed to load matches: $err")),
                      data: (matchups) {
                        final leagues = leaguesAsync.value ?? [];

                        final pendingLeagues = leagues
                            .where((l) => l.status == LeagueStatus.draft_pending)
                            .toList();

                        final itemCount =
                            pendingLeagues.length + matchups.length;

                        if (itemCount == 0) {
                          return const Center(child: Text("No matchups yet"));
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            final pad = EdgeInsets.only(
                                left: index == 0 ? 10 : 0, right: 10);

                            if (index < pendingLeagues.length) {
                              return Padding(
                                padding: pad,
                                child: PreDraftCard(
                                    league: pendingLeagues[index]),
                              );
                            }

                            final m =
                                matchups[index - pendingLeagues.length];

                            final league =
                                leagues.firstWhere((l) => l.id == m.leagueId);

                            return Padding(
                              padding: pad,
                              child: MatchupCard(
                                team1Name:
                                    m.team1?.fantasyTeam?.teamName ?? 'Team 1',
                                team1Score:
                                    (m.team1Score ?? 0).toStringAsFixed(1),
                                team1PlayersLeft: 0,
                                team1WinProbability: 50,
                                team1Logo: const Icon(Icons.sports_cricket,
                                    color: Colors.white, size: 25),

                                team2Name:
                                    m.team2?.fantasyTeam?.teamName ?? 'Team 2',
                                team2Score:
                                    (m.team2Score ?? 0).toStringAsFixed(1),
                                team2PlayersLeft: 0,
                                team2WinProbability: 50,
                                team2Logo: const Icon(Icons.sports_cricket,
                                    color: Colors.white, size: 25),

                                leagueName: league.name,
                                gameNumber: "Game ${m.matchNum}",
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

                  const SizedBox(height: 20),

                  // --------------- UPCOMING ------------------
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Live/Upcoming Games",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.black600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}