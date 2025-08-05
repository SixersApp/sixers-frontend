import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'player_model.dart';
import 'player_service.dart';

part 'player_provider.g.dart';

@riverpod
Future<List<Player>> allPlayers(ref, String tournamentId) {
  return PlayerService().fetchByTournament(tournamentId);
}
