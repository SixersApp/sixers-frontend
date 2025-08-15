import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'player_model.dart';
import 'player_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

part 'player_provider.g.dart';

@riverpod
Future<List<Player>> allPlayers(ref, String tournamentId) {
  return PlayerService().fetchByTournament(tournamentId);
}

// Live stream for players scoped to a tournament; emits list initially and on changes
final allPlayersStreamProvider = StreamProvider.family<List<Player>, String>((ref, tournamentId) {
  final client = Supabase.instance.client;
  final controller = StreamController<List<Player>>.broadcast();

  Future<void> emitCurrent() async {
    try {
      final list = await PlayerService().fetchByTournament(tournamentId);
      controller.add(list);
    } catch (e) {
      print('Error fetching players: $e');
    }
  }

  // Create a unique channel name for this tournament
  final channelName = 'players_$tournamentId';

  final channel = client.channel(channelName);

  // Listen to all changes on the players table
  channel.onPostgresChanges(
    event: PostgresChangeEvent.all,
    schema: 'public',
    table: 'players',
    callback: (payload) {
      // Check if the change affects this tournament
      if (payload.newRecord != null && payload.newRecord['tournament_id'] == tournamentId) {
        emitCurrent();
      } else if (payload.oldRecord != null && payload.oldRecord['tournament_id'] == tournamentId) {
        emitCurrent();
      }
    },
  );

  channel.subscribe();

  controller
    ..onListen = () {
      emitCurrent();
    };

  ref.onDispose(() {
    client.removeChannel(channel);
    controller.close();
  });

  return controller.stream;
});
