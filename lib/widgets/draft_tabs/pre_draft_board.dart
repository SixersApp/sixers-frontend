// lib/ui/draft/lobby/pre_draft_board.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/widgets/draft_widgets/pre_draft_info_tile.dart';
import 'package:sixers/widgets/draft_widgets/pre_draft_team_tile.dart';

class PreDraftLobby extends ConsumerWidget {
  final League league;
  final List<FantasyTeam> teams;
  final int secondsPerPick;
  final bool canStart;
  final VoidCallback onStartDraft;
  final VoidCallback? onEditTimer;

  const PreDraftLobby({
    super.key,
    required this.league,
    required this.teams,
    required this.secondsPerPick,
    required this.canStart,
    required this.onStartDraft,
    this.onEditTimer,
  });

  String _mmss(int seconds) {
    final m = (seconds ~/ 60).toString();
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Color _colorForIndex(int i) {
    const palette = [
      Color(0xFFFFD166),
      Color(0xFF66A3FF),
      Color(0xFFFF8B66),
      Color(0xFFFF66D4),
      Color(0xFF66D18F),
    ];
    return palette[i % palette.length];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        title: Text(
          league.name.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),

      // Column layout so list scrolls and bottom panel respects SafeArea
      body: Column(
        children: [
          // Teams
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: teams.length,
              itemBuilder: (_, i) => TeamTile(team: teams[i], index: i),
            ),
          ),

          // Bottom controls
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(20, 8, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DraftInfoCard(
                        title: 'Draft Timer',
                        value: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _mmss(secondsPerPick),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTapValue: canStart ? onEditTimer : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DraftInfoCard(
                        title: 'Invite Code',
                        value: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  league.joinCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.copy,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        //onTapValue: , add copy to clipboard
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // White container + purple-outline Begin Draft
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      elevation: 0, // stays flat
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.black800,
                    ),
                    onPressed: canStart ? onStartDraft : null,
                    child: Text(
                      canStart ? 'Begin Draft' : 'Waiting for commissioner…',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.black100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
