import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/helpers.dart';

/// Visual-only tile for an available player row.
/// If [isRoster] is true, the trailing + button is replaced by [draftNumber].
class PlayerDraftTile extends StatelessWidget {
  const PlayerDraftTile({
    super.key,
    required this.rank,
    required this.playerName,
    required this.realTeamName, 
    this.stat1Label = 'Avg',
    this.stat1Value = '—',
    this.stat2Label = 'SR',
    this.stat2Value = '—',
    required this.enabled,
    required this.onAdd,
    this.role,
    this.isRoster = false,
    this.draftNumber, // e.g., "1.1"
  }) : assert(isRoster == false || draftNumber != null, 'When isRoster is true, draftNumber must be provided');

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

  /// Roster-mode options
  final bool isRoster;
  final String? draftNumber;

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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Rank (left column)
          Text('$rank', style: text.labelLarge?.copyWith(color: scheme.onSurfaceVariant)),

          const SizedBox(width: 10),

          // Avatar placeholder
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scheme.surface, // black200
            ),
          ),
          const SizedBox(width: 10),

          // Name + team
          SizedBox(
            width: 145,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(playerName, maxLines: 1, overflow: TextOverflow.ellipsis, style: text.titleMedium),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      realTeamName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.labelMedium?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 20,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: r.color, borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      child: Icon(r.icon as IconData?, size: 12, color: AppColors.black800),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Stats (right column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$stat1Label: $stat1Value', style: text.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
              Text('$stat2Label: $stat2Value', style: text.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
            ],
          ),
          const SizedBox(width: 10),

          // Trailing control:
          // - Roster mode: show draft number (e.g., "1.1")
          // - Draft list mode: show + button if enabled
          if (isRoster)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  draftNumber!,
                  style: text.labelMedium?.copyWith(fontWeight: FontWeight.w600, color: scheme.onSurfaceVariant),
                ),
              ),
            )
          else if (enabled)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.green300, width: 2),
                    ),
                    child: Icon(Icons.add, size: 20, color: AppColors.green300),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
