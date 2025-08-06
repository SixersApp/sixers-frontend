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
    final uid = Supabase.instance.client.auth.currentUser!.id;

    final settingsA = ref.watch(draftSettingsProvider(widget.league.id));
    final teamsA = ref.watch(fantasyTeamsProvider);
    final playersA = ref.watch(allPlayersProvider(widget.league.tournamentId));

    if ([settingsA, teamsA, playersA].any((a) => a.isLoading)) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    for (final a in [settingsA, teamsA, playersA]) {
      if (a.hasError) return _err(a.error);
    }

    final stateA = ref.watch(draftStateStreamProvider(widget.league.id));
    final picksA = ref.watch(draftPicksProvider(widget.league.id));

    if (stateA.hasError) return _err(stateA.error);
    if (picksA.hasError) return _err(picksA.error);

    final state = stateA.valueOrNull;

    if (state == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Draft • ${widget.league.name}')),
        body: Center(
          child: widget.league.creatorId == uid
              ? ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(leagueActionsProvider.notifier)
                        .startDraft(widget.league.id);
                  },
                  child: const Text('Start Draft'),
                )
              : const Text('Waiting for commissioner to start the draft…'),
        ),
      );
    }

    final picks = picksA.valueOrNull;
    if (picks == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Draft • ${widget.league.name}')),
        body: const Center(child: Text('Preparing draft room…')),
      );
    }

    final teams = teamsA.requireValue;
    final players = playersA.requireValue;

    _ticker ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );

    final now = DateTime.now();
    final secsLeft = state.pickDeadline
        .difference(now)
        .inSeconds
        .clamp(0, 9999);

    final myTeam = teams.firstWhereOrNull(
      (t) => t.leagueId == widget.league.id && t.userId == uid,
    );
    final currentOwnerUid = teams
        .firstWhereOrNull((t) => t.id == state.currentTeamId)
        ?.userId;
    final myTurn = currentOwnerUid == uid;

    final availablePlayers = players
        .where((pl) => picks.every((p) => p.playerId != pl.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Draft • ${widget.league.name}')),
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
    if (myTeamId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your team not found for this league')),
      );
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
