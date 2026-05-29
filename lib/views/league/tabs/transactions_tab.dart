import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/players/player_model.dart';
import 'package:sixers/backend/transactions/available_player_model.dart';
import 'package:sixers/backend/transactions/available_player_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/components/helpers.dart';

class TransactionsTab extends ConsumerStatefulWidget {
  const TransactionsTab({
    super.key,
    required this.league,
  });

  final League league;

  @override
  ConsumerState<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends ConsumerState<TransactionsTab> {
  final _scrollController = ScrollController();
  PositionFilter _selectedFilter = PositionFilter.all;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(availablePlayersProvider(widget.league.id).notifier)
          .fetchNextPage();
    }
  }

  String? _filterToAbbr(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return null;
      case PositionFilter.batsman:
        return 'BAT';
      case PositionFilter.bowler:
        return 'BWL';
      case PositionFilter.allRounder:
        return 'AR';
      case PositionFilter.wicketKeeper:
        return 'WK';
    }
  }

  String _filterLabel(PositionFilter f) {
    switch (f) {
      case PositionFilter.all:
        return 'All';
      case PositionFilter.batsman:
        return 'Batsman';
      case PositionFilter.bowler:
        return 'Bowler';
      case PositionFilter.allRounder:
        return 'All Rounder';
      case PositionFilter.wicketKeeper:
        return 'Wicket Keeper';
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final playersState =
        ref.watch(availablePlayersProvider(widget.league.id));
    final currentMatchNum = widget.league.latestGame;
    final filterAbbr = _filterToAbbr(_selectedFilter);

    final filtered = playersState.players.where((p) {
      if (p.availableFrom > currentMatchNum) return false;
      if (filterAbbr != null && p.roleAbbr != filterAbbr) return false;
      return true;
    }).toList();

    return Container(
      color: AppColors.black100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // Position filter chips
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: PositionFilter.values.map((f) {
                final isSelected = f == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedFilter = f),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.black800
                            : AppColors.black300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        _filterLabel(f),
                        style: t.bodyMedium?.copyWith(
                          color: isSelected
                              ? AppColors.black100
                              : AppColors.black600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Column headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Text(
                  'Rank',
                  style: t.labelMedium?.copyWith(color: AppColors.black600),
                ),
                const Spacer(),
                Text(
                  'PPG',
                  style: t.labelMedium?.copyWith(color: AppColors.black600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Player list with infinite scroll
          Expanded(
            child: _buildPlayerList(filtered, playersState),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList(
    List<AvailablePlayer> filtered,
    AvailablePlayersState playersState,
  ) {
    // Initial loading
    if (playersState.isLoading && playersState.players.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error on initial load
    if (playersState.error != null && playersState.players.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              playersState.error!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => ref
                  .read(availablePlayersProvider(widget.league.id).notifier)
                  .reset(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          'No players available',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black600),
        ),
      );
    }

    final itemCount = filtered.length + (playersState.hasMore ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i >= filtered.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        return _AvailablePlayerCard(player: filtered[i]);
      },
    );
  }
}

class _AvailablePlayerCard extends StatelessWidget {
  final AvailablePlayer player;
  const _AvailablePlayerCard({required this.player});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final r = roleIconAndColor(player.role);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          // Rank
          Text(
            '${player.rank}',
            style: t.labelSmall?.copyWith(color: AppColors.black800),
          ),
          // Avatar
          const SizedBox(width: 10),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF464646),
            ),
            clipBehavior: Clip.antiAlias,
            child: player.image != null
                ? Image.network(
                    player.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  )
                : const SizedBox(),
          ),
          const SizedBox(width: 10),
          // Name + role + team
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        player.fullName ?? player.playerName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.bodyMedium?.copyWith(
                          color: AppColors.black800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColors.black400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            player.roleAbbr,
                            style: t.labelSmall?.copyWith(
                              color: AppColors.black800,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          PhosphorIcon(
                            r.icon as PhosphorIconData,
                            size: 12,
                            color: r.color,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  player.teamName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: t.labelSmall?.copyWith(color: AppColors.black600),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // PPG
          Text(
            player.initialProjection != null
                ? player.initialProjection!.toStringAsFixed(1)
                : '—',
            style: t.bodyLarge?.copyWith(color: AppColors.black700),
          ),
        ],
      ),
    );
  }
}
