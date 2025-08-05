// lib/screens/draft_lobby.dart
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/draft_pick/draft_pick_provider.dart';
import 'package:sixers/backend/draft_settings/draft_settings_provider.dart';
import 'package:sixers/backend/draft_state/draft_state_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/players/player_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../backend/leagues/league_model.dart';

class DraftLobby extends ConsumerStatefulWidget {
  final League league;
  const DraftLobby({required this.league, super.key});

  @override
  ConsumerState<DraftLobby> createState() => _DraftLobbyState();
}

class _DraftLobbyState extends ConsumerState<DraftLobby> {
  Timer? _ticker;
  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final league = widget.league;
    final uid = Supabase.instance.client.auth.currentUser!.id;

    /* ─── Providers ─────────────────────────────────────────── */
    final leaguesA = ref.watch(leaguesProvider); // NEW
    final stateA = ref.watch(draftStateStreamProvider(league.id));
    final picksA = ref.watch(draftPicksStreamProvider(league.id));
    final settingsA = ref.watch(draftSettingsProvider(league.id));
    final teamsA = ref.watch(fantasyTeamsProvider);
    final playersA = ref.watch(allPlayersProvider(league.tournamentId));

    /* ─── Loading ───────────────────────────────────────────── */
    if ([leaguesA, settingsA, teamsA, playersA].any((a) => a.isLoading)) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    /* ─── Error (static providers first) ────────────────────── */
    for (final a in [leaguesA, settingsA, teamsA, playersA]) {
      if (a.hasError) return _err(a.error);
    }

    /* ─── Get fresh League each build ───────────────────────── */
    final leagues = leaguesA.requireValue;
    final freshLeague = leagues.firstWhere(
      (l) => l.id == league.id,
      orElse: () => league,
    );

    /* dynamic wait: if draft has started, also wait on streams */
    final bool waitState =
        freshLeague.status == LeagueStatus.draft_in_progress &&
        stateA.isLoading;
    final bool waitPicks =
        freshLeague.status == LeagueStatus.draft_in_progress &&
        picksA.isLoading;

    if (waitState || waitPicks) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    /* Err on dynamic streams */
    if (stateA.hasError) return _err(stateA.error);
    if (picksA.hasError) return _err(picksA.error);

    /* ─── Draft pending screen ─────────────────────────────── */
    if (freshLeague.status == LeagueStatus.draft_pending) {
      return Scaffold(
        appBar: AppBar(title: Text('Draft • ${freshLeague.name}')),
        body: Center(
          child: freshLeague.creatorId == uid
              ? ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(leagueActionsProvider.notifier)
                        .startDraft(freshLeague.id);
                  },
                  child: const Text('Start Draft'),
                )
              : const Text('Waiting for commissioner to start the draft…'),
        ),
      );
    }

    /* ─── Draft in progress ─────────────────────────────────── */
    final state = stateA.requireValue;
    final picks = picksA.requireValue;
    final teams = teamsA.requireValue;
    final players = playersA.requireValue;

    _ticker ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );

    final secsLeft = state.pickDeadline
        .difference(DateTime.now())
        .inSeconds
        .clamp(0, 9999);

    final myTeam = teams.firstWhereOrNull(
      (t) => t.leagueId == league.id && t.userId == uid,
    );
    final currentTeamOwnerUid = teams
        .firstWhereOrNull((t) => t.id == state.currentTeamId)
        ?.userId;
    final myTurn = currentTeamOwnerUid == uid;

    final availablePlayers = players
        .where((pl) => picks.every((p) => p.playerId != pl.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Draft • ${league.name}')),
      body: Column(
        children: [
          _header(state, secsLeft),
          const Divider(height: 0),
          Expanded(
            child: ListView(
              children: [
                ...picks.map(
                  (p) => ListTile(
                    leading: Text('#${p.pickNumber}'),
                    title: Text('Player ${p.playerId}'),
                    subtitle: Text('Team ${p.teamId}'),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Available Players',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ...availablePlayers.map(
                  (pl) => ListTile(
                    title: Text(pl.name),
                    trailing: myTurn
                        ? IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => _pickPlayer(pl.id, myTeam?.id),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* ─── Helpers ─────────────────────────────────────────────── */

  Widget _header(state, int secs) => Container(
    width: double.infinity,
    color: Colors.black12,
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Round ${state.roundNumber} • Pick #${state.pickNumber}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'On the clock: ${state.currentTeamId}',
          style: const TextStyle(fontSize: 14),
        ),
        Text('Time left: $secs s', style: const TextStyle(fontSize: 14)),
      ],
    ),
  );

  Future<void> _pickPlayer(String playerId, String? myTeamId) async {
    final uid = Supabase.instance.client.auth.currentUser!.id;

    if (myTeamId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Team not found')));
      return;
    }

    try {
      await ref
          .read(draftPickActionsProvider.notifier)
          .makePick(
            leagueId: widget.league.id,
            teamId: myTeamId,
            playerId: playerId,
          );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Pick failed: $e')));
    }
  }

  Scaffold _err(Object? e) => Scaffold(body: Center(child: Text('Error: $e')));
}
