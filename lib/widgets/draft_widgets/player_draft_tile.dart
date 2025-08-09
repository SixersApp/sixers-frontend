import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/widgets/helpers.dart';

/// Visual-only tile for an available player row.
/// Real team name + stats are placeholders for now.
class PlayerDraftTile extends StatelessWidget {
  const PlayerDraftTile({
    super.key,
    required this.rank,
    required this.playerName,
    required this.realTeamName, // TODO: wire real team
    this.stat1Label = 'Avg', // TODO: wire stat values
    this.stat1Value = '—',
    this.stat2Label = 'SR',
    this.stat2Value = '—',
    required this.enabled,
    required this.onAdd,
    this.role,
  });

  final int rank;
  final String playerName;
  final String? role;

  // placeholders you’ll plug into later
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
    final text = Theme.of(context).textTheme;
    final r = roleIconAndColor(role!);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Rank
          SizedBox(
            width: 34,
            child: Center(
              child: Text(
                '$rank',
                style: text.labelLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Avatar placeholder
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scheme.surface, // black200
            ),
          ),
          const SizedBox(width: 10),

          // Name + team
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      realTeamName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 20,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: r.color,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        r.icon as IconData?,
                        size: 12,
                        color: AppColors.black800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Stats (right column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
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
                  color: enabled ? AppColors.green300 : scheme.onSurfaceVariant,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.add,
                size: 20,
                color: enabled ? AppColors.green300 : scheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
