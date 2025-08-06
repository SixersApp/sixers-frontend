import 'package:flutter/material.dart';

class DraftPickCard extends StatelessWidget {
  const DraftPickCard({
    super.key,
    required this.playerName,
    required this.teamName,
    required this.roundPickLabel,
  });

  final String playerName; // e.g. “Quentin de Kock”
  final String teamName; // e.g. “Kittu’s Kool Kids”
  final String roundPickLabel; // e.g. “Rd. 2 Pick 2”

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 155,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            playerName,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            teamName,
            style: theme.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            roundPickLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
