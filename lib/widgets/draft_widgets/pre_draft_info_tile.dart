// lib/widgets/draft_widgets/draft_info_card.dart
import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class DraftInfoCard extends StatelessWidget {
  const DraftInfoCard({
    super.key,
    required this.title,
    required this.value,
    this.onTapValue,
    this.backgroundColor = AppColors.black300,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding = const EdgeInsets.fromLTRB(16, 14, 12, 14),
    this.height = 106,
  });

  final String title;
  final Widget value;               
  final VoidCallback? onTapValue;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 6),

          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTapValue,
                child: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
