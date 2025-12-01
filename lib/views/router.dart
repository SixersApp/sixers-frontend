import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/views/auth/verify_code_page.dart';
import 'package:sixers/views/create_league/create_league_screen.dart';
import 'package:sixers/views/draft/draft_lobby_screen.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'package:sixers/views/league/league_screen.dart';
import 'package:sixers/views/settings/settings_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/draft',
      builder: (context, state) => DraftLobby(league: state.extra as League),
    ),
    GoRoute(path: '/create-league', builder: (context, state) => const CreateLeagueScreen()),
    GoRoute(
      path: '/league',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final leagueId = extra['leagueId'] as String?;
        final matchupId = extra['matchupId'] as String?;
        if (leagueId == null) {
          return const Scaffold(body: Center(child: Text('League not found')));
        }
        return LeagueScreen(leagueId: leagueId, matchupId: matchupId);
      },
    ),
    GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
  ],
);
