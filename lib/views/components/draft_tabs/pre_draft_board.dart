import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/draft_settings/draft_settings_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/draft_widgets/edit_pick_timer_sheet.dart';
import 'package:sixers/views/components/draft_widgets/pre_draft_info_tile.dart';
import 'package:sixers/views/components/draft_widgets/pre_draft_team_tile.dart';
import 'package:sixers/views/components/league_widgets/league_scoring_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PreDraftLobby extends ConsumerWidget {
  const PreDraftLobby({super.key, required this.leagueId});
  final String leagueId;

  String _mmss(int seconds) {
    final m = (seconds ~/ 60).toString();
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Color _colorForIndex(int i) {
    const palette = [Color(0xFFFFD166), Color(0xFF66A3FF), Color(0xFFFF8B66), Color(0xFFFF66D4), Color(0xFF66D18F)];
    return palette[i % palette.length];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch everything we need by leagueId
    final leagueAv = ref.watch(leaguesProvider);
    final teamsAv = ref.watch(fantasyTeamsProvider(leagueId: leagueId));
    final settingsAv = ref.watch(draftSettingsProvider(leagueId));

    // Loading
    if (leagueAv.isLoading || teamsAv.isLoading || settingsAv.isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.black100,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Errors
    if (leagueAv.hasError) {
      return _err('League load failed: ${leagueAv.error}');
    }
    if (teamsAv.hasError) {
      return _err('Teams load failed: ${teamsAv.error}');
    }
    if (settingsAv.hasError) {
      return _err('Settings load failed: ${settingsAv.error}');
    }

    // Data
    final leagues = leagueAv.requireValue;
    final league = leagues.firstWhere((t) => t.id == leagueId);

    final List<FantasyTeam> teams = List.of(teamsAv.requireValue)
      ..sort((a, b) {
        final ao = (a.draftOrder ?? 1 << 20);
        final bo = (b.draftOrder ?? 1 << 20);
        if (ao != bo) return ao.compareTo(bo);
        return a.teamName.compareTo(b.teamName);
      });

    final secondsPerPick = settingsAv.requireValue!.timePerPick;
    final uid = Supabase.instance.client.auth.currentUser?.id;
    final isCommissioner = uid != null && league.creatorId == uid;

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        title: Text(
          league.name.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LeagueScoringPage(leagueId: leagueId))),
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
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
              itemBuilder: (_, i) => TeamTile(team: teams[i], index: i, accentColor: _colorForIndex(i)),
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
                    // ── Draft Timer card (edit only for commissioner)
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
                                child: Text(_mmss(secondsPerPick), style: Theme.of(context).textTheme.headlineMedium),
                              ),
                            ),
                            if (isCommissioner) ...[
                              const SizedBox(width: 8),
                              const Icon(Icons.edit, size: 20, color: Colors.white),
                            ],
                          ],
                        ),
                        onTapValue: isCommissioner
                            ? () async {
                                await EditPickTimerSheet.show(context, leagueId: leagueId, initialSeconds: secondsPerPick);
                              }
                            : null,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // ── Invite Code
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
                                child: Text(league.joinCode, style: Theme.of(context).textTheme.headlineMedium),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.copy, size: 20, color: Colors.white),
                          ],
                        ),
                        onTapValue: () async {
                          await Clipboard.setData(ClipboardData(text: league.joinCode));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invite code copied')));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ── Begin Draft / Waiting for commissioner (always white fill + black text)
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                      // force white background for all states (even when disabled)
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (_) => isCommissioner ? AppColors.black800 : AppColors.black300,
                      ),
                      elevation: const WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                    onPressed: isCommissioner
                        ? () async {
                            await ref.read(leagueActionsProvider.notifier).startDraft(leagueId);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Draft starting…')));
                            }
                          }
                        : null,
                    child: Text(
                      isCommissioner ? 'Begin Draft' : 'Waiting for commissioner…',
                      // keep text black regardless of state
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isCommissioner ? AppColors.black100 : AppColors.black800,
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

  Scaffold _err(String msg) => const Scaffold(
    backgroundColor: AppColors.black100,
    body: Center(child: Text('Error loading pre-draft lobby')),
  );
}
