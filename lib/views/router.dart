import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/g_auth_origin_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/onboarding/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/auth/sign_up_page.dart';
import 'package:sixers/views/create_league/create_league_screen.dart';
import 'package:sixers/views/create_league/create_team_screen.dart';
import 'package:sixers/views/create_league/customize_scoring_screen.dart';
import 'package:sixers/views/create_league/commissioner_pre_draft_screen.dart';
import 'package:sixers/views/create_league/league_settings_screen.dart';
import 'package:sixers/views/create_league/join_league_screen.dart';
import 'package:sixers/views/create_league/league_preview_screen.dart';
import 'package:sixers/views/error_screen.dart';
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
      final gAuthOrigin = ref.read(gAuthOriginProvider);

      final location = state.matchedLocation;
      final uri = state.uri;

      logDebug("Redirecting!");

      if (authState.isLoading || onboardingState.isLoading) return null;
      if (uri.toString().contains('auth')) {
        if (authState.value != null) {
          if (onboardingState.isLoading) return gAuthOrigin;
          if (onboardingState.value == null) return gAuthOrigin;
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
        return gAuthOrigin;
      }

      if (uri.host == 'sign-out' || uri.toString().contains('sign-out')) {
        if (authState.value == null) return gAuthOrigin;
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

      if(location == BasicInfoScreen.route) {
        if (authState.value == null) return SignInScreen.route;
        if (onboardingState.value == null) return BasicInfoScreen.route;
        if(onboardingState.value!.onboardingStage == 2) {
          return HomeScreen.route;
        }
        return null;
      }

      if (location == ExperienceScreen.route) {
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
        return gAuthOrigin;
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
      GoRoute(
        path: CreateLeagueScreen.route,
        builder: (context, state) => const CreateLeagueScreen(),
      ),
      GoRoute(
        path: CustomizeScoringScreen.route,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return CustomizeScoringScreen(leagueData: extra);
        },
      ),
      GoRoute(
        path: CreateTeamScreen.route,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return CreateTeamScreen(
            leagueName: extra['leagueName'] as String,
            tournamentId: extra['tournamentId'] as String,
            scoringRules: extra['scoringRules'],
          );
        },
      ),
      GoRoute(
        path: "/leagues/:id",
        builder: (context, state) {
          final leagueId = state.pathParameters["id"]!;
          return LeagueLoader(leagueId: leagueId);
        },
      ),
      GoRoute(
        path: "/league/:id/settings",
        builder: (context, state) {
          final leagueId = state.pathParameters["id"]!;
          return LeagueSettingsScreen(leagueId: leagueId);
        },
      ),
      GoRoute(
        path: JoinLeagueScreen.route,
        builder: (context, state) => const JoinLeagueScreen(),
      ),
      GoRoute(
        path: LeaguePreviewScreen.route,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return LeaguePreviewScreen(league: extra['league'] as League);
        },
      ),
      GoRoute(
        path: '/join-league/:id/team',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final league = extra['league'] as League;
          return CreateTeamScreen(
            leagueToJoin: league,
            joinCode: league.joinCode,
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


class LeagueLoader extends ConsumerWidget {
  final String leagueId;
  const LeagueLoader({Key? key, required this.leagueId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider);

    return leaguesAsync.when(
      data: (leagues) {
        final matching = leagues.where((e) => e.id == leagueId);
        if (matching.isEmpty) {
          return const ErrorScreen(error: "League Not Found");
        }
        final currentLeague = matching.first;
        switch (currentLeague.status) {
          case LeagueStatus.draft_pending:
            return CommissionerPreDraftScreen(leagueId: leagueId);
          case LeagueStatus.draft_in_progress:
            return CommissionerPreDraftScreen(leagueId: leagueId);
          default:
            return CommissionerPreDraftScreen(leagueId: leagueId);
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => ErrorScreen(error: err.toString()),
    );
  }
}
