// lib/ui/draft/lobby/draft_lobby_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/theme/colors.dart';

// === Replace these with your actual providers/models ===
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';

class DraftLobbyScreen extends ConsumerWidget {
  const DraftLobbyScreen({super.key, required this.leagueId});
  final String leagueId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leagueAv  = ref.watch(leagueByIdProvider(leagueId));
    final teamsAv   = ref.watch(fantasyTeamsProvider(leagueId));
    final settingsAv= ref.watch(draftSettingsProvider(leagueId));

    final bootLoading = leagueAv.isLoading || teamsAv.isLoading || settingsAv.isLoading;
    final bootError   = leagueAv.hasError || teamsAv.hasError || settingsAv.hasError;

    if (bootLoading) {
      return const _LobbyScaffold(
        title: 'Loading…',
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (bootError) {
      return _LobbyScaffold(
        title: 'Draft Lobby',
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            [
              if (leagueAv.hasError) 'League: ${leagueAv.error}',
              if (teamsAv.hasError) 'Teams: ${teamsAv.error}',
              if (settingsAv.hasError) 'Settings: ${settingsAv.error}',
            ].join('\n'),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    final league   = leagueAv.requireValue;
    final teams    = teamsAv.requireValue..sort((a,b) {
      // Sort by draft_order if available, else by name.
      final ao = (a.draftOrder ?? 1<<20);
      final bo = (b.draftOrder ?? 1<<20);
      if (ao != bo) return ao.compareTo(bo);
      return (a.name).compareTo(b.name);
    });
    final settings = settingsAv.requireValue;

    return _LobbyScaffold(
      title: league.name,
      child: _LobbyBody(
        league: league,
        teams: teams,
        settings: settings,
        onBeginDraft: () async {
          // TODO: wire to your RPC/supabase function to start the draft
          await ref.read(leaguesProvider.notifier).startDraft(league.id);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Draft starting…')),
            );
          }
        },
        onEditTimer: () async {
          // TODO: show your duration picker / bottom sheet to update settings
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Timer edit coming soon')),
          );
        },
      ),
    );
  }
}

// ---------- UI pieces ----------

class _LobbyScaffold extends StatelessWidget {
  const _LobbyScaffold({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black900,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back + gear
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // TODO: settings page
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _LobbyBody extends StatelessWidget {
  const _LobbyBody({
    required this.league,
    required this.teams,
    required this.settings,
    required this.onBeginDraft,
    required this.onEditTimer,
  });

  final League league;
  final List<FantasyTeam> teams;
  final DraftSettings settings;
  final VoidCallback onBeginDraft;
  final VoidCallback onEditTimer;

  String _mmss(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(1, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scroll area
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 220),
          itemCount: teams.length,
          itemBuilder: (context, i) {
            final t = teams[i];
            return _TeamTile(
              name: t.teamName,
              aka: t.akaName ,
              // Placeholder crest like draft board: colored square + simple icon
              color: _colorForIndex(i),
            );
          },
        ),

        // Bottom controls
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        title: 'Draft Timer',
                        value: _mmss(settings.secondsPerPick ?? 120),
                        trailing: IconButton(
                          onPressed: onEditTimer,
                          icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _InfoCard(
                        title: 'Invite Code',
                        value: league.joinCode,
                        trailing: IconButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: league.joinCode));
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Invite code copied')),
                              );
                            }
                          },
                          icon: const Icon(Icons.copy, size: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // White rounded container with purple outline button (like mock)
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: onBeginDraft,
                      child: Text(
                        'Begin Draft',
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
    );
  }

  // Simple rotating color palette for placeholder logos
  Color _colorForIndex(int i) {
    const palette = [
      Color(0xFFFFD166), // yellow
      Color(0xFF66A3FF), // blue
      Color(0xFFFF8B66), // orange
      Color(0xFFFF66D4), // pink
      Color(0xFF66D18F), // green
    ];
    return palette[i % palette.length];
  }
}

class _TeamTile extends StatelessWidget {
  const _TeamTile({
    required this.name,
    required this.aka,
    required this.color,
  });

  final String name;
  final String aka;
  final Color color;

  @override
  Widget build(BuildContext context) {
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
            // Placeholder team image
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
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$name  ",
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.value,
    this.trailing,
  });

  final String title;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
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
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.black300, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
