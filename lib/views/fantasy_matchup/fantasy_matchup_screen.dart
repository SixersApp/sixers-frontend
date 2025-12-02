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
      return const Center(child: CircularProgressIndicator());
    }

    if (team1Async.hasError) {
      return Text("Team 1 ERROR: ${team1Async.error}");
    }
    if (team2Async.hasError) {
      return Text("Team 2 ERROR: ${team2Async.error}");
    }

    final team1 = team1Async.value!;
    final team2 = team2Async.value!;

    final team1Score = team1.fold<int>(0, (sum, p) => sum + p.fantasyPoints);
    final team2Score = team2.fold<int>(0, (sum, p) => sum + p.fantasyPoints);

    return Scaffold(
      appBar: AppBar(title: const Text("Matchup")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- SCORE HEADER (like screenshot top) ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$team1Score",
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const Text(" : ", style: TextStyle(fontSize: 32)),
              Text("$team2Score",
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 20),

          // -------- TEAM 1 TITLE --------
          Text("Team 1 Players",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),

          ...team1.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PlayerRow(p: p),
              )),

          const SizedBox(height: 30),

          // -------- TEAM 2 TITLE --------
          Text("Team 2 Players",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),

          ...team2.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PlayerRow(p: p),
              )),
        ],
      ),
    );
  }
}