// lib/screens/drafts_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DraftsScreen extends ConsumerStatefulWidget {
  const DraftsScreen({super.key});

  @override
  ConsumerState<DraftsScreen> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends ConsumerState<DraftsScreen> {
  @override
  void initState() {
    super.initState();
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId != null) {
      ref.read(leaguesProvider.notifier).loadLeaguesForUser(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final leaguesAsync = ref.watch(leaguesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Draft Leagues")),
      body: leaguesAsync.when(
        data: (leagues) {
          if (leagues.isEmpty) {
            return const Center(child: Text("No leagues joined yet."));
          }
          return ListView.builder(
            itemCount: leagues.length,
            itemBuilder: (context, index) {
              final league = leagues[index];
              return ListTile(
                title: Text(league.name),
                subtitle: Text("Status: ${league.status.name}"),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error loading leagues: $e")),
      ),
    );
  }
}
