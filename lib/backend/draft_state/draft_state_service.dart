import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'draft_state_model.dart';

class DraftStateService {
  final _c = Supabase.instance.client;

  Stream<DraftState> stream(String leagueId) {
    final ctrl = StreamController<DraftState>.broadcast();

    _c
        .from('league_draft_state')
        .select()
        .eq('league_id', leagueId)
        .maybeSingle()
        .then((row) {
          if (row != null) ctrl.add(DraftState.fromJson(row));
        });

    final channelName = 'draft_state_$leagueId';

    final channel = _c.channel(channelName);

    
    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'league_draft_state',
      callback: (payload) {
        
        if (payload.newRecord != null &&
            payload.newRecord['league_id'] == leagueId) {
          debugPrint(
            'RT ► ${payload.eventType}'
            ' pick# ${payload.newRecord['current_pick_number']}',
          );
          ctrl.add(DraftState.fromJson(payload.newRecord));
        }
      },
    );

    channel.subscribe();

    ctrl.onCancel = () => _c.removeChannel(channel);
    return ctrl.stream;
  }

  Future<DraftState?> fetch(String leagueId) async {
    try {
      final res = await _c
          .from('league_draft_state')
          .select('*')
          .eq('league_id', leagueId)
          .maybeSingle();

      if (res == null) return null;
      return DraftState.fromJson(res);
    } on PostgrestException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('Failed to fetch draft state: $e');
    }
  }
}
