import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'services/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['SUPABASE_ANON_KEY']!);

  runApp(ProviderScope(child: const SixersApp()));
}

class SixersApp extends StatelessWidget {
  const SixersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixers',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const PlayersScreen(),
    );
  }
}

class PlayersScreen extends ConsumerWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersAsync = ref.watch(playersFutureProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Sixers Players')),
      body: playersAsync.when(
        data: (players) => ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return ListTile(title: Text(player.name), subtitle: Text('ID: \\${player.id}'));
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: \\${e.toString()}')),
      ),
    );
  }
}
