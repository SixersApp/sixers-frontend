import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_pick_model.dart';

class DraftPickService {
  final _client = Supabase.instance.client;

  Future<List<DraftPick>> fetch(String leagueId) async {
    final rows = await _client
        .from('draft_picks')
        .select()
        .eq('league_id', leagueId)
        .order('pick_number');
    return (rows as List)
        .map((r) => DraftPick.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  /// realtime insert stream
  Stream<DraftPick> stream(String leagueId) {
    final controller = StreamController<DraftPick>();

    final channel = _client
        .channel('public:draft_picks:league_id=eq.$leagueId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          callback: (payload) {
            controller.add(DraftPick.fromJson(payload.newRecord));
          },
        )
        .subscribe();

    controller
      ..onListen = () async {
        final initial = await fetch(leagueId);
        for (final p in initial) controller.add(p);
      }
      ..onCancel = () => _client.removeChannel(channel);

    return controller.stream;
  }

  /// call the make_pick RPC (see SQL in roadmap)
  Future<void> makePick({
    required String leagueId,
    required String teamId,
    required String playerId,
  }) {
    return _client.rpc(
      'make_draft_pick_full',
      params: {
        'p_fantasy_team_id': teamId,
        'p_league_id': leagueId,
        'p_player_id': playerId,
      },
    );
  }
}
