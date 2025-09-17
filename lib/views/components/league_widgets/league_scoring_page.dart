// lib/ui/scoring/league_scoring_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/create_league_widgets/scoring_section.dart';

class LeagueScoringPage extends ConsumerStatefulWidget {
  const LeagueScoringPage({super.key, required this.leagueId});
  final String leagueId;

  @override
  ConsumerState<LeagueScoringPage> createState() => _LeagueScoringPageState();
}

class _LeagueScoringPageState extends ConsumerState<LeagueScoringPage> {
  List<ScoringRule> _rules = [];
  bool _hydrated = false;
  bool _saving = false;

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await ref.read(scoringRulesProvider(leagueId: widget.leagueId).notifier).replaceAllForLeague(widget.leagueId, _rules);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Scoring rules saved')));
      Navigator.of(context).maybePop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // hydrate local editable copy once when provider yields data
    ref.listen<AsyncValue<List<ScoringRule>>>(scoringRulesProvider(leagueId: widget.leagueId), (prev, next) {
      next.whenData((rules) {
        if (!_hydrated) {
          setState(() {
            _rules = List<ScoringRule>.of(rules);
            _hydrated = true;
          });
        }
      });
    });

    final rulesAv = ref.watch(scoringRulesProvider(leagueId: widget.leagueId));
    final extraBottomPad = 120.0; // keep last item clear of the bottom bar

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        title: Text('Scoring', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: rulesAv.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(16, 8, 16, extraBottomPad + MediaQuery.of(context).padding.bottom),
          child: ScoringSection(
            rules: _rules,
            onChanged: (next) {
              final key = next.key();
              final idx = _rules.indexWhere((r) => r.key() == key);
              if (idx == -1) return;
              setState(() => _rules[idx] = next);
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          height: 48,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.black800,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: rulesAv.isLoading || !_hydrated || _saving ? null : _save,
            child: Text(
              _saving ? 'Saving…' : 'Save',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black100, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
