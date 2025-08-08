import 'package:flutter/material.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
