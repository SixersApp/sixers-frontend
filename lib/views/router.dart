import 'package:go_router/go_router.dart';
import 'package:sixers/views/create_league/create_league_screen.dart';
import 'package:sixers/views/home/draft_screen.dart';
import 'package:sixers/views/home/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/draft', builder: (context, state) => const DraftScreen()),
    GoRoute(path: '/create-league', builder: (context, state) => const CreateLeagueScreen()),
  ],
);
