import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown.dart';
import 'package:sixers/views/components/matches/match_feed.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/theme/colors.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  double _parseScore(String? raw) {
    if (raw == null) return 0.0;
    return double.tryParse(raw) ?? 0.0;
  }

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

        // Fetch leagues
        final leaguesAsync = ref.watch(leaguesProvider);

        // Fetch matchups (match 2)
        final matchupsAsync = userId.isEmpty
            ? const AsyncValue.data([])
            : ref.watch(userMatchupsProvider(0));

        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(leaguesProvider.notifier).refresh();
                if (userId.isNotEmpty) {
                  ref.refresh(userMatchupsProvider(0));
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
                              onSelected: (league) =>
                                  GoRouter.of(context).push('/league', extra: {
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
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (err, _) => Center(
                        child: Text("Failed to load matches: $err"),
                      ),
                      data: (matchups) {
                        final leagues = leaguesAsync.value ?? [];

                        final pendingLeagues = leagues
                            .where(
                                (l) => l.status == LeagueStatus.draft_pending)
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
                              left: index == 0 ? 10 : 0,
                              right: 10,
                            );

                            // ---------- Pending leagues ----------
                            if (index < pendingLeagues.length) {
                              return Padding(
                                padding: pad,
                                child: PreDraftCard(
                                    league: pendingLeagues[index]),
                              );
                            }

                            // ---------- Matchups ----------
                            final m =
                                matchups[index - pendingLeagues.length];

                            final league = leagues.firstWhere(
                              (l) => l.id == m.leagueId,
                              orElse: () => League(
                                id: m.leagueId,
                                name: "Unknown League",
                                tournamentId: "",
                                creatorId: "",
                                status: LeagueStatus.active,
                                maxTeams: 0,
                                joinCode: "",
                                seasonId: "",
                              ),
                            );

                            final team1Score =
                                _parseScore(m.fantasyTeamInstance1Score);
                            final team2Score =
                                _parseScore(m.fantasyTeamInstance2Score);

                            return Padding(
                              padding: pad,
                              child: MatchupCard(
                                team1Name:
                                    m.fantasyTeam1Name ?? "Team 1",
                                team1Score: team1Score.toStringAsFixed(1),
                                team1PlayersLeft: 0,
                                team1WinProbability: 50,
                                team1Logo: const Icon(
                                  Icons.sports_cricket,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                team2Name:
                                    m.fantasyTeam2Name ?? "Team 2",
                                team2Score: team2Score.toStringAsFixed(1),
                                team2PlayersLeft: 0,
                                team2WinProbability: 50,
                                team2Logo: const Icon(
                                  Icons.sports_cricket,
                                  color: Colors.white,
                                  size: 25,
                                ),
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

                  // --------------- UPCOMING HEADER ------------------
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

                  // --------------- MATCH FEED SECTION ------------------
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: MatchFeedSection(),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}