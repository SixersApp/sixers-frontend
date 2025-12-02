import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_provider.dart';
import 'package:sixers/views/components/matchup_page/player_row.dart';

class FantasyMatchupScreen extends ConsumerWidget {
  final String team1FtiId;
  final String team2FtiId;

  const FantasyMatchupScreen({
    super.key,
    required this.team1FtiId,
    required this.team2FtiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team1Async = ref.watch(fantasyPlayerControllerProvider(team1FtiId));
    final team2Async = ref.watch(fantasyPlayerControllerProvider(team2FtiId));

    if (team1Async.isLoading || team2Async.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (team1Async.hasError) {
      return Scaffold(body: Center(child: Text("Team 1 ERROR: ${team1Async.error}")));
    }
    if (team2Async.hasError) {
      return Scaffold(body: Center(child: Text("Team 2 ERROR: ${team2Async.error}")));
    }

    final team1 = team1Async.value!;
    final team2 = team2Async.value!;

    final team1Score = team1.fold<int>(0, (sum, p) => sum + p.fantasyPoints);
    final team2Score = team2.fold<int>(0, (sum, p) => sum + p.fantasyPoints);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Matchup",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      backgroundColor: const Color(0xFF0D0D0D),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // ------- Score Header -------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$team1Score",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  "$team2Score",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ------- Team 1 -------
          Text(
            "Team 1 Players",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 12),

          ...team1.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PlayerRow(p: p),
              )),

          const SizedBox(height: 26),

          // ------- Team 2 -------
          Text(
            "Team 2 Players",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 12),

          ...team2.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PlayerRow(p: p),
              )),
        ],
      ),
    );
  }
}