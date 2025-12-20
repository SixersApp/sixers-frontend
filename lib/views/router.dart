import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/onboarding/onboarding_provider.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/auth/sign_up_page.dart';
import 'package:sixers/views/fantasy_matchup/fantasy_matchup_screen.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'package:sixers/views/onboarding/basic_info_screen.dart';
import 'package:sixers/views/onboarding/experience_screen.dart';
import 'package:sixers/views/settings/settings_screen.dart';
import 'package:sixers/views/splash.dart';



final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: SplashScreen.route,
    refreshListenable: _RouterNotifier(ref),
    redirect: (context, state) {
      // READ (do not watch) providers here to avoid recreating the router
      final authState = ref.read(authProviderProvider);
      final onboardingState = ref.read(onboardingStageProvider);

      final location = state.matchedLocation;
      final uri = state.uri;


      if (authState.isLoading || onboardingState.isLoading) return null;
      if (uri.toString().contains('auth')) {
        if (authState.value != null) {
          if (onboardingState.isLoading) return SignInScreen.route;
          if (onboardingState.value == null) return SignInScreen.route;
          switch (onboardingState.value!.onboardingStage) {
            case 0:
              return BasicInfoScreen.route;
            case 1:
              return ExperienceScreen.route;
            case 2:
              return HomeScreen.route;
            default:
              return BasicInfoScreen.route;
          }
        }
        return SignInScreen.route;
      }

      if (uri.host == 'sign-out' || uri.toString().contains('sign-out')) {
        if (authState.value == null) return SignInScreen.route;
        return SettingsScreen.route;
      }

      if (location == (SplashScreen.route)) {
        if (authState.value == null) return SignInScreen.route;
        if (onboardingState.value == null) return BasicInfoScreen.route;
        switch (onboardingState.value!.onboardingStage) {
          case 0:
            return BasicInfoScreen.route;
          case 1:
            return ExperienceScreen.route;
          case 2:
            return HomeScreen.route;
          default:
            return BasicInfoScreen.route;
        }
      }

      if (location == (SignInScreen.route) ||
          location == (SignUpScreen.route)) {
        if (authState.value == null) return null;
        if (onboardingState.value == null) return BasicInfoScreen.route;
        switch (onboardingState.value!.onboardingStage) {
          case 0:
            return BasicInfoScreen.route;
          case 1:
            return ExperienceScreen.route;
          case 2:
            return HomeScreen.route;
          default:
            return BasicInfoScreen.route;
        }
      }

      if (location.startsWith("/onboarding")) {
        if (authState.value == null) return SignInScreen.route;
        if (onboardingState.value == null) return BasicInfoScreen.route;
        switch (onboardingState.value!.onboardingStage) {
          case 0:
            return BasicInfoScreen.route;
          case 1:
            return ExperienceScreen.route;
          case 2:
            return HomeScreen.route;
          default:
            return BasicInfoScreen.route;
        }
      }

      if (authState.value == null &&
          !(location == (SignInScreen.route) ||
              location == (SignUpScreen.route))) {
        return SignInScreen.route;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: SplashScreen.route,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: SignInScreen.route,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.route,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: BasicInfoScreen.route,
        builder: (context, state) => BasicInfoScreen(),
      ),
      GoRoute(
        path: ExperienceScreen.route,
        builder: (context, state) => ExperienceScreen(),
      ),
      GoRoute(
        path: SettingsScreen.route,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/fantasyMatchup',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return FantasyMatchupScreen(
            team1FtiId: extra["team1FtiId"],
            team2FtiId: extra["team2FtiId"],
          );
        },
      ),
    ],
  );
});

class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(Ref ref) {
    // Listen to providers without rebuilding the routerProvider
    ref.listen(authProviderProvider, (_, _) => notifyListeners());
    ref.listen(onboardingStageProvider, (_, _) => notifyListeners());
  }
}

// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//       (dynamic _) => notifyListeners(),
//     );
//   }

//   late final StreamSubscription<dynamic> _subscription;
//   StreamSubscription<dynamic> get subscription => _subscription;
//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
