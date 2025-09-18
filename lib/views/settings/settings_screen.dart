import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(onPressed: () => {Auth().signOut(), GoRouter.of(context).go('/')}, child: const Text('Sign Out')),
      ),
    );
  }
}
