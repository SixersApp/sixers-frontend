
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../backend/leagues/league_provider.dart';
import '../backend/fantasy_team/fantasy_team_provider.dart';
import 'draft_lobby.dart'; 

class DraftScreen extends ConsumerWidget {
  const DraftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider);
    final teamsAsync = ref.watch(fantasyTeamsProvider);

    if (leaguesAsync.isLoading || teamsAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (leaguesAsync.hasError) {
      return _err('Leagues', leaguesAsync.error);
    }
    if (teamsAsync.hasError) {
      return _err('Teams', teamsAsync.error);
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DraftLobby(league: league),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  Scaffold _err(String which, Object? err) =>
      Scaffold(body: Center(child: Text('$which error: $err')));
}
