// lib/widgets/draft_app_bar.dart
import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class DraftAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DraftAppBar({
    super.key,
    required this.secsLeft,
    required this.roundNumber,
    required this.pickNumber,
  });

  final int secsLeft;
  final int roundNumber;
  final int pickNumber;

  String _mmss(int s) => '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return AppBar(
      iconTheme: const IconThemeData(size: 24, color: AppColors.black800),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleSpacing: 0, // lines up with back chevron like your mock
      title: Text('DRAFT', style: t.headlineMedium),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: Text(_mmss(secsLeft),
              style: t.headlineMedium),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(26),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 6),
            child: Text(
              'Round $roundNumber, Pick $pickNumber',
              style: t.titleLarge?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 26);
}
