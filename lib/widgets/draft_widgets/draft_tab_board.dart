import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class DraftTabBoard extends StatelessWidget {
  const DraftTabBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Draft Board',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.black700),
          ),
        ),
        // Content placeholder
        const Expanded(child: Center(child: Text('Draft board coming soon…'))),
      ],
    );
  }
}
