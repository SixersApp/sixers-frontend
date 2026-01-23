// lib/backend/leagues/league_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/utils/logger.dart';
import '../auth/auth_provider.dart';
import '../fantasy_team/fantasy_team_model.dart';
import 'league_model.dart';
import 'league_service.dart';

part 'league_provider.g.dart';

@riverpod
class Leagues extends _$Leagues {
  @override
  Future<List<League>> build() async {
    // Wait for authentication to finish loading
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];

    final service = LeagueService();

    try {
      final leagues = await service.getLeagues();

      /* // ADD MOCK TEAMS FOR TESTING (temporary)
      final leaguesWithMockTeams = leagues.map((league) {
        final mockTeams = [
          ...league.teams,
          FantasyTeam(
            id: 'mock-1',
            leagueId: league.id,
            userId: 'mock-user-1',
            teamName: 'Thunder Strikers',
            teamColor: '#FF6B6B',
            teamIcon: 'lion',
          ),
          FantasyTeam(
            id: 'mock-2',
            leagueId: league.id,
            userId: 'mock-user-2',
            teamName: 'Royal Champions',
            teamColor: '#4ECDC4',
            teamIcon: 'eagle',
          ),
          FantasyTeam(
            id: 'mock-3',
            leagueId: league.id,
            userId: 'mock-user-3',
            teamName: 'Blazing Phoenix',
            teamColor: '#FFD93D',
            teamIcon: 'tiger',
          ),
          FantasyTeam(
            id: 'mock-4',
            leagueId: league.id,
            userId: 'mock-user-4',
            teamName: 'Storm Warriors',
            teamColor: '#6BCB77',
            teamIcon: 'bear',
          ),
          FantasyTeam(
            id: 'mock-5',
            leagueId: league.id,
            userId: 'mock-user-5',
            teamName: 'Mighty Dragons',
            teamColor: '#9D84B7',
            teamIcon: 'dragon',
          ),
        ];

        return league.copyWith(teams: mockTeams);
      }).toList();

      return leaguesWithMockTeams; */
      return leagues;
    } catch (e, st) {
      logError("❌ Error loading leagues: $e\n$st");
      rethrow;
    }
  }

  /// Allows manual refreshing just like matchups
  Future<void> refresh() async {
    state = await AsyncValue.guard(() => build());
  }

  /// Updates a specific league in the local state
  void updateLeague(League updatedLeague) {
    final currentState = state;
    if (currentState is AsyncData<List<League>>) {
      final leagues = currentState.value;
      final updatedLeagues = leagues.map((league) {
        if (league.id == updatedLeague.id) {
          return updatedLeague;
        }
        return league;
      }).toList();
      state = AsyncData(updatedLeagues);
    }
  }
}
