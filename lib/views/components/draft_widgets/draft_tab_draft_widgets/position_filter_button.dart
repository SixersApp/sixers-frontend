import 'package:flutter/material.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/theme/colors.dart';

class PositionFilterButton extends StatelessWidget {
  const PositionFilterButton({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final PositionFilter selected;
  final ValueChanged<PositionFilter> onChanged;

  // Map each filter to an icon path
  String? _iconPathFor(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return null; // No icon for "all"
      case PositionFilter.batsman:
        return 'assets/images/player_icons/Batsmen.png';
      case PositionFilter.bowler:
        return 'assets/images/player_icons/Bowler.png';
      case PositionFilter.wicketKeeper:
        return 'assets/images/player_icons/Batsmen.png'; // Using Batsmen as placeholder
      case PositionFilter.allRounder:
        return 'assets/images/player_icons/AllRounder.png';
    }
  }

  PopupMenuItem<PositionFilter> _menuItem(
    BuildContext context,
    PositionFilter value,
    String label,
  ) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final iconPath = _iconPathFor(value);

    // Plain Row instead of ListTile to avoid pill background
    return PopupMenuItem<PositionFilter>(
      value: value,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            Image.asset(
              iconPath,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            )
          else
            const Icon(Icons.filter_list, size: 18),
          const SizedBox(width: 12),
          Text(label, style: textStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  _iconPathFor(selected)!,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
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

String labelForFilter(PositionFilter f) {
  switch (f) {
    case PositionFilter.all:
      return 'Position';
    case PositionFilter.batsman:
      return 'Batsman';
    case PositionFilter.bowler:
      return 'Bowler';
    case PositionFilter.wicketKeeper:
      return 'Wicket Keeper';
    case PositionFilter.allRounder:
      return 'All Rounder';
  }
}