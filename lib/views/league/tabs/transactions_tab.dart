import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/trades/trade_model.dart';
import 'package:sixers/backend/trades/trade_provider.dart';
import 'package:sixers/theme/colors.dart';

class TransactionsTab extends ConsumerWidget {
  const TransactionsTab({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradesAsync = ref.watch(leagueTradesProvider(league.id));
    final authAsync = ref.watch(authProviderProvider);

    final String? currentUserId = authAsync.when(data: (s) => s?.userId, loading: () => null, error: (_, __) => null);
    final bool isCommissioner = currentUserId == league.creatorId;

    return tradesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text('Failed to load transactions', style: TextStyle(color: AppColors.black600)),
      ),
      data: (trades) {
        if (trades.isEmpty) {
          return Center(
            child: Text(
              'No transactions yet',
              style: TextStyle(color: AppColors.black600, fontSize: 16),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.read(leagueTradesProvider(league.id).notifier).refresh(),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            itemCount: trades.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final trade = trades[index];
              return _TradeCard(
                trade: trade,
                isCommissioner: isCommissioner,
                leagueId: league.id,
                ref: ref,
              );
            },
          ),
        );
      },
    );
  }
}

class _TradeCard extends StatelessWidget {
  const _TradeCard({
    required this.trade,
    required this.isCommissioner,
    required this.leagueId,
    required this.ref,
  });

  final Trade trade;
  final bool isCommissioner;
  final String leagueId;
  final WidgetRef ref;

  Color _statusColor() {
    return switch (trade.status) {
      'completed' => Colors.green.shade400,
      'pending' => Colors.orange.shade300,
      'accepted' => Colors.blue.shade300,
      'declined' || 'cancelled' => AppColors.black600,
      'vetoed' => Colors.red.shade400,
      _ => AppColors.black600,
    };
  }

  String _statusLabel() {
    return switch (trade.status) {
      'completed' => 'Completed',
      'pending' => 'Pending',
      'accepted' => 'Awaiting execution',
      'declined' => 'Declined',
      'cancelled' => 'Cancelled',
      'vetoed' => 'Vetoed',
      _ => trade.status,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: teams + status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${trade.fromTeam} → ${trade.toTeam}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: _statusColor().withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _statusLabel(),
                  style: TextStyle(color: _statusColor(), fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Players row
          Row(
            children: [
              Expanded(
                child: _PlayerList(
                  label: 'Offered',
                  players: trade.offeredPlayers,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.swap_horiz, color: Colors.white38, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: _PlayerList(
                  label: 'Requested',
                  players: trade.requestedPlayers,
                ),
              ),
            ],
          ),

          // Veto button for commissioner on accepted trades
          if (isCommissioner && trade.status == 'accepted') ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _onVeto(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade400,
                  side: BorderSide(color: Colors.red.shade400),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Veto Trade', style: TextStyle(fontSize: 13)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _onVeto(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.black200,
        title: const Text('Veto Trade?', style: TextStyle(color: Colors.white)),
        content: const Text(
          'This will cancel the trade before it executes.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Veto', style: TextStyle(color: Colors.red.shade400)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref.read(leagueTradesProvider(leagueId).notifier).veto(trade.id);
    }
  }
}

class _PlayerList extends StatelessWidget {
  const _PlayerList({required this.label, required this.players});

  final String label;
  final List<TradePlayer> players;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppColors.black600, fontSize: 11)),
        const SizedBox(height: 4),
        ...players.map((p) => Text(
          p.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          overflow: TextOverflow.ellipsis,
        )),
        if (players.isEmpty)
          Text('—', style: TextStyle(color: AppColors.black600, fontSize: 13)),
      ],
    );
  }
}
