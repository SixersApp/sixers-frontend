import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sixers/backend/match/match_provider.dart';
import 'package:sixers/views/components/matches/match_card.dart';

class MatchFeedSection extends ConsumerWidget {
  const MatchFeedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesAsync = ref.watch(matchFeedProvider());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //_header(context),

        matchesAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
          error: (e, _) => Text(
            "Error: $e",
            style: const TextStyle(color: Colors.red),
          ),

          data: (list) {
            if (list.isEmpty) {
              return const Text(
                "No upcoming games.",
                style: TextStyle(color: Colors.white70),
              );
            }

            // NULL-SAFE filtering
            final live = list.where(
              (m) => (m.status ?? "").toLowerCase() == "live",
            );

            final upcoming = list
                .where((m) => (m.status ?? "").toLowerCase() != "live");

            final combined = [...live, ...upcoming];

            return Column(
              children: combined.map(
                (m) {
                  return MatchCard(
                    homeTeamName: m.homeTeamName ?? "Home Team",
                    awayTeamName: m.awayTeamName ?? "Away Team",
                    homeTeamLogo: m.homeTeamImage,
                    awayTeamLogo: m.awayTeamImage,
                    matchDateFormatted: m.matchDate ?? "TBD",
                    homeScore: _formatScore(
                      m.homeTeamScore,
                      m.homeTeamWickets,
                      m.homeTeamBalls,
                    ),

                    awayScore: _formatScore(
                      m.awayTeamScore,
                      m.awayTeamWickets,
                      m.awayTeamBalls,
                    ),

                    tournamentLabel: m.tournamentName ?? "",
                    isLive: (m.status ?? "").toLowerCase() == "live",
                  );
                },
              ).toList(),
            );
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // HEADER ROW
  // ---------------------------------------------------------------------------
  // Widget _header(BuildContext context) {
  //   return Row(
  //     children: [
  //       const Text(
  //         "Live/Upcoming Games",
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 20,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //       const Spacer(),
  //       GestureDetector(
  //         onTap: () {
  //           // TODO: navigate to full match list
  //         },
  //         child: Text(
  //           "View All →",
  //           style: TextStyle(
  //             color: Colors.green.shade400,
  //             fontSize: 14,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // ---------------------------------------------------------------------------
  // DATE FORMATTER — fully null & parse safe
  // ---------------------------------------------------------------------------
  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return "--";

    try {
      final dt = DateTime.tryParse(raw);
      if (dt == null) return "--";
      return DateFormat("MMM d • h:mm a").format(dt);
    } catch (_) {
      return "--";
    }
  }

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