import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/trades/trade_model.dart';
import 'package:sixers/backend/trades/trade_provider.dart';
import 'package:sixers/theme/colors.dart';

class TradesTab extends ConsumerStatefulWidget {
  const TradesTab({super.key, required this.league});

  final League league;

  @override
  ConsumerState<TradesTab> createState() => _TradesTabState();
}

class _TradesTabState extends ConsumerState<TradesTab> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (widget.league.userTeamId.isNotEmpty) {
        ref.read(tradesProvider.notifier).loadTrades(widget.league.userTeamId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tradesAsync = ref.watch(tradesProvider);
    final userTeamId = widget.league.userTeamId;

    return tradesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e', style: const TextStyle(color: Colors.white))),
      data: (trades) {
        final incoming = trades
            .where((t) => t.recipientTeamId == userTeamId && t.status == 'pending')
            .toList();
        final outgoing = trades
            .where((t) => t.proposerTeamId == userTeamId && t.status == 'pending')
            .toList();
        final history = trades.where((t) => t.status != 'pending').toList();

        return RefreshIndicator(
          onRefresh: () => ref.read(tradesProvider.notifier).loadTrades(userTeamId),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
            children: [
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.push(
                    '/leagues/${widget.league.id}/trades/propose',
                    extra: {'league': widget.league},
                  ),
                  icon: const Icon(Icons.swap_horiz, size: 20),
                  label: const Text('Propose Trade'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black300,
                    foregroundColor: AppColors.black800,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              if (incoming.isNotEmpty) ...[
                _SectionLabel(title: 'Incoming (${incoming.length})'),
                const SizedBox(height: 10),
                ...incoming.map((t) => _TradeCard(
                  trade: t,
                  userTeamId: userTeamId,
                  onAccept: () => _handleAction(
                    () => ref.read(tradesProvider.notifier).accept(t.id),
                  ),
                  onDecline: () => _handleAction(
                    () => ref.read(tradesProvider.notifier).decline(t.id),
                  ),
                )),
                const SizedBox(height: 24),
              ],

              if (outgoing.isNotEmpty) ...[
                _SectionLabel(title: 'Outgoing (${outgoing.length})'),
                const SizedBox(height: 10),
                ...outgoing.map((t) => _TradeCard(
                  trade: t,
                  userTeamId: userTeamId,
                  onCancel: () => _handleAction(
                    () => ref.read(tradesProvider.notifier).decline(t.id),
                  ),
                )),
                const SizedBox(height: 24),
              ],

              if (incoming.isEmpty && outgoing.isEmpty && history.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(
                    child: Text(
                      'No trades yet.\nTap "Propose Trade" to get started.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.6),
                    ),
                  ),
                ),

              if (history.isNotEmpty) ...[
                _SectionLabel(title: 'History'),
                const SizedBox(height: 10),
                ...history.map((t) => _TradeCard(trade: t, userTeamId: userTeamId)),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleAction(Future<Map<String, dynamic>> Function() action) async {
    final result = await action();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result['message'] ?? (result['ok'] == true ? 'Done' : 'Something went wrong')),
      backgroundColor: result['ok'] == true ? Colors.green.shade800 : Colors.red.shade800,
    ));
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: AppColors.black600,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _TradeCard extends StatelessWidget {
  const _TradeCard({
    required this.trade,
    required this.userTeamId,
    this.onAccept,
    this.onDecline,
    this.onCancel,
  });

  final Trade trade;
  final String userTeamId;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final isOutgoing = trade.proposerTeamId == userTeamId;
    final statusColor = switch (trade.status) {
      'completed' => Colors.green.shade700,
      'declined' || 'cancelled' => Colors.red.shade700,
      _ => AppColors.black500,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isOutgoing ? 'To: ${trade.toTeam}' : 'From: ${trade.fromTeam}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  trade.status,
                  style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _PlayerRow(
            label: isOutgoing ? 'You offer' : 'They offer',
            players: trade.offeredPlayers,
          ),
          const SizedBox(height: 6),
          _PlayerRow(
            label: isOutgoing ? 'You request' : 'You give',
            players: trade.requestedPlayers,
          ),
          if (onAccept != null || onDecline != null || onCancel != null) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                if (onAccept != null)
                  Expanded(
                    child: _ActionButton(label: 'Accept', color: Colors.green.shade700, onTap: onAccept!),
                  ),
                if (onAccept != null && onDecline != null) const SizedBox(width: 8),
                if (onDecline != null)
                  Expanded(
                    child: _ActionButton(label: 'Decline', color: Colors.red.shade800, onTap: onDecline!),
                  ),
                if (onCancel != null)
                  Expanded(
                    child: _ActionButton(label: 'Cancel', color: Colors.red.shade800, onTap: onCancel!),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _PlayerRow extends StatelessWidget {
  const _PlayerRow({required this.label, required this.players});
  final String label;
  final List<TradePlayer> players;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(label, style: TextStyle(color: AppColors.black600, fontSize: 12)),
        ),
        Expanded(
          child: Text(
            players.map((p) => p.name).join(', '),
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.color, required this.onTap});
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Center(
          child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
        ),
      ),
    );
  }
}
