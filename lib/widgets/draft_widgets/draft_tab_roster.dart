import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class DraftTabRoster extends StatelessWidget {
  const DraftTabRoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Your Roster',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.black700),
          ),
        ),
        // Content placeholder
        const Expanded(child: Center(child: Text('Roster coming soon…'))),
      ],
    );
  }
}
