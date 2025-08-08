import 'package:flutter/material.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/draft_lobby.dart';

class PositionFilterButton extends StatelessWidget {
  const PositionFilterButton({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final PositionFilter selected;
  final ValueChanged<PositionFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return PopupMenuButton<PositionFilter>(
      initialValue: selected,
      onSelected: onChanged,
      itemBuilder: (ctx) => [
        PopupMenuItem(value: PositionFilter.all, child: const Text('All')),
        PopupMenuItem(
          value: PositionFilter.batsman,
          child: const Text('Batsman'),
        ),
        PopupMenuItem(
          value: PositionFilter.bowler,
          child: const Text('Bowler'),
        ),
        PopupMenuItem(
          value: PositionFilter.wicketKeeper,
          child: const Text('Wicket Keeper'),
        ),
        PopupMenuItem(
          value: PositionFilter.allRounder,
          child: const Text('All Rounder'),
        ),
      ],
      // Make it look like your pill
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.black300, // black300
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // (icon placeholder removed per your note)
            Text(labelForFilter(selected), style: text.bodyMedium),
            const SizedBox(width: 8),
            const Icon(Icons.expand_more, size: 18),
          ],
        ),
      ),
    );
  }
}
