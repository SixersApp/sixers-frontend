import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'package:sixers/views/onboarding/experience_screen.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/onboarding/basic_info_screen.dart';
import 'package:sixers/views/router.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProviderProvider);

    return authAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        body: Center(child: Text("Authentication error: $err")),
      ),
      data: (session) {
        // User not logged in → go to login
        if (session == null) {
          return const SignInScreen();
        }

        // Now check onboarding state
        final onboardingAsync = ref.watch(onboardingStageProvider);

        return onboardingAsync.when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (_, __) => const BasicInfoScreen(),
          data: (stage) {
            switch (stage) {
              case 0:
                return const BasicInfoScreen();
              case 1:
                return const ExperienceScreen();
              default:
                return SignInScreen();
            }
          },
        );
      },
    );
  }
}