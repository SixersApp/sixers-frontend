import 'package:flutter/material.dart';
import 'package:sixers/widgets/draft_widgets/draft_tab_board_widgets/pick_cell.dart';
import 'package:sixers/widgets/draft_widgets/draft_tab_board_widgets/team_header.dart';

class BoardGrid extends StatelessWidget {
  const BoardGrid({
    super.key,
    required this.teams,
    required this.picks,
    required this.playersById,
    required this.teamCount,
    required this.rounds,
  });

  final List<dynamic> teams; // FantasyTeam
  final List<dynamic> picks; // DraftPick
  final Map<String, dynamic> playersById; // id -> Player
  final int teamCount;
  final int rounds;

  // Square sizes
  static const double _tileSize = 132;
  static const double _gap = 12;

  int _roundOf(dynamic p) => (((p.pickNumber as int) - 1) ~/ teamCount) + 1;
  int _pickInRoundOf(dynamic p) => (((p.pickNumber as int) - 1) % teamCount) + 1;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    // teamId -> { round -> pick }
    final byTeamRound = <String, Map<int, dynamic>>{};
    for (final p in picks) {
      final r = _roundOf(p);
      final teamId = p.teamId as String;
      byTeamRound.putIfAbsent(teamId, () => {});
      byTeamRound[teamId]![r] = p;
    }

    // Header row (square headers, gap only BETWEEN items)
    Widget buildHeader() => Row(
          children: [
            for (var i = 0; i < teams.length; i++) ...[
              TeamHeader(
                size: _tileSize,
                name: ((teams[i] as dynamic).teamName ?? 'Team') as String,
                scheme: scheme,
              ),
              if (i != teams.length - 1) const SizedBox(width: _gap),
            ],
          ],
        );

    // Body columns (square cells, gap only BETWEEN items)
    Widget buildBody() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < teams.length; i++) ...[
              Builder(
                builder: (context) {
                  final team = teams[i] as dynamic;
                  final String teamId = team.id as String;

                  return SizedBox(
                    width: _tileSize,
                    child: Column(
                      children: [
                        for (int r = 1; r <= rounds; r++) ...[
                          Builder(
                            builder: (context) {
                              final pick = byTeamRound[teamId]?[r];

                              // ⬇️ If no pick in the *current* round, render a blank square.
                              if (pick == null && r == rounds) {
                                return const SizedBox.square(
                                  dimension: _tileSize,
                                );
                              }

                              // Otherwise render the normal cell (older rounds will be filled)
                              final label = pick == null
                                  ? '$r.' // defensive; usually shouldn't happen for older rounds
                                  : '$r.${_pickInRoundOf(pick)}';
                              final player = pick == null
                                  ? null
                                  : playersById[pick.playerId as String];

                              return PickCell(
                                size: _tileSize,
                                scheme: scheme,
                                label: label,
                                player: player,
                                pick: pick,
                              );
                            },
                          ),
                          if (r != rounds) const SizedBox(height: _gap),
                        ],
                      ],
                    ),
                  );
                },
              ),
              if (i != teams.length - 1) const SizedBox(width: _gap),
            ],
          ],
        );

    // 2D scroll (horizontal + vertical) — NO internal padding anywhere
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(),
                  const SizedBox(height: _gap),
                  buildBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
