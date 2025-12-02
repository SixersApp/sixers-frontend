import 'package:go_router/go_router.dart';
import 'package:sixers/views/auth/auth_gate.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'package:sixers/views/settings/settings_screen.dart';

final GoRouter router = GoRouter(
  redirect: (context, state) {
    // TODO: Insert your Amplify auth logic here
    // Return '/' or '/login' etc.
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthGate()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),

  ],
);