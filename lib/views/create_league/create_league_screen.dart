import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_provider.dart';
import 'package:sixers/backend/tournament/tournament_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/create_league_widgets/header.dart';
import 'package:sixers/views/components/create_league_widgets/scoring_section.dart';
import 'package:sixers/views/components/draft_tabs/pre_draft_board.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/utils/logger.dart';

class CreateLeagueScreen extends ConsumerStatefulWidget {
  const CreateLeagueScreen({super.key});

  @override
  ConsumerState<CreateLeagueScreen> createState() => _CreateLeagueScreenState();
}

class _CreateLeagueScreenState extends ConsumerState<CreateLeagueScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  String? _tournamentId;
  bool _showScoring = false;
  List<ScoringRule> _rules = [];
  final uid = Supabase.instance.client.auth.currentUser?.id;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<List<ScoringRule>>>(scoringRulesProvider(), (prev, next) {
      next.whenData((rs) {
        if (mounted && _rules.isEmpty && rs.isNotEmpty) {
          setState(() => _rules = rs);
        }
      });
    });

    final tournamentsAv = ref.watch(tournamentsProvider);
    final defaultsAv = ref.watch(scoringRulesProvider());
    final leaguesA = ref.read(leaguesProvider.notifier);
    logDebug('rules: $_rules');

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CreateLeagueHeader()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // League name
                    const SizedBox(height: 8),
                    Text('League Name', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nameCtrl,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Awesome People League',
                        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.black500),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                      ),
                    ),

                    // Tournament dropdown
                    const SizedBox(height: 13),
                    Text('Tournament', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 6),
                    tournamentsAv.when(
                      error: (e, _) => Text('Failed to load tournaments: $e'),
                      data: (items) => DropdownButtonFormField<String>(
                        value: _tournamentId,
                        isExpanded: true,
                        items: items
                            .map((t) => DropdownMenuItem<String>(value: t.id, child: Text('${t.name} (S${t.season})')))
                            .toList(),
                        onChanged: (v) => setState(() => _tournamentId = v),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                        ),
                      ),
                      loading: () {
                        logDebug('loading');
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),

                    // Scoring section
                    const SizedBox(height: 27),
                    Text('Scoring', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 13),
                    if (!_showScoring)
                      SizedBox(
                        height: 52,
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: defaultsAv.isLoading ? null : () => setState(() => _showScoring = true),
                          icon: const Icon(Icons.tune, color: AppColors.black800, size: 20),
                          label: Text(
                            'Customize Scoring',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(AppColors.black300),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                      )
                    else ...[
                      const SizedBox(height: 8),
                      ScoringSection(
                        rules: _rules,
                        onChanged: (next) {
                          final key = next.key();
                          final idx = _rules.indexWhere((r) => r.key() == key);
                          if (idx == -1) return;
                          setState(() => _rules[idx] = next);
                        },
                      ),
                    ],

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Submit
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.black800),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            ),
            onPressed: (_nameCtrl.text.trim().isEmpty || _tournamentId == null)
                ? null
                : () async {
                    final league = League(
                      id: '-1',
                      name: _nameCtrl.text,
                      tournamentId: _tournamentId!,
                      creatorId: uid!,
                      status: LeagueStatus.draft_pending,
                      maxTeams: 10,
                      joinCode: '000000',
                    );
                    final res = await leaguesA.createLeagueWithRules(league, _rules);
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PreDraftLobby(leagueId: res!)));
                  },
            child: Text('Create', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.black100)),
          ),
        ),
      ),
    );
  }
}
