// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sixers/backend/auth/auth_gate.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'services/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const ProviderScope(child: SixersApp()));
}

class SixersApp extends StatelessWidget {
  const SixersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AuthGate(), // 👈 Replaces PlayersScreen
    );
  }
}
