import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/utils/logger.dart';

import 'active_match_model.dart';
import 'active_match_service.dart';
import 'appsync_events_service.dart';
import 'match_event_model.dart';

part 'live_match_provider.g.dart';

@Riverpod(keepAlive: true)
class LiveMatches extends _$LiveMatches {
  final ActiveMatchService _service = ActiveMatchService();
  AppSyncEventsService? _eventsService;
  StreamSubscription? _eventSub;
  bool _mounted = true;

  @override
  Future<Map<String, ActiveMatch>> build() async {
    _mounted = true;
    ref.onDispose(() {
      _mounted = false;
      _eventSub?.cancel();
      _eventsService?.dispose();
      _eventsService = null;
    });

    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return {};

    // Fetch initial state
    late final List<ActiveMatch> matches;
    try {
      matches = await _service.fetchActiveMatches();
      // logInfo('LiveMatches: fetched ${matches.length} active matches');
    } catch (e, st) {
      logError('LiveMatches: GET /matches/active failed: $e', st);
      rethrow;
    }

    final matchMap = <String, ActiveMatch>{};
    for (final m in matches) {
      matchMap[m.id] = m;
    }

    // Extract unique tournament IDs and set up subscriptions
    final tournamentIds = matchMap.values
        .map((m) => m.tournamentId)
        .toSet();

    // Also include tournament IDs from active leagues
    final leagues = ref.read(leaguesProvider).value ?? [];
    for (final league in leagues) {
      if (league.status == LeagueStatus.active) {
        tournamentIds.add(league.tournamentId);
      }
    }

    _setupSubscriptions(auth.idToken, tournamentIds);

    return matchMap;
  }

  // ---------------------------------------------------------------------------
  // Subscription setup
  // ---------------------------------------------------------------------------

