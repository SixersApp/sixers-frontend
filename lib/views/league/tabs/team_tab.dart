import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_provider.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/views/league/components/player_roster_card.dart';
import 'package:sixers/views/league/components/team_selector.dart';

class TeamTab extends ConsumerWidget {
  const TeamTab({
    super.key,
    required this.league,
    required this.selectedTeamIndex,
    required this.onTeamSelected,
  });

  final League league;
  final int selectedTeamIndex;
  final Function(int) onTeamSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ftiAsync = ref.watch(fantasyTeamInstanceProvider);

    return ftiAsync.when(
      data: (fti) {
        if (fti == null) {
          return const Center(
            child: Text(
              'No team instance found for this game',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return _buildRosterView(context, ref, fti);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error: $err',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRosterView(BuildContext context, WidgetRef ref, FantasyTeamInstance fti) {
    final playersAsync = ref.watch(fantasyPlayerControllerProvider(fti.id));

    return playersAsync.when(
      data: (players) {
        if (players.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                'No players found for this team',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        }

        // Create a map of player_season_id to FantasyPlayer
        final playerMap = {for (var p in players) p.playerSeasonId: p};

        // Organize players by position
        final batsmen = [
          fti.bat1,
          fti.bat2,
          fti.bat3,
          fti.bat4,
        ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

        final bowlers = [
          fti.bowl1,
          fti.bowl2,
          fti.bowl3,
          fti.bowl4,
        ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

        final allRounders = [
          fti.all1,
          fti.all2,
          fti.all3,
        ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

        final wicketKeepers = [
          fti.wicket1,
          fti.wicket2,
        ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              // Team selector with horizontal scroll
              TeamSelector(
                teams: league.teams,
                selectedIndex: selectedTeamIndex,
                onTeamSelected: onTeamSelected,
              ),

              const SizedBox(height: 16),

              // Game selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 16),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    Text(
                      'Game ${league.latestGame}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // If no players are organized, show all players
              if (batsmen.isEmpty &&
                  bowlers.isEmpty &&
                  allRounders.isEmpty &&
                  wicketKeepers.isEmpty) ...[
                _buildSection('ALL PLAYERS', players),
                const SizedBox(height: 24),
              ] else ...[
                // Batting Section
                _buildSection('BATTING', batsmen),
                const SizedBox(height: 24),

                // Bowling Section
                _buildSection('BOWLING', bowlers),
                const SizedBox(height: 24),

                // All-Rounders Section
                _buildSection('ALL-ROUNDERS', allRounders),
                const SizedBox(height: 24),

                // Wicket-Keepers Section (if any)
                if (wicketKeepers.isNotEmpty) ...[
                  _buildSection('WICKET-KEEPERS', wicketKeepers),
                  const SizedBox(height: 24),
                ],
              ],
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error loading players: $err',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<FantasyPlayer> players) {
    if (players.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(_getSectionIcon(title), color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...players.map(
          (player) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: PlayerRosterCard(player: player),
          ),
        ),
      ],
    );
  }

  IconData _getSectionIcon(String title) {
    switch (title) {
      case 'BATTING':
        return Icons.sports_cricket;
      case 'BOWLING':
        return Icons.sports_baseball;
      case 'ALL-ROUNDERS':
        return Icons.star;
      case 'WICKET-KEEPERS':
        return Icons.sports_handball;
      default:
        return Icons.people;
    }
  }
}

