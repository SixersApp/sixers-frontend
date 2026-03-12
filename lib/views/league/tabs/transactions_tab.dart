import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/leagues/league_model.dart';

class TransactionsTab extends ConsumerWidget {
  const TransactionsTab({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Transactions content goes here',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

