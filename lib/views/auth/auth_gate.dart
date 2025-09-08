import 'package:flutter/material.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:sixers/views/router.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/views/basic_info_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (session == null) {
          return const SignInScreen();
        } else {
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

/// Check if user has completed onboarding process
/// You'll need to implement this based on your user profile structure
Future<bool> _checkOnboardingStatus(String userId) async {
  try {
    // TODO: Replace with your actual user profile check
    // For now, we'll assume onboarding is incomplete for new users
    final response = await Supabase.instance.client
        .from('user_profiles') // Adjust table name as needed
        .select('onboarding_completed')
        .eq('user_id', userId)
        .maybeSingle();

    if (response == null) {
      // No profile exists, need onboarding
      return false;
    }

    return response['onboarding_completed'] ?? false;
  } catch (e) {
    // On error, assume onboarding is needed
    return false;
  }
}
