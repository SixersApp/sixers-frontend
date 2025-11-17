import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/matchup/matchup_provider.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'package:sixers/backend/real_team/real_team_provider.dart';
import 'package:sixers/backend/roster/roster_service.dart';

part 'roster_provider.g.dart';

@riverpod
Future<TeamContentData> teamContentData(Ref ref, League league) async {
  // Watch auth provider to react to auth changes
  final user = ref.watch(authProvider);
  final userId = user?.id;

  // Watch all providers to establish reactive dependencies
  // When any of these change, this provider will rebuild
  // Using .future after watch() gives us the Future<T> which we can await
  // This is the standard pattern for awaiting AsyncProviders in a FutureProvider
  final teams = await ref.watch(fantasyTeamsProvider(leagueId: league.id).future);
  final players = await ref.watch(allPlayersProvider(league.tournamentId).future);
  final realTeams = await ref.watch(realTeamsProvider(tournamentId: league.tournamentId).future);
  final picks = await ref.watch(draftPicksProvider(league.id).future);
  final matchups = await ref.watch(matchupsProvider(leagueId: league.id).future);

  final realTeamNameById = {for (final rt in realTeams) rt.id: rt.name};

  return RosterService().buildTeamContentData(
    teams: teams,
    picks: picks,
    players: players,
    realTeamNameById: realTeamNameById,
    currentUserId: userId,
    matchups: matchups,
  );
}
