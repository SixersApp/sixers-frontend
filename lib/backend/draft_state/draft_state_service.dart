import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_state_model.dart';

class DraftStateService {
  final _client = Supabase.instance.client;

  Future<DraftState?> fetch(String leagueId) async {
    final row = await _client
        .from('league_draft_state')
        .select()
        .eq('league_id', leagueId)
        .maybeSingle();
    return row == null ? null : DraftState.fromJson(row);
  }

  /// realtime stream of updates to league_draft_state
  Stream<DraftState> stream(String leagueId) {
    final controller = StreamController<DraftState>();
    Timer? pollTimer;

    // Helper to poll for the initial row in case realtime insert is missed
    Future<void> _pollInitial() async {
      final initial = await fetch(leagueId);
      if (initial != null) {
        controller.add(initial);
        pollTimer?.cancel();
        pollTimer = null;
      }
    }

    final channel = _client
        .channel('public:league_draft_state:league_id=eq.$leagueId')
        // 🔹 INSERT to catch the first row
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          callback: (payload) {
            controller.add(DraftState.fromJson(payload.newRecord));
            pollTimer?.cancel();
            pollTimer = null;
          },
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          callback: (payload) =>
              controller.add(DraftState.fromJson(payload.newRecord)),
        )
        .subscribe();

    controller
      ..onListen = () async {
        await _pollInitial();
        // if still no state, periodically poll until row exists
        pollTimer ??=
            Timer.periodic(const Duration(seconds: 2), (_) => _pollInitial());
      }
      ..onCancel = () {
        pollTimer?.cancel();
        _client.removeChannel(channel);
      };

    return controller.stream;
  }
}
