import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/match/match_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/matches/match_card.dart';

// Public wrapper that keeps the original API as ConsumerWidget
class MatchFeedSection extends ConsumerWidget {
  const MatchFeedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _MatchFeedSectionImpl();
  }
}

// Renamed stateful implementation (private)
class _MatchFeedSectionImpl extends ConsumerStatefulWidget {
  const _MatchFeedSectionImpl();

  @override
  ConsumerState<_MatchFeedSectionImpl> createState() =>
      _MatchFeedSectionImplState();
}

class _MatchFeedSectionImplState extends ConsumerState<_MatchFeedSectionImpl> {
  String currentTournament = "";

  @override
  Widget build(BuildContext context) {
    final feedData = ref.watch(matchFeedProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //_header(context),
        feedData.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
          error: (e, _) =>
              Text("Error: $e", style: const TextStyle(color: Colors.red)),

          data: (list) {
            if (list.isEmpty) {
              return const Text(
                "Join a league to see relevant real life matches",
                style: TextStyle(color: Colors.white70),
              );
            }

            // Combine all matches with tournament metadata
            final combined = <Map<String, dynamic>>[];
            for (final fg in list) {
              final matches = fg.matches;
              for (final m in matches) {
                combined.add({
                  'match': m,
                  'tournamentId': fg.tournamentId,
                  'tournamentName': fg.tournamentName,
                });
              }
            }

            // Sort: live matches first, then by start date (earliest first)
            combined.sort((a, b) {
              final aMatch = a['match'];
              final bMatch = b['match'];

              final aLive =
                  (aMatch?.status ?? '').toString().toLowerCase() == 'live';
              final bLive =
                  (bMatch?.status ?? '').toString().toLowerCase() == 'live';
              if (aLive != bLive) return aLive ? -1 : 1;

              final aDt =
                  DateTime.tryParse(aMatch?.matchDate ?? '') ?? DateTime(9999);
              final bDt =
                  DateTime.tryParse(bMatch?.matchDate ?? '') ?? DateTime(9999);
              return aDt.compareTo(bDt);
            });

            // Apply tournament filter
            final matchupsToRender = currentTournament == ""
                ? combined
                : combined
                      .where((c) => c['tournamentId'] == currentTournament)
                      .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      color: currentTournament == ""
                          ? AppColors.black800
                          : AppColors.black300,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        splashColor: AppColors.black500.withAlpha(25),
                        onTap: () {
                          setState(() {
                            currentTournament = "";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            "All",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: currentTournament == ""
                                      ? AppColors.black100
                                      : AppColors.black600,
                                ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ...list.map(
                      (fg) => Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Material(
                          color: currentTournament == fg.tournamentId
                              ? AppColors.black800
                              : AppColors.black300,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            splashColor: AppColors.black500.withAlpha(25),
                            onTap: () {
                              setState(() {
                                currentTournament = fg.tournamentId;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                fg.abbreviation,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color:
                                          currentTournament == fg.tournamentId
                                          ? AppColors.black100
                                          : AppColors.black600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Render matches or show empty message
                if (matchupsToRender.isEmpty)
                  const Text(
                    "No matches found for this tournament",
                    style: TextStyle(color: Colors.white70),
                  )
                else
                  Column(
                    children: matchupsToRender.map((c) {
                      final m = c['match'];
                      final tournamentLabel =
                          c['tournamentName'] ?? m?.tournamentName ?? "";
                      return MatchCard(
                        homeTeamName: m?.homeTeamName ?? "Home Team",
                        awayTeamName: m?.awayTeamName ?? "Away Team",
                        homeTeamLogo: m?.homeTeamImage,
                        awayTeamLogo: m?.awayTeamImage,
                        matchDateFormatted: m?.matchDate,
                        homeScore: _formatScore(
                          m?.homeTeamScore,
                          m?.homeTeamWickets,
                          m?.homeTeamBalls,
                        ),
                        awayScore: _formatScore(
                          m?.awayTeamScore,
                          m?.awayTeamWickets,
                          m?.awayTeamBalls,
                        ),
                        tournamentLabel: tournamentLabel,
                        isLive:
                            (m?.status ?? "").toString().toLowerCase() ==
                            "live",
                      );
                    }).toList(),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // DATE FORMATTER — fully null & parse safe
  // ---------------------------------------------------------------------------
  // String _formatDate(String? raw) {
  //   if (raw == null || raw.isEmpty) return "--";

  //   try {
  //     final dt = DateTime.tryParse(raw);
  //     if (dt == null) return "--";
  //     return DateFormat("MMM d • h:mm a").format(dt);
  //   } catch (_) {
  //     return "--";
  //   }
  // }

  // ---------------------------------------------------------------------------
  // SCORE FORMATTER — safe on all null combinations
  // ---------------------------------------------------------------------------
  String _formatScore(dynamic runs, dynamic wickets, dynamic balls) {
    final r = runs?.toString() ?? "0";
    final w = wickets?.toString() ?? "0";

    String overs = "--";
    if (balls != null && balls is int && balls >= 0) {
      final o = balls ~/ 6;
      final b = balls % 6;
      overs = "$o.$b";
    }

    return "$r/$w ($overs)";
  }

  // ---------------------------------------------------------------------------
  // TOURNAMENT TAG — fallback when tournamentId is null
  // ---------------------------------------------------------------------------
}
