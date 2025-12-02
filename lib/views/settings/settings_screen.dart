import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await ref.read(authProviderProvider.notifier).signOut();
            if (context.mounted) {
              GoRouter.of(context).go('/');
            }
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}