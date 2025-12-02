import 'package:flutter/material.dart';
import 'package:sixers/views/components/matchup_components/matchup_header.dart';

void main() {
  runApp(const TestMatchupHeaderApp());
}

class TestMatchupHeaderApp extends StatelessWidget {
  const TestMatchupHeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0D0F14),
        appBar: AppBar(
          title: const Text("Matchup Header Test"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: MatchupHeader(
              leftTeam: MatchupTeamInfo(
                teamName: "KITTU’S KOOL KIDS",
                logo: const Icon(Icons.star, color: Colors.white, size: 40),
              ),
              rightTeam: MatchupTeamInfo(
                teamName: "THE GOAT GANG",
                logo: const Icon(Icons.whatshot, color: Colors.white, size: 40),
              ),
              leftScore: 122,
              rightScore: 118,
              gameLabel: "Game 8",
              leagueLabel: "IPL",
              isLive: true,
            ),
          ),
        ),
      ),
    );
  }
}