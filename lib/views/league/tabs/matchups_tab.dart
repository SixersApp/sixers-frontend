import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/views/components/matchup_card/matchup_card.dart';
import 'package:sixers/utils/string_to_avatar.dart';

class MatchupsTab extends ConsumerWidget {
  const MatchupsTab({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchupsAsync = ref.watch(userMatchupsProvider);

    return matchupsAsync.when(
      data: (allMatchups) {
        // Filter matchups for this league
        final leagueMatchups = allMatchups
            .where((matchup) => matchup.leagueId == league.id)
            .toList();

        if (leagueMatchups.isEmpty) {
          return const Center(
            child: Text(
              'No matchups found for this league',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: leagueMatchups.map((matchup) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildMatchupCard(matchup),
                );
              }).toList(),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error loading matchups: $err',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMatchupCard(Matchup matchup) {
    // Find the teams from the league
    final team1 = league.teams.firstWhere(
      (t) => t.id == matchup.fantasyTeam1Id,
      orElse: () => league.teams.first,
    );
    final team2 = league.teams.firstWhere(
      (t) => t.id == matchup.fantasyTeam2Id,
      orElse: () => league.teams.first,
    );

    return MatchupCard(
      team1Name: team1.teamName,
      team1Score: matchup.fantasyTeamInstance1Score.toString(),
      team1PlayersLeft: 0, // TODO: Calculate players left
      team1WinProbability: 50, // TODO: Calculate win probability
      team1Logo: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          stringToAvatar(team1.teamIcon),
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
      team1Color: stringToColor(team1.teamColor),
      team2Name: team2.teamName,
      team2Score: matchup.fantasyTeamInstance2Score.toString(),
      team2PlayersLeft: 0, // TODO: Calculate players left
      team2WinProbability: 50, // TODO: Calculate win probability
      team2Logo: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          stringToAvatar(team2.teamIcon),
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
      team2Color: stringToColor(team2.teamColor),
      leagueName: league.name,
      gameNumber: 'Game ${matchup.matchNum}',
      matchupId: matchup.id,
      leagueId: matchup.leagueId,
      team1FtiId: matchup.fantasyTeamInstance1Id,
      team2FtiId: matchup.fantasyTeamInstance2Id,
      isLive: true, // TODO: Determine if live
    );
  }
}

