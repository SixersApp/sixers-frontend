import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/views/create_league/create_league_screen.dart';
import 'package:sixers/views/home/draft_screen.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'package:sixers/views/league/league_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/draft', builder: (context, state) => const DraftScreen()),
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
  ],
);
