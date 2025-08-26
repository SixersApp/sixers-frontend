import 'package:flutter/material.dart';

class GreyShimmer extends StatelessWidget {
  final double height;
  const GreyShimmer({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}