// lib/widgets/board/board_grid.dart
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
    this.bleedRightOverride, // set if parent padding isn't symmetric
  });

  final List<dynamic> teams; // FantasyTeam
  final List<dynamic> picks; // DraftPick
  final Map<String, dynamic> playersById; // id -> Player
  final int teamCount;
  final int rounds;

  /// If your parent padding isn't symmetric, pass the exact pixels to bleed.
  final double? bleedRightOverride;

  // Square sizes
  static const double _tileSize = 132;
  static const double _gap = 12;

  int _roundOf(dynamic p) => (((p.pickNumber as int) - 1) ~/ teamCount) + 1;
  int _pickInRoundOf(dynamic p) =>
      (((p.pickNumber as int) - 1) % teamCount) + 1;

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

    // Header row (square headers)
    Widget buildHeader() => Row(
      children: [
        for (var i = 0; i < teams.length; i++) ...[
          TeamHeader(
            size: _tileSize,
            name: ((teams[i] as dynamic).teamName ?? 'Team') as String,
            scheme: scheme,
          ),
          if (i != teams.length - 1)
            const SizedBox(width: _gap), // no trailing gap
        ],
      ],
    );

    // Body columns (square cells)
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
                          final label = pick == null
                              ? '$r.'
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
                      if (r != rounds)
                        const SizedBox(height: _gap), // only between rows
                    ],
                  ],
                ),
              );
            },
          ),
          if (i != teams.length - 1)
            const SizedBox(width: _gap), // no trailing gap
        ],
      ],
    );

    // lib/widgets/board/board_grid.dart  (inside build -> LayoutBuilder)

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenW = MediaQuery.of(context).size.width;

        // How much the parent narrowed us (usually its left+right padding)
        final totalPadding = (screenW - constraints.maxWidth).clamp(
          0.0,
          double.infinity,
        );

        // ---- choose your inner padding (we keep only left) ----
        const double contentLeftPad = 16.0;
        const double contentRightPad =
            0.0; // <-- make right = 0 so it can flush

        // Bleed to the right by the parent's right padding,
        // plus any inner right padding (which is 0 here).
        final bleedRight =
            (bleedRightOverride ??
                (totalPadding > 0 ? totalPadding / 2 : 0.0)) +
            contentRightPad;

        final targetMinWidth = constraints.maxWidth + bleedRight;

        final content = Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: targetMinWidth),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Padding(
                    // ⬇⬇ keep only LEFT padding inside the grid
                    padding: const EdgeInsets.only(
                      left: contentLeftPad,
                      right: contentRightPad, // 0
                      top: 8,
                      bottom: 8,
                    ),
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
          ),
        );

        // Grow width to the right without shifting left.
        if (bleedRight > 0) {
          return OverflowBox(
            alignment: Alignment.topLeft, // keep left edge fixed
            minWidth: targetMinWidth,
            maxWidth: targetMinWidth,
            child: SizedBox(width: targetMinWidth, child: content),
          );
        }
        return content;
      },
    );
  }
}
