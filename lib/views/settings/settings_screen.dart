import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/g_auth_origin_provider.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';

class SettingsScreen extends ConsumerWidget {
  static final String route = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () async {
            ref.read(gAuthOriginProvider.notifier).changeOrigin(SignInScreen.route);
            await ref.read(authProviderProvider.notifier).signOut();
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}