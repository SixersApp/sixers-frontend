// lib/widgets/board/team_header.dart
import 'package:flutter/material.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({
    super.key,
    required this.size,
    required this.name,
    required this.scheme,
  });

  final double size; // square tile size
  final String name;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    const double pad = 12;

    return SizedBox(
      width: size,
      height: size, // square
      child: Container(
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name above the icon (keep left-aligned; change to center if you want)
            Text(
              name.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),

            // ⬇️ Center the placeholder inside the block
            Expanded(
              child: Center(
                // optionally make it a bit smaller than full width
                child: FractionallySizedBox(
                  widthFactor:
                      0.72, // tweak 0.6–0.9 to taste, or remove for full width
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: scheme.onSurface.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.shield,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
