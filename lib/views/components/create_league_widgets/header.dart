import 'package:flutter/material.dart';

class CreateLeagueHeader extends StatelessWidget {
  const CreateLeagueHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          const SizedBox(width: 8),
          Text(
            'CREATE LEAGUE',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}