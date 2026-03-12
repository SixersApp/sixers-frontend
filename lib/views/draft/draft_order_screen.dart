import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/draft/appsync_draft_service.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';

class DraftOrderScreen extends ConsumerStatefulWidget {
  static const String route = '/draft-order';

  final League league;

  const DraftOrderScreen({super.key, required this.league});

  @override
  ConsumerState<DraftOrderScreen> createState() => _DraftOrderScreenState();
}

class _DraftOrderScreenState extends ConsumerState<DraftOrderScreen> {
  late List<FantasyTeam> _orderedTeams;
  late League _league;
  bool _isRefreshing = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _league = widget.league;
    _orderedTeams = List.from(_league.teams);
    _refreshLeagues();
  }

  Future<void> _refreshLeagues() async {
    setState(() => _isRefreshing = true);
    try {
      await ref.read(leaguesProvider.notifier).refresh();
      final leagues = await ref.read(leaguesProvider.future);
      final updatedLeague = leagues.firstWhere(
        (l) => l.id == _league.id,
        orElse: () => _league,
      );
      if (mounted) {
        setState(() {
          _league = updatedLeague;
          _orderedTeams = List.from(_league.teams);
          _isRefreshing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isRefreshing = false);
      }
    }
  }

  void _randomizeOrder() {
    setState(() {
      _orderedTeams.shuffle(Random());
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final team = _orderedTeams.removeAt(oldIndex);
      _orderedTeams.insert(newIndex, team);
    });
  }

  Future<void> _confirmOrder() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);

    try {
      final draftOrder = _orderedTeams.asMap().entries.map((entry) => ({
        "teamId": entry.value.id,
        "order": entry.key + 1,
      })).toList();

      await AppSyncDraftService().startDraft(
        leagueId: _league.id,
        draftOrder: draftOrder,
      );

      ref.invalidate(leaguesProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Draft started!')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        final message = e.toString().replaceFirst('Exception: ', '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black100,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: PhosphorIcon(
                PhosphorIcons.caretLeft(),
                size: 24,
                color: AppColors.black800,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'DRAFT ORDER',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.black800),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Randomize Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FilledButton(
                onPressed: _randomizeOrder,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.shuffle(),
                      size: 24,
                      color: AppColors.black800,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Randomize Order',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Instructions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Drag teams to set the draft order',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.black600),
              ),
            ),
            const SizedBox(height: 12),
            // Reorderable Team List
            Expanded(
              child: ReorderableListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _orderedTeams.length,
                onReorder: _onReorder,
                proxyDecorator: (child, index, animation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      final scale = Tween<double>(begin: 1.0, end: 1.05)
                          .animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            ),
                          )
                          .value;
                      return Transform.scale(
                        scale: scale,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: child,
                        ),
                      );
                    },
                    child: child,
                  );
                },
                itemBuilder: (context, index) {
                  final team = _orderedTeams[index];
                  return _TeamCard(
                    key: ValueKey(team.id),
                    team: team,
                    position: index + 1,
                  );
                },
              ),
            ),
            // Confirm Button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _confirmOrder,
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.black100,
                          ),
                        )
                      : Text(
                          'Start Draft',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black100,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final FantasyTeam team;
  final int position;

  const _TeamCard({super.key, required this.team, required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,

      child: Row(
        children: [
          // Position Number
          Container(  
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.black400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$position',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Team Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: stringToColor(team.teamColor),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: stringToColor(team.teamColor).withValues(alpha: 0.5),
                  blurRadius: 60,
                  spreadRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                stringToAvatar(team.teamIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Team Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.teamName,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontSize: 16),
                ),
                Text(
                  'AKA ${team.userName ?? 'Unknown'}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColors.black700),
                ),
              ],
            ),
          ),
          // Drag Handle
          PhosphorIcon(
            PhosphorIcons.dotsSixVertical(),
            size: 24,
            color: AppColors.black600,
          ),
        ],
      ),
    );
  }
}