  void _setupSubscriptions(String idToken, Set<String> tournamentIds) {
    _eventSub?.cancel();
    _eventsService?.dispose();

    _eventsService = AppSyncEventsService();

    // Listen for events
    _eventSub = _eventsService!.events.listen(_onEvent);

    // Connect, then subscribe to each tournament channel
    _eventsService!.connect(idToken).then((_) {
      for (final tid in tournamentIds) {
        _eventsService!.subscribe('/default/tournaments/$tid');
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Event handling
  // ---------------------------------------------------------------------------

  void _onEvent(Map<String, dynamic> rawEvent) {
    if (!_mounted) return;
    // logInfo('LiveMatches: raw WebSocket event: $rawEvent');

    try {
      final event = MatchEvent.fromJson(rawEvent);
      _applyEvent(event, rawEvent);
    } catch (e, st) {
      logError('LiveMatches: failed to parse event: $e', st);
    }
  }

  void _applyEvent(MatchEvent event, Map<String, dynamic> rawEvent) {
    final currentMap = state.value;
    if (currentMap == null) return;

    final matchId = event.matchId;
    final match = currentMap[matchId];

    // Unknown match — trigger resync
    if (match == null && event.type != 'MATCH_STARTED' && event.type != 'MATCH_ENDED') {
      logWarning(
          'LiveMatches: event for unknown match $matchId, triggering resync');
      resync();
      return;
    }

    final isUndo =
        event.type == 'UNDO_BALL_EVENT' || event.type == 'UNDO_POSITION_SWAP';
    final storedEventNum = match?.eventNum ?? 0;

    // Sequence check
    if (!isUndo) {
      if (event.eventNum <= storedEventNum) {
        // Duplicate or stale — ignore
        return;
      }
      if (event.eventNum > storedEventNum + 1 &&
          event.type != 'MATCH_STARTED') {
        // Gap detected — resync
        logWarning(
            'LiveMatches: sequence gap (stored=$storedEventNum, received=${event.eventNum}), resyncing');
        resync();
        return;
      }
    } else {
      // Undo: apply if eventNum < storedEventNum (rolling back)
      if (event.eventNum >= storedEventNum) {
        return; // Not a valid undo
      }
    }

    final updatedMap = Map<String, ActiveMatch>.from(currentMap);

    switch (event.type) {
      case 'MATCH_STARTED':
        if (event.data != null) {
          final newMatch =
              ActiveMatch.fromJson(event.data!.cast<String, dynamic>());
          updatedMap[newMatch.id] = newMatch.copyWith(eventNum: 1);
        }

      case 'BALL_EVENT' || 'UNDO_BALL_EVENT':
        if (match == null) return;
        updatedMap[matchId] = _applyDeltas(match, event, rawEvent);

      case 'POSITION_SWAP' || 'UNDO_POSITION_SWAP':
        if (match == null) return;
        updatedMap[matchId] = match.copyWith(eventNum: event.eventNum);

      case 'MATCH_ENDED':
        if (match != null) {
          updatedMap[matchId] = match.copyWith(
            status: 'FINISHED',
            eventNum: event.eventNum,
          );
        }

      default:
        logWarning('LiveMatches: unknown event type: ${event.type}');
    }

    state = AsyncData(updatedMap);
  }

  ActiveMatch _applyDeltas(ActiveMatch match, MatchEvent event, Map<String, dynamic> rawEvent) {
    // Apply matchInfoDeltas
    var updated = match;
    if (event.matchInfoDeltas != null) {
      for (final entry in event.matchInfoDeltas!.entries) {
        updated = _applyMatchInfoDelta(updated, entry.key, entry.value);
      }
    }

    // Apply performanceDeltas
    if (event.performanceDeltas != null) {
      // Build a set of player IDs where not_out was explicitly present in the raw JSON
      final rawDeltas = (rawEvent['performanceDeltas'] as List?) ?? [];
      final playersWithNotOut = <String>{};
      for (final rd in rawDeltas) {
        if (rd is Map && rd.containsKey('not_out')) {
          playersWithNotOut.add(rd['player_id'] as String);
        }
      }

      final perfs = List<PlayerPerformance>.from(updated.playerPerformances);
      for (final pd in event.performanceDeltas!) {
        final idx = perfs.indexWhere((p) => p.playerId == pd.playerId);
        if (idx != -1) {
          var perf = perfs[idx];
          for (final change in pd.changes.entries) {
            perf = _applyPerfDelta(perf, change.key, change.value);
          }
          if (playersWithNotOut.contains(pd.playerId)) {
            perf = perf.copyWith(notOut: pd.notOut);
          }
          perfs[idx] = perf;
        }
      }
      updated = updated.copyWith(playerPerformances: perfs);
    }

    return updated.copyWith(eventNum: event.eventNum);
  }

  ActiveMatch _applyMatchInfoDelta(
      ActiveMatch match, String key, dynamic value) {
    switch (key) {
      case 'status':
        return match.copyWith(status: value as String);
      case 'result':
        return match.copyWith(result: value as String);
      case 'home_team_score':
        return match.copyWith(
            homeTeamScore: (match.homeTeamScore ?? 0) + (value as int));
      case 'away_team_score':
        return match.copyWith(
            awayTeamScore: (match.awayTeamScore ?? 0) + (value as int));
      case 'home_team_wickets':
        return match.copyWith(
            homeTeamWickets: (match.homeTeamWickets ?? 0) + (value as int));
      case 'away_team_wickets':
        return match.copyWith(
            awayTeamWickets: (match.awayTeamWickets ?? 0) + (value as int));
      case 'home_team_balls':
        return match.copyWith(
            homeTeamBalls: (match.homeTeamBalls ?? 0) + (value as int));
      case 'away_team_balls':
        return match.copyWith(
            awayTeamBalls: (match.awayTeamBalls ?? 0) + (value as int));
      case 'dls':
        return match.copyWith(dls: (match.dls ?? 0) + (value as int));
      default:
        logWarning('LiveMatches: unknown matchInfo key: $key');
        return match;
    }
  }

  PlayerPerformance _applyPerfDelta(
      PlayerPerformance perf, String stat, int delta) {
    switch (stat) {
      case 'runs_scored':
        return perf.copyWith(runsScored: (perf.runsScored ?? 0) + delta);
      case 'balls_faced':
        return perf.copyWith(ballsFaced: (perf.ballsFaced ?? 0) + delta);
      case 'fours':
        return perf.copyWith(fours: (perf.fours ?? 0) + delta);
      case 'sixes':
        return perf.copyWith(sixes: (perf.sixes ?? 0) + delta);
      case 'balls_bowled':
        return perf.copyWith(ballsBowled: (perf.ballsBowled ?? 0) + delta);
      case 'runs_conceded':
        return perf.copyWith(runsConceded: (perf.runsConceded ?? 0) + delta);
      case 'wickets_taken':
        return perf.copyWith(wicketsTaken: (perf.wicketsTaken ?? 0) + delta);
      case 'catches':
        return perf.copyWith(catches: (perf.catches ?? 0) + delta);
      case 'run_outs':
        return perf.copyWith(runOuts: (perf.runOuts ?? 0) + delta);
      case 'catches_dropped':
        return perf.copyWith(
            catchesDropped: (perf.catchesDropped ?? 0) + delta);
      default:
        logWarning('LiveMatches: unknown perf stat: $stat');
        return perf;
    }
  }

  // ---------------------------------------------------------------------------
  // Resync
  // ---------------------------------------------------------------------------

  Future<void> resync() async {
    if (!_mounted) return;
    // logInfo('LiveMatches: resyncing from GET /matches/active');

    try {
      final matches = await _service.fetchActiveMatches();
      if (!_mounted) return;

      final matchMap = <String, ActiveMatch>{};
      for (final m in matches) {
        matchMap[m.id] = m;
      }
      state = AsyncData(matchMap);
    } catch (e, st) {
      logError('LiveMatches: resync failed: $e', st);
    }
  }

  /// Call when the app returns to the foreground.
  Future<void> onAppResumed() async {
    await resync();
  }
}
