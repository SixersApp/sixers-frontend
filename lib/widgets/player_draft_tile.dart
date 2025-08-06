import 'package:flutter/material.dart';

class PlayerDraftTile extends StatelessWidget {
  const PlayerDraftTile({
    super.key,
    required this.rank,
    required this.playerName,
    required this.realTeam,
    required this.statLeftLabel,
    required this.statLeftValue,
    required this.statRightLabel,
    required this.statRightValue,
    required this.onTap,
  });

  final int rank; // 12
  final String playerName; // “Shubman Gill”
  final String realTeam; // “Gujarat Titans”
  final String statLeftLabel; // “Avg:”
  final String statLeftValue; // “36.8”
  final String statRightLabel; // “SR:”
  final String statRightValue; // “138.9”
  final VoidCallback onTap; // add-button handler

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: theme.colorScheme.surfaceVariant,
      leading: CircleAvatar(
        // placeholder for player image
        backgroundColor: theme.colorScheme.primaryContainer,
        radius: 20,
        child: Text(
          rank.toString(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      title: Text(
        playerName,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(realTeam, style: theme.textTheme.bodySmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$statLeftLabel $statLeftValue',
                style: theme.textTheme.bodySmall,
              ),
              Text(
                '$statRightLabel $statRightValue',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
