import 'package:supabase_flutter/supabase_flutter.dart';
import 'player_model.dart';

class PlayerService {
  final _c = Supabase.instance.client;

  Future<List<Player>> fetchByTournament(String tournamentId) async {
    final rows = await _c
        .from('players')
        .select()
        .eq('tournament_id', tournamentId);
    return (rows as List)
        .map((r) => Player.fromJson(r as Map<String, dynamic>))
        .toList();
  }
}
