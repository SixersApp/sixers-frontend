import 'package:flutter/material.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:sixers/views/router.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
