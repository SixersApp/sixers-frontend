import 'package:flutter/material.dart';

class DraftPickCard extends StatelessWidget {
  const DraftPickCard({
    required this.playerName,
    required this.teamName,
    required this.roundPickLabel,
  });

  final String playerName;
  final String teamName;
  final String roundPickLabel;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTextStyle.merge(
        style: t.labelMedium!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(playerName, style: t.labelLarge?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(teamName, style: t.labelMedium),
            const SizedBox(height: 6),
            Text(roundPickLabel,
                style: t.labelSmall?.copyWith(color: scheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
