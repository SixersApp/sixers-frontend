import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/league_dropdown/league_dropdown_v2.dart';
import 'package:sixers/views/components/matches/match_feed.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/theme/colors.dart';

class HomeScreen extends ConsumerWidget {
  static final route = "/home";
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

        // Fetch leagues
        final leaguesAsync = ref.watch(leaguesProvider);

        // Fetch matchups (match 2)
        final matchupsAsync =
            (userId.isEmpty
                    ? const AsyncValue.data([])
                    : ref.watch(userMatchupsProvider))
                as AsyncValue<List<Matchup>>;

        return Scaffold(
          backgroundColor: AppColors.black100,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                pinned: true,
                floating: false,
                titleSpacing: 20,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showLeagueDropDown(context);
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/splash_logo.png", height: 24),
                          const SizedBox(width: 10),
                          Text(
                            "SIXERS",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(width: 20),
                          PhosphorIcon(
                            PhosphorIcons.caretDown(PhosphorIconsStyle.fill),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.black400,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () => GoRouter.of(context).push('/settings'),
                        child: PhosphorIcon(
                          PhosphorIcons.gearSix(PhosphorIconsStyle.fill),
                          color: AppColors.black800,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(leaguesProvider.notifier).refresh();
                    if (userId.isNotEmpty) {
                      ref.read(userMatchupsProvider.notifier).refresh();
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "Your Matchups",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: AppColors.black600),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 155,
                              child: matchupsAsync.when(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                error: (err, _) => Center(
                                  child: Text("Failed to load matches: $err"),
                                ),
                                data: (matchups) {
                                  final leagues = leaguesAsync.value ?? [];

                                  final pendingLeagues = leagues
                                      .where(
                                        (l) =>
                                            l.status ==
                                            LeagueStatus.draft_pending,
                                      )
                                      .toList();

                                  final itemCount =
                                      pendingLeagues.length + matchups.length;

                                  if (itemCount == 0) {
                                    return const Center(
                                      child: Text("No matchups yet"),
                                    );
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
                                            league: pendingLeagues[index],
                                          ),
                                        );
                                      }

                                      // ---------- Matchups ----------
                                      final m =
                                          matchups[index -
                                              pendingLeagues.length];

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
                                          latestGame: 1,
                                          teams: [],
                                          tournamentAbbr: "UKL",
                                          seasonYear: 2025,
                                        ),
                                      );

                                      late FantasyTeam team1;
                                      late FantasyTeam team2;

                                      for (var team in league.teams) {
                                        if (team.id == m.fantasyTeam1Id) {
                                          team1 = team;
                                        }
                                        if (team.id == m.fantasyTeam2Id) {
                                          team2 = team;
                                        }
                                      }

                                      return Padding(
                                        padding: pad,
                                        child: MatchupCard(
                                          team1Name: team1.teamName,
                                          team1Score: m
                                              .fantasyTeamInstance1Score
                                              .toString(),
                                          team1PlayersLeft: 0,
                                          team1WinProbability: 50,
                                          team1Logo: Image.asset(
                                            stringToAvatar(team1.teamIcon),
                                          ),
                                          team1Color: stringToColor(
                                            team1.teamColor,
                                          ),
                                          team2Name: team2.teamName,
                                          team2Score: m
                                              .fantasyTeamInstance2Score
                                              .toString(),
                                          team2PlayersLeft: 0,
                                          team2WinProbability: 50,
                                          team2Logo: Image.asset(
                                            stringToAvatar(team2.teamIcon),
                                          ),
                                          team2Color: stringToColor(
                                            team2.teamColor,
                                          ),
                                          leagueName: league.name,
                                          gameNumber: "Game ${m.matchNum}",
                                          isLive: false,
                                          matchupId: m.id,
                                          leagueId: m.leagueId,
                                          team1FtiId: m.fantasyTeamInstance1Id,
                                          team2FtiId: m.fantasyTeamInstance2Id,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Live/Upcoming Games",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.black600),
                            ),
                            const SizedBox(height: 10),
                            MatchFeedSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
