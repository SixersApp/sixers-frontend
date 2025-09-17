import 'package:flutter/material.dart';
import 'package:sixers/views/components/helpers.dart';

class PickCell extends StatelessWidget {
  const PickCell({
    super.key,
    required this.size,
    required this.scheme,
    required this.label,
    required this.player,
    required this.shortTeamName,
  });

  final double size; // square tile size
  final ColorScheme scheme;
  final String label; // e.g. "1.1"
  final dynamic player; // Player?
  final String shortTeamName;

  @override
  Widget build(BuildContext context) {
    const double pad = 10;

    final String? role = player?.role as String?;
    final rc = (role == null || role.isEmpty) ? null : roleIconAndColor(role);
    final Color border = rc?.color ?? scheme.outlineVariant;
    final Color fill = rc == null ? scheme.surfaceContainerHighest : border.withOpacity(0.20);

    return SizedBox(
      width: size,
      height: size, // square
      child: Container(
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 2),
        ),
        padding: const EdgeInsets.all(pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pick label (top-left)
            Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
            const SizedBox(height: 5),
            // player name (kept to 2 lines to avoid overflow)
            Text(
              player?.name ?? '—',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            // team short/name
            Text(
              shortTeamName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
