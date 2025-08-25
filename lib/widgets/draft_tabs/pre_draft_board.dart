// lib/ui/draft/lobby/pre_draft_board.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/theme/colors.dart';

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
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              itemCount: teams.length,
              itemBuilder: (_, i) => _teamTile(context, teams[i], i),
            ),
          ),

          // Bottom controls
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _infoCard(
                        context: context,
                        title: 'Draft Timer',
                        valueWidget: Row(
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
                                      .displaySmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.edit,
                              size: 18,
                              color: canStart ? Colors.white : Colors.white54,
                            ),
                          ],
                        ),
                        onTapTrailing: canStart ? onEditTimer : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _infoCard(
                        context: context,
                        title: 'Invite Code',
                        valueWidget: Row(
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
                                      .displaySmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.copy, size: 18, color: Colors.white),
                          ],
                        ),
                        onTapTrailing: () async {
                          await Clipboard.setData(
                              ClipboardData(text: league.joinCode));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invite code copied')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // White container + purple-outline Begin Draft
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 3, color: Colors.purple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: canStart ? onStartDraft : null,
                      child: Text(
                        canStart ? 'Begin Draft' : 'Waiting for commissioner…',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
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

  // ===== UI helpers =====

  Widget _teamTile(BuildContext context, FantasyTeam t, int i) {
    final color = _colorForIndex(i);
    final aka = t.akaName ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        // keep subtle left glow, but main tile uses black300
        gradient: LinearGradient(
          colors: [color.withOpacity(0.22), Colors.transparent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.black300,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.sports_cricket, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${t.teamName}  ",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    TextSpan(
                      text: "AKA $aka",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required BuildContext context,
    required String title,
    required Widget valueWidget, // value + optional icon inline
    VoidCallback? onTapTrailing,
  }) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: AppColors.black300, // <-- black300 background
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70, // label text
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onTapTrailing,
                behavior: HitTestBehavior.opaque,
                child: valueWidget, // styled with white text where built
              ),
            ),
          ),
        ],
      ),
    );
  }
}
