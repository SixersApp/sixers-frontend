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

  Widget _teamTile(BuildContext context, FantasyTeam t, int i) {
    final color = _colorForIndex(i);
    final aka = t.akaName ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.25), Colors.transparent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.black800,
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
                            color: AppColors.black300,
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
    required String value,
    Widget? trailing,
  }) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: AppColors.black800,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.black300,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        title: Text(
          league.name.toUpperCase(),
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
      body: Stack(
        children: [
          // Team list
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 220),
            itemCount: teams.length,
            itemBuilder: (_, i) => _teamTile(context, teams[i], i),
          ),

          // Bottom controls
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          context: context,
                          title: 'Draft Timer',
                          value: _mmss(secondsPerPick),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit,
                                size: 18, color: Colors.white),
                            onPressed: canStart ? onEditTimer : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _infoCard(
                          context: context,
                          title: 'Invite Code',
                          value: league.joinCode,
                          trailing: IconButton(
                            icon: const Icon(Icons.copy,
                                size: 18, color: Colors.white),
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: league.joinCode));
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Invite code copied')),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 3, color: Colors.purple),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: canStart ? onStartDraft : null,
                        child: Text(
                          canStart
                              ? 'Begin Draft'
                              : 'Waiting for commissioner…',
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
          ),
        ],
      ),
    );
  }
}
