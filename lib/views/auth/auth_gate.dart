import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:sixers/views/onboarding/experience_screen.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/onboarding/basic_info_screen.dart';
import 'package:sixers/views/router.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProviderProvider);

    if (user == null) {
      return const SignInScreen();
    }

    final stageAsync = ref.watch(onboardingStageProvider);

    return stageAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => const BasicInfoScreen(),
      data: (stage) {
        switch (stage) {
          case 0:
            return const BasicInfoScreen();
          case 1:
            return const ExperienceScreen();
          default:
            return MaterialApp.router(
              routerConfig: router,
              theme: AppTheme.dark,
              darkTheme: AppTheme.dark,
              themeMode: ThemeMode.dark,
            );
        }
      },
    );
  }
}
