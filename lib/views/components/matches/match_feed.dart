import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/live_match/live_match_provider.dart';
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
    final liveData = ref.watch(liveMatchesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        liveData.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
          error: (e, _) =>
              Text("Error: $e", style: const TextStyle(color: Colors.red)),
          data: (matchMap) {
            if (matchMap.isEmpty) {
              return const Text(
                "Join a league to see relevant real life matches",
                style: TextStyle(color: Colors.white70),
              );
            }

            final matches = matchMap.values.toList();

            // Sort: live first, then upcoming, then finished
            int statusOrder(String status) {
              final s = status.toUpperCase();
              if (s == 'LIVE') return 0;
              if (s == 'FINISHED' || s == 'ABAN') return 2;
              return 1; // NS / upcoming
            }

            matches.sort((a, b) {
              final cmp = statusOrder(a.status).compareTo(statusOrder(b.status));
              if (cmp != 0) return cmp;

              final aDt = DateTime.tryParse(a.matchDate) ?? DateTime(9999);
              final bDt = DateTime.tryParse(b.matchDate) ?? DateTime(9999);
              return aDt.compareTo(bDt);
            });

            // Build tournament filter chips
            final tournamentIds = <String>{};
            final tournamentAbbreviations = <String, String>{};
            for (final m in matches) {
              tournamentIds.add(m.tournamentId);
              if (m.abbreviation != null) {
                tournamentAbbreviations[m.tournamentId] = m.abbreviation!;
              } else if (m.tournamentName != null) {
                tournamentAbbreviations[m.tournamentId] = m.tournamentName!;
              }
            }

            // Apply tournament filter
            final filtered = currentTournament.isEmpty
                ? matches
                : matches
                      .where((m) => m.tournamentId == currentTournament)
                      .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildFilterChip(context, "", "All"),
                    const SizedBox(width: 10),
                    ...tournamentIds.map(
                      (tid) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: _buildFilterChip(
                          context,
                          tid,
                          tournamentAbbreviations[tid] ?? tid.substring(0, 3).toUpperCase(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                if (filtered.isEmpty)
                  const Text(
                    "No matches found for this tournament",
                    style: TextStyle(color: Colors.white70),
                  )
                else
                  Column(
                    children: filtered.map((m) {
                      return MatchCard(
                        homeTeamName: m.homeTeamAbbreviation ?? m.homeTeamName ?? "Home",
                        awayTeamName: m.awayTeamAbbreviation ?? m.awayTeamName ?? "Away",
                        homeTeamLogo: m.homeTeamImage,
                        awayTeamLogo: m.awayTeamImage,
                        matchDateFormatted: m.matchDate,
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
                        tournamentLabel: m.abbreviation ?? m.tournamentName ?? "",
                        status: m.status,
                        result: m.result,
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

  Widget _buildFilterChip(BuildContext context, String id, String label) {
    final isSelected = currentTournament == id;
    return Material(
      color: isSelected ? AppColors.black800 : AppColors.black300,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: AppColors.black500.withAlpha(25),
        onTap: () {
          setState(() {
            currentTournament = id;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected ? AppColors.black100 : AppColors.black600,
                ),
          ),
        ),
      ),
    );
  }

  String _formatScore(dynamic runs, dynamic wickets, dynamic balls) {
    if (runs == null && wickets == null && balls == null) return "";
    final r = runs?.toString() ?? "0";
    final w = wickets?.toString() ?? "0";

    if (balls == null || balls is! int || balls < 0) return "$r/$w";
    final o = balls ~/ 6;
    final b = balls % 6;
    return "$r/$w ($o.$b)";
  }
}
