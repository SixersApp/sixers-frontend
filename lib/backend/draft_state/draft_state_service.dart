// lib/draft_state/draft_state_service.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_state_model.dart';

class DraftStateService {
  final _c = Supabase.instance.client;

  Stream<DraftState> stream(String leagueId) {
    final ctrl = StreamController<DraftState>.broadcast();

    // cold-start query (row might already exist)
    _c
        .from('league_draft_state')
        .select()
        .eq('league_id', leagueId)
        .maybeSingle()
        .then((row) {
      if (row != null) ctrl.add(DraftState.fromJson(row));
    });

    // realtime subscription
    final channel = _c
        .channel('public:league_draft_state')          // channel name
        .onPostgresChanges(
          event: PostgresChangeEvent.all,              // INSERT + UPDATE
          schema: 'public',
          table: 'league_draft_state',
          filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: 'league_id', value: leagueId),
          callback: (payload) {
            debugPrint('RT ► ${payload.eventType}'
                ' pick# ${payload.newRecord?['current_pick_number']}');
            ctrl.add(DraftState.fromJson(payload.newRecord));
          },
        )
        .subscribe();

    ctrl.onCancel = () => _c.removeChannel(channel);
    return ctrl.stream;
  }
}
