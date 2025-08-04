import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sixers/backend/auth/auth_gate.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/services/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlayersScreen extends ConsumerWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersAsync = ref.watch(playersFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sixers Players'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await ref.read(authProvider.notifier).signOut();
            },
          ),
        ],
      ),
      body: playersAsync.when(
        data: (players) => ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return ListTile(
              title: Text(player.name),
              subtitle: Text(
                'ID: ${player.id}\nTournament: ${player.tournaments.name}\nReal Team: ${player.real_teams.name}',
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
