import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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

  // Map each filter to an icon (pick any you like)
  PhosphorIconData _iconFor(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return PhosphorIcons.arrowCounterClockwise(); // generic “all/filters”
      case PositionFilter.batsman:
        return PhosphorIcons.cricket(); // cricket bat
      case PositionFilter.bowler:
        return PhosphorIcons.boules(); // ball/target-ish
      case PositionFilter.wicketKeeper:
        return PhosphorIcons.boxingGlove(); // glove/hand
      case PositionFilter.allRounder:
        return PhosphorIcons.star(); // all-round
    }
  }

  PopupMenuItem<PositionFilter> _menuItem(
    BuildContext context,
    PositionFilter value,
    String label,
  ) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    // Plain Row instead of ListTile to avoid pill background
    return PopupMenuItem<PositionFilter>(
      value: value,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconFor(value),
            size: 18,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 12),
          Text(label, style: textStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final showLeadingIcon = selected != PositionFilter.all;

    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.black100, // <-- dropdown background
          surfaceTintColor: Colors.transparent, // prevent M3 tint
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
      ),
      child: PopupMenuButton<PositionFilter>(
        onSelected: onChanged,
        itemBuilder: (ctx) => [
          _menuItem(ctx, PositionFilter.all, 'All'),
          _menuItem(ctx, PositionFilter.batsman, 'Batsman'),
          _menuItem(ctx, PositionFilter.bowler, 'Bowler'),
          _menuItem(ctx, PositionFilter.wicketKeeper, 'Wicket Keeper'),
          _menuItem(ctx, PositionFilter.allRounder, 'All Rounder'),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.black300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showLeadingIcon) ...[
                Icon(_iconFor(selected), size: 16, color: scheme.onSurface),
                const SizedBox(width: 8),
              ],
              Text(labelForFilter(selected), style: text.bodyMedium),
              const SizedBox(width: 8),
              const Icon(Icons.expand_more, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
