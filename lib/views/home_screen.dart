import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../backend/auth/auth_provider.dart'; // adjust path if different

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authProvider.notifier).signOut();
              // Optionally show a snack-bar or navigate to login page here
            },
          ),
        ],
      ),
      body: const Center(child: Text('Home')),
    );
  }
}
