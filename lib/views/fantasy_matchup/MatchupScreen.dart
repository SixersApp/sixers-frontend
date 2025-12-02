import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sixers/backend/player_performance/player_performance_model.dart';
import 'package:sixers/backend/player_performance/player_performance_provider.dart';

import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_provider.dart';

import 'package:sixers/views/components/matchup_components/matchup_header.dart';

class MatchupScoringView extends ConsumerWidget {
  final String team1FtiId;
  final String team2FtiId;

  const MatchupScoringView({
    super.key,
    required this.team1FtiId,
    required this.team2FtiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // -------------------------------
    // FETCH TEAM 1 DATA
    // -------------------------------
    final team1PerfAsync =
        ref.watch(playerPerformanceControllerProvider(team1FtiId));

    final team1RulesAsync =
        ref.watch(scoringRulesProvider(team1FtiId));

    // -------------------------------
    // FETCH TEAM 2 DATA
    // -------------------------------
    final team2PerfAsync =
        ref.watch(playerPerformanceControllerProvider(team2FtiId));

    final team2RulesAsync =
        ref.watch(scoringRulesProvider(team2FtiId));

    // -------------------------------
    // HANDLE LOADING
    // -------------------------------
    if (team1PerfAsync.isLoading ||
        team1RulesAsync.isLoading ||
        team2PerfAsync.isLoading ||
        team2RulesAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // -------------------------------
    // HANDLE ERRORS
    // -------------------------------
    for (final async in [
      team1PerfAsync,
      team1RulesAsync,
      team2PerfAsync,
      team2RulesAsync
    ]) {
      if (async.hasError) {
        return Center(child: Text("Error: ${async.error}"));
      }
    }

    // -------------------------------
    // UNWRAP VALUES
    // -------------------------------
    final team1Performances = team1PerfAsync.value!;
    final team1Rules = team1RulesAsync.value!;

    final team2Performances = team2PerfAsync.value!;
    final team2Rules = team2RulesAsync.value!;

    // -------------------------------
    // CALCULATE SCORES FOR BOTH TEAMS
    // -------------------------------
    final team1Score = _calculateTeamScore(team1Performances, team1Rules);
    final team2Score = _calculateTeamScore(team2Performances, team2Rules);

    // -------------------------------
    // TEAM CONTEXT INFO
    // (You may override with Fantasy Team name)
    // -------------------------------
    final team1Name =
        team1Performances.isNotEmpty ? (team1Performances.first.homeTeamName ?? "Team 1") : "Team 1";

    final team2Name =
        team2Performances.isNotEmpty ? (team2Performances.first.awayTeamName ?? "Team 2") : "Team 2";

    return MatchupHeader(
      leftTeam: MatchupTeamInfo(teamName: team1Name),
      rightTeam: MatchupTeamInfo(teamName: team2Name),
      leftScore: team1Score,
      rightScore: team2Score,
      gameLabel: "Game",
      leagueLabel: "Fantasy League",
    );
  }

  // ---------------------------------------------------------
  //      SCORING ENGINE (per player → total points)
  // ---------------------------------------------------------
  int _calculateTeamScore(
    List<PlayerPerformance> players,
    List<ScoringRule> rules,
  ) {
    int total = 0;

    for (final p in players) {
      int playerScore = 0;

      final runs = p.runsScored;
      final wickets = p.wicketsTaken;
      final catches = p.catches;

      // ---- POINTS PER RUN ----
      final ruleRuns =
          rules.where((r) => r.stat == "Points per run" && r.category == "batting");
      if (ruleRuns.isNotEmpty) {
        final per = ruleRuns.first.perUnitPoints;
        playerScore += (runs * per).round();
      }

      // ---- POINTS PER WICKET ----
      final ruleWicket =
          rules.where((r) => r.stat == "Points per Wicket" && r.category == "bowling");
      if (ruleWicket.isNotEmpty) {
        final per = ruleWicket.first.perUnitPoints;
        playerScore += (wickets * per).round();
      }

      // ---- POINTS PER CATCH ----
      final ruleCatch =
          rules.where((r) => r.stat == "Points per catch taken" && r.category == "fielding");
      if (ruleCatch.isNotEmpty) {
        final per = ruleCatch.first.perUnitPoints;
        playerScore += (catches * per).round();
      }

      total += playerScore;
    }

    return total;
  }
}