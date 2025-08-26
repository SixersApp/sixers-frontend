import 'package:supabase_flutter/supabase_flutter.dart';
import 'tournament_model.dart';

class TournamentService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Tournament>> fetchAll() async {
    final data = await _client
        .from('tournaments')
        .select('id,name,season,start_date,created_at,num_matches')
        .order('season', ascending: false)
        .order('name', ascending: true);
    return (data as List)
        .map((e) => Tournament.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
