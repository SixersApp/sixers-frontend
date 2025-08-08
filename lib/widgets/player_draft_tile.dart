import 'package:flutter/material.dart';
import 'package:sixers/theme/brand_tokens.dart';

class PlayerDraftTile extends StatelessWidget {
  const PlayerDraftTile({
    required this.rank,
    required this.playerName,
    required this.realTeamName,
    required this.stat1Label,
    required this.stat1Value,
    required this.stat2Label,
    required this.stat2Value,
    required this.enabled,
    required this.onAdd,
  });

  final int rank;
  final String playerName;
  final String realTeamName;
  final String stat1Label;
  final String stat1Value;
  final String stat2Label;
  final String stat2Value;
  final bool enabled;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text   = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Rank bubble
          SizedBox(
            width: 34,
            child: Center(
              child: Text('$rank',
                  style: text.labelLarge?.copyWith(color: scheme.onSurfaceVariant)),
            ),
          ),
          const SizedBox(width: 8),

          // Name + team
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(playerName,
                    style: text.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(realTeamName,
                    style: text.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
              ],
            ),
          ),

          // Stats column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$stat1Label: $stat1Value', style: text.bodySmall),
              Text('$stat2Label: $stat2Value', style: text.bodySmall),
            ],
          ),
          const SizedBox(width: 8),

          // Add button
          InkWell(
            onTap: enabled ? onAdd : null,
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: enabled
                      ? Theme.of(context).extension<NavColors>()?.iconSelected
                          ?? scheme.primary
                      : scheme.onSurfaceVariant,
                  width: 2,
                ),
              ),
              child: Icon(Icons.add,
                  size: 20,
                  color: enabled ? scheme.onSurface : scheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
