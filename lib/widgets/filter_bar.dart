

import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key, 
    required this.position,
    required this.onPositionTap,
  });

  final String position;
  final VoidCallback onPositionTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPositionTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: scheme.surfaceVariant,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: scheme.outline),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(position, style: t.labelLarge),
                const SizedBox(width: 6),
                const Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
