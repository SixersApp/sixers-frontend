import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/roster/roster_provider.dart';
import 'package:sixers/backend/roster/roster_service.dart';
import 'package:sixers/theme/colors.dart';

class TeamContent extends ConsumerStatefulWidget {
  const TeamContent({super.key, required this.league});

  final League league;

  @override
  ConsumerState<TeamContent> createState() => _TeamContentState();
}

class _TeamContentState extends ConsumerState<TeamContent> {
  String? selectedTeamId;
  int? selectedGameNumber;
  double scoreColWidth = 75.0;
  double ptsColWidth = 75.0;

  @override
  Widget build(BuildContext context) {
    // Handle draft states
    if (widget.league.status == LeagueStatus.draft_pending || widget.league.status == LeagueStatus.draft_in_progress) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.league.status == LeagueStatus.draft_pending ? "Your league hasn't drafted yet" : "Your league is drafting",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.black800),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => GoRouter.of(context).push('/draft', extra: widget.league),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.black200,
                foregroundColor: AppColors.black800,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Draft Now'),
            ),
          ],
        ),
      );
    }

    if (widget.league.status == LeagueStatus.completed) {
      return const Center(child: Text('League completed'));
    }

    final teamContentAsync = ref.watch(teamContentDataProvider(widget.league));

    return teamContentAsync.when(
      data: (state) {
        if (state.teams.isEmpty) {
          return const Center(child: Text('No teams found'));
        }

        final defaultTeamId = state.userTeamId ?? state.teams.first.id;
        if (selectedTeamId == null || !state.rosterByTeamId.containsKey(selectedTeamId)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() => selectedTeamId = defaultTeamId);
          });
        }

        final activeTeamId = selectedTeamId ?? defaultTeamId;
        final roster = state.rosterByTeamId[activeTeamId];
        if (roster == null || roster.isEmpty) {
          return Column(
            children: [
              _buildTeamSelector(state),
              const SizedBox(height: 24),
              const Expanded(child: Center(child: Text('No roster data available yet'))),
            ],
          );
        }

        final gameNumbers = state.matchups.map((m) => m.matchNum).toSet().toList()..sort();
        if (selectedGameNumber == null && gameNumbers.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() => selectedGameNumber = gameNumbers.first);
          });
        }

        final currentGame = selectedGameNumber ?? (gameNumbers.isNotEmpty ? gameNumbers.first : 1);
        if (gameNumbers.isNotEmpty && !gameNumbers.contains(currentGame)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() => selectedGameNumber = gameNumbers.first);
          });
        }

        return Column(
          children: [
            SizedBox(height: 15),
            _buildTeamSelector(state),
            if (gameNumbers.isNotEmpty) const SizedBox(height: 16),
            if (gameNumbers.isNotEmpty) _buildGameNavigation(gameNumbers, currentGame),
            if (gameNumbers.isNotEmpty) const SizedBox(height: 16),
            Expanded(child: _buildPlayerList(roster)),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error loading team data: $error')),
    );
  }

  Widget _buildTeamSelector(TeamContentData state) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: state.teams.length,
        itemBuilder: (context, index) {
          final team = state.teams[index];
          final isSelected = team.id == selectedTeamId;
          final teamColors = _getTeamColor(index);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTeamId = team.id;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.black300 : AppColors.black200,
                borderRadius: BorderRadius.circular(12),
                border: isSelected ? Border.all(color: teamColors, width: 2) : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: teamColors, borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.person, color: AppColors.black800, size: 8),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 60,
                    child: Text(
                      team.teamName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isSelected ? AppColors.black800 : AppColors.black600,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameNavigation(List<int> gameNumbers, int currentGameNumber) {
    if (gameNumbers.isEmpty) {
      return const SizedBox.shrink();
    }

    final currentIndex = gameNumbers.indexOf(currentGameNumber);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.black200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.black600),
            onPressed: currentIndex > 0
                ? () {
                    setState(() {
                      selectedGameNumber = gameNumbers[currentIndex - 1];
                    });
                  }
                : null,
          ),
          Text(
            'Game $currentGameNumber',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.black600),
            onPressed: currentIndex >= 0 && currentIndex < gameNumbers.length - 1
                ? () {
                    setState(() {
                      selectedGameNumber = gameNumbers[currentIndex + 1];
                    });
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList(TeamRoster roster) {
    final hasAnyPlayers = roster.batting.isNotEmpty || roster.bowling.isNotEmpty || roster.allRounders.isNotEmpty;
    if (!hasAnyPlayers) {
      return const Center(child: Text('No players have been drafted yet'));
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        if (roster.batting.isNotEmpty) _buildPlayerSection('BATTING', Icons.sports_cricket, roster.batting, roster.isEditable),
        if (roster.batting.isNotEmpty && (roster.bowling.isNotEmpty || roster.allRounders.isNotEmpty)) const SizedBox(height: 24),
        if (roster.bowling.isNotEmpty) _buildPlayerSection('BOWLING', Icons.sports_baseball, roster.bowling, roster.isEditable),
        if (roster.bowling.isNotEmpty && roster.allRounders.isNotEmpty) const SizedBox(height: 24),
        if (roster.allRounders.isNotEmpty)
          _buildPlayerSection('ALL-ROUNDERS', Icons.directions_run, roster.allRounders, roster.isEditable),
      ],
    );
  }

  Widget _buildPlayerSection(String title, IconData icon, List<RosterPlayer> players, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: AppColors.black600),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Column Headers
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            children: [
              Expanded(child: Text('Player', style: _getColumnHeaderStyle())),
              SizedBox(
                width: scoreColWidth,
                child: Text('Score', style: _getColumnHeaderStyle()),
              ),
              SizedBox(
                width: ptsColWidth,
                child: Text('Pts', style: _getColumnHeaderStyle()),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Player List
        ...players.map((player) => _buildPlayerRow(player, isEditable)),
      ],
    );
  }

  Widget _buildPlayerRow(RosterPlayer player, bool canEdit) {
    final isEditable = canEdit;
    final displayScore = player.score ?? '—';
    final points = player.points;
    final basePoints = player.basePoints;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.black200, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Player Info
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(color: AppColors.black300, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.person, color: AppColors.black600, size: 32),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(player.name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                        if (player.isCaptain) ...[
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.red100, borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'C',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.black800,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                if (player.hasInjury) ...[
                                  const SizedBox(width: 2),
                                  Icon(Icons.close, size: 10, color: AppColors.black800),
                                ],
                              ],
                            ),
                          ),
                        ],
                        if (player.isViceCaptain) ...[
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.yellow300, borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              'VC',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.black100,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      player.matchDetails ?? player.realTeamName,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.black600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Score
          SizedBox(
            width: scoreColWidth,
            child: Text(
              displayScore,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
              textAlign: TextAlign.center,
            ),
          ),
          // Points
          SizedBox(
            width: ptsColWidth,
            child: IconButton(
              icon: Icon(isEditable ? Icons.edit : Icons.lock, size: 20, color: AppColors.black600),
              onPressed: isEditable
                  ? () {
                      // TODO: implement edit flow
                    }
                  : null,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _getColumnHeaderStyle() {
    return Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.black600, fontWeight: FontWeight.w500) ??
        const TextStyle();
  }

  Color _getTeamColor(int index) {
    final colors = [AppColors.yellow300, AppColors.blue200, AppColors.green300, AppColors.purple200, AppColors.cyan200];
    return colors[index % colors.length];
  }
}
