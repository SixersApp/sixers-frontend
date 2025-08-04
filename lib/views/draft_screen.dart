// lib/screens/drafts_screen.dart
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';

class DraftScreen extends ConsumerWidget {
  const DraftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider);
    final teamsAsync = ref.watch(fantasyTeamsProvider);

    // ▸ Show a unified loading spinner if EITHER provider is loading
    if (leaguesAsync.isLoading || teamsAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // ▸ Handle error from either provider
    if (leaguesAsync.hasError) {
      return Scaffold(
        body: Center(child: Text('Leagues error: ${leaguesAsync.error}')),
      );
    }
    if (teamsAsync.hasError) {
      return Scaffold(
        body: Center(child: Text('Teams error: ${teamsAsync.error}')),
      );
    }

    final leagues = leaguesAsync.requireValue;
    final teams = teamsAsync.requireValue;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Draft Leagues')),
      body: leagues.isEmpty
          ? const Center(child: Text('No leagues joined yet.'))
          : ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (_, i) {
                final league = leagues[i];
                // find the user’s team for this league (if any)
                final myTeam = teams.firstWhereOrNull(
                  (t) => t.leagueId == league.id,
                );

                return ListTile(
                  title: Text(league.name),
                  subtitle: Text(
                    myTeam != null
                        ? 'Your Team: ${myTeam.teamName}'
                        : 'No team yet',
                  ),
                  trailing: Text('Status: ${league.status.name}'),
                );
              },
            ),
    );
  }
}
