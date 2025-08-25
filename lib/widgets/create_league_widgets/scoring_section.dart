import 'package:flutter/material.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';
import 'rule_row.dart';

class ScoringSection extends StatelessWidget {
  final List<ScoringRule> rules;
  final ValueChanged<ScoringRule> onChanged;
  const ScoringSection({super.key, required this.rules, required this.onChanged});

  

  @override
  Widget build(BuildContext context) {
    // group by category
    final byCat = <String, List<ScoringRule>>{};
    for (final r in rules) {
      (byCat[r.category] ??= []).add(r);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in byCat.entries) ...[
          const SizedBox(height: 12),
          Text(
            entry.key.isEmpty ? '' : '${entry.key[0].toUpperCase()}${entry.key.substring(1)}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...entry.value.map((r) => RuleRow(rule: r, onChanged: onChanged)),
        ],
      ],
    );
  }
}
