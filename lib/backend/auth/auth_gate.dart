// lib/auth/auth_gate.dart
import 'package:flutter/material.dart';
import 'package:sixers/navbar/main_scaffold.dart';
import 'package:sixers/views/sign_in_screen.dart';
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
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (session == null) {
          return const SignInScreen(); // custom sign-in page
        } else {
          return const MainScaffold(); // nav shell
        }
      },
    );
  }
}
