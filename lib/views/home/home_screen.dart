import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/backend/fantasy_matchup/scoring_utils.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/backend/live_match/live_match_provider.dart';
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

        // Fetch matchups feed (grouped by league)
        final matchupsAsync = userId.isEmpty
            ? const AsyncValue<List<LeagueMatchupGroup>>.data([])
            : ref.watch(userMatchupsProvider);

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
                      ref.read(liveMatchesProvider.notifier).resync();
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
                                data: (leagueGroups) {
                                  final leagues = leaguesAsync.value ?? [];

                                  // Flatten matchups, keeping only the user's matchups
                                  final flatMatchups = <({String leagueId, Matchup matchup})>[];
                                  for (final group in leagueGroups) {
                                    final league = leagues.firstWhere(
                                      (l) => l.id == group.leagueId,
                                      orElse: () => leagues.first,
                                    );
                                    final userTeamId = league.userTeamId;
                                    for (final matchup in group.matchups) {
                                      if (matchup.team1.fantasyTeamId == userTeamId ||
                                          matchup.team2.fantasyTeamId == userTeamId) {
                                        flatMatchups.add((leagueId: group.leagueId, matchup: matchup));
                                      }
                                    }
                                  }

                                  if (flatMatchups.isEmpty) {
                                    return const Center(
                                      child: Text("No matchups yet"),
                                    );
                                  }

                                  final liveMatchMap = ref.watch(liveMatchesProvider).value ?? {};
                                  final perfLookups = buildPerformanceLookup(liveMatchMap);
                                  final perfLookup = perfLookups.byPerfId;
                                  final perfByPlayerId = perfLookups.byPlayerId;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: flatMatchups.length,
                                    itemBuilder: (context, index) {
                                      final pad = EdgeInsets.only(
                                        left: index == 0 ? 10 : 0,
                                        right: 10,
                                      );

                                      final entry = flatMatchups[index];
                                      final m = entry.matchup;

                                      final league = leagues.firstWhere(
                                        (l) => l.id == entry.leagueId,
                                        orElse: () => League(
                                          id: entry.leagueId,
                                          name: "Unknown League",
                                          tournamentId: "",
                                          creatorId: "",
                                          status: LeagueStatus.active,
                                          maxTeams: 0,
                                          joinCode: "",
                                          seasonId: "",
                                          latestGame: 1,
                                          weeks: 0,
                                          teams: [],
                                          tournamentAbbr: "UKL",
                                          seasonYear: 2025,
                                        ),
                                      );

                                      final team1Meta = league.teams.cast<dynamic>().firstWhere(
                                        (t) => t.id == m.team1.fantasyTeamId,
                                        orElse: () => null,
                                      );
                                      final team2Meta = league.teams.cast<dynamic>().firstWhere(
                                        (t) => t.id == m.team2.fantasyTeamId,
                                        orElse: () => null,
                                      );

                                      const activeSlots = {'bat', 'bowl', 'all', 'wicket', 'flex'};
                                      bool isActiveSlot(MatchupPlayer p) => activeSlots.any((s) => p.slot.startsWith(s));
                                      final activeTeam1 = m.team1.players.where(isActiveSlot);
                                      final activeTeam2 = m.team2.players.where(isActiveSlot);
                                      final isUpcoming = [...activeTeam1, ...activeTeam2].every((p) => p.performanceId == null);
                                      final team1PlayersLeft = activeTeam1.where((p) => p.performanceId == null).length;
                                      final team2PlayersLeft = activeTeam2.where((p) => p.performanceId == null).length;

                                      final rules = league.scoringRules;
                                      final team1Score = calculateTeamScore(
                                        activeTeam1, perfLookup, perfByPlayerId, rules,
                                        captainId: m.team1.captain,
                                        viceCaptainId: m.team1.viceCaptain,
                                      );
                                      final team2Score = calculateTeamScore(
                                        activeTeam2, perfLookup, perfByPlayerId, rules,
                                        captainId: m.team2.captain,
                                        viceCaptainId: m.team2.viceCaptain,
                                      );

                                      // Win probability
                                      List<({double currentScore, double projectedScore, double initialProjection})> buildStats(
                                        Iterable<MatchupPlayer> players, MatchupTeam team,
                                      ) {
                                        return players.map((p) {
                                          final perf = (p.performanceId != null ? perfLookup[p.performanceId!] : null)
                                              ?? perfByPlayerId[p.playerId];
                                          double pts = 0;
                                          if (perf != null) {
                                            final cats = <String>{};
                                            final s = p.slot.toLowerCase();
                                            if (s.startsWith('all')) { cats.addAll(['batting', 'bowling', 'fielding']); }
                                            else if (s.startsWith('bat') || s.startsWith('wicket')) { cats.addAll(['batting', 'fielding']); }
                                            else if (s.startsWith('bowl')) { cats.addAll(['bowling', 'fielding']); }
                                            else { cats.addAll(['batting', 'bowling', 'fielding']); }
                                            pts = calculatePlayerPoints(perf, rules, cats,
                                              playerId: p.playerId, captainId: team.captain, viceCaptainId: team.viceCaptain);
                                          }
                                          double adjustedPpg = p.projectedPpg;
                                          if (p.playerId == team.captain || p.playerId == team.viceCaptain) {
                                            for (final rule in rules) {
                                              if (rule.mode != RuleMode.multiplier) continue;
                                              final stat = rule.stat.toLowerCase();
                                              if (p.playerId == team.captain && stat == 'captaincy multiplier') {
                                                adjustedPpg *= (rule.multiplier ?? 1);
                                              } else if (p.playerId == team.viceCaptain && stat == 'vice captaincy multiplier') {
                                                adjustedPpg *= (rule.multiplier ?? 1);
                                              }
                                            }
                                          }
                                          final c = perf != null ? completionRatio(p.slot, p.role, perf) : 0.0;
                                          final projected = projectedFantasyScore(pts, adjustedPpg, c);
                                          return (currentScore: pts, projectedScore: projected, initialProjection: adjustedPpg);
                                        }).toList();
                                      }

                                      final t1WinPct = winProbability(
                                        team1Players: buildStats(activeTeam1, m.team1),
                                        team2Players: buildStats(activeTeam2, m.team2),
                                      );
                                      final t1Pct = (t1WinPct * 100).round().clamp(1, 99);
                                      final t2Pct = 100 - t1Pct;

                                      return Padding(
                                        padding: pad,
                                        child: MatchupCard(
                                          team1Name: team1Meta?.teamAbbreviation ?? team1Meta?.teamName ?? "Team 1",
                                          team1Score: team1Score.toStringAsFixed(1),
                                          team1PlayersLeft: team1PlayersLeft,
                                          team1WinProbability: t1Pct,
                                          team1Logo: team1Meta != null
                                              ? Image.asset(stringToAvatar(team1Meta.teamIcon))
                                              : const Icon(Icons.sports, color: Colors.white, size: 20),
                                          team1Color: team1Meta != null
                                              ? stringToColor(team1Meta.teamColor)
                                              : Colors.grey,
                                          team2Name: team2Meta?.teamAbbreviation ?? team2Meta?.teamName ?? "Team 2",
                                          team2Score: team2Score.toStringAsFixed(1),
                                          team2PlayersLeft: team2PlayersLeft,
                                          team2WinProbability: t2Pct,
                                          team2Logo: team2Meta != null
                                              ? Image.asset(stringToAvatar(team2Meta.teamIcon))
                                              : const Icon(Icons.sports, color: Colors.white, size: 20),
                                          team2Color: team2Meta != null
                                              ? stringToColor(team2Meta.teamColor)
                                              : Colors.grey,
                                          leagueName: league.name,
                                          gameNumber: "Game ${m.matchNum}",
                                          isUpcoming: isUpcoming,
                                          isLive: !isUpcoming,
                                          matchupId: m.id,
                                          leagueId: entry.leagueId,
                                          team1FtiId: m.team1.fantasyTeamInstanceId,
                                          team2FtiId: m.team2.fantasyTeamInstanceId,
                                          matchNum: m.matchNum,
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
