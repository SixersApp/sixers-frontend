import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/helpers.dart';

/// Drafted player card for the horizontal carousel.
/// Pure UI: plug real avatar/badge later via [avatarUrl]/[trailing].
class DraftedPickCard extends StatelessWidget {
  const DraftedPickCard({
    super.key,
    required this.playerName,
    required this.fantasyTeamName,
    required this.roundNumber,
    required this.pickNumber,
    this.role,
    this.avatarUrl, // TODO: headshot later
    this.width = 232,
  });

  final String playerName;
  final String fantasyTeamName;
  final int roundNumber;
  final int pickNumber;
  final String? role;
  final String? avatarUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final r = roleIconAndColor(role!);

    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest, // your tile color (black300)
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: BIG PLAYER NAME + optional trailing badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(playerName.toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis, style: t.labelLarge),
              ),
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
          const SizedBox(height: 8),

          // Avatar + Team name + Rd./Pick
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar (placeholder circle for now)
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: scheme.surface, // slightly darker circle bg (black200)
                ),
                clipBehavior: Clip.antiAlias,
                child: avatarUrl == null
                    ? const SizedBox() // plug NetworkImage later
                    : Image.network(avatarUrl!, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              // Text stack
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fantasy team name (can wrap to 2 lines)
                    Text(fantasyTeamName.toUpperCase(), maxLines: 2, overflow: TextOverflow.ellipsis, style: t.bodySmall),
                    const SizedBox(height: 6),
                    Text('Round $roundNumber, Pick $pickNumber', style: t.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
