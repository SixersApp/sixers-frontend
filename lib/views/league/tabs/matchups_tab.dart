import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_provider.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';

class MatchupsTab extends ConsumerStatefulWidget {
  const MatchupsTab({
    super.key,
    required this.league,
    required this.selectedMatchupIndex,
    required this.onMatchupChanged,
  });

  final League league;
  final int selectedMatchupIndex;
  final Function(int) onMatchupChanged;

  @override
  ConsumerState<MatchupsTab> createState() => _MatchupsTabState();
}

class _MatchupsTabState extends ConsumerState<MatchupsTab> {
  FantasyPlayer? _selectedPlayerForBreakdown;

  @override
  Widget build(BuildContext context) {
    final matchupsAsync = ref.watch(userMatchupsProvider);

    return matchupsAsync.when(
      data: (allMatchups) {
        // Filter matchups for this league
        final leagueMatchups = allMatchups
            .where((matchup) => matchup.leagueId == widget.league.id)
            .toList();

        if (leagueMatchups.isEmpty) {
          return const Center(
            child: Text(
              'No matchups found for this league',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        // Get the selected matchup
        final matchupIndex = widget.selectedMatchupIndex.clamp(0, leagueMatchups.length - 1);
        final selectedMatchup = leagueMatchups[matchupIndex];

        return _buildMatchupDetailsView(selectedMatchup, leagueMatchups, matchupIndex);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error loading matchups: $err',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMatchupDetailsView(Matchup matchup, List<Matchup> allMatchups, int currentIndex) {
    // Find the teams from the league
    final team1 = widget.league.teams.firstWhereOrNull((t) => t.id == matchup.fantasyTeam1Id);
    final team2 = widget.league.teams.firstWhereOrNull((t) => t.id == matchup.fantasyTeam2Id);

    if (team1 == null || team2 == null) {
      return const Center(
        child: Text('Teams not found', style: TextStyle(color: Colors.white)),
      );
    }

    final team1Async = ref.watch(fantasyPlayerControllerProvider(matchup.fantasyTeamInstance1Id));
    final team2Async = ref.watch(fantasyPlayerControllerProvider(matchup.fantasyTeamInstance2Id));

    return Stack(
      children: [
        team1Async.when(
          data: (team1Players) => team2Async.when(
            data: (team2Players) => _buildMatchContent(
              matchup, team1, team2, team1Players, team2Players, 
              allMatchups, currentIndex
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(
              child: Text('Error loading team 2: $err', 
                style: const TextStyle(color: Colors.white)),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(
            child: Text('Error loading team 1: $err', 
              style: const TextStyle(color: Colors.white)),
          ),
        ),
        if (_selectedPlayerForBreakdown != null)
          _buildScoreBreakdownSheet(),
      ],
    );
  }

  Widget _buildMatchContent(
    Matchup matchup,
    FantasyTeam team1,
    FantasyTeam team2,
    List<FantasyPlayer> team1Players,
    List<FantasyPlayer> team2Players,
    List<Matchup> allMatchups,
    int currentIndex,
  ) {
    final allPlayers = [...team1Players, ...team2Players];
    final s1 = matchup.fantasyTeamInstance1Score;
    final s2 = matchup.fantasyTeamInstance2Score;
    final total = s1 + s2;
    final wp1 = total > 0 ? ((s1 / total) * 100).round() : 50;
    final wp2 = total > 0 ? ((s2 / total) * 100).round() : 50;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMatchHeader(team1, team2, s1, s2, wp1, wp2),
          const SizedBox(height: 16),
          _buildGameNavigation(matchup, allMatchups, currentIndex),
          const SizedBox(height: 24),
          _buildBattingSection(allPlayers, team1Players, team2Players),
          const SizedBox(height: 24),
          _buildBowlingSection(allPlayers, team1Players, team2Players),
          const SizedBox(height: 24),
          _buildAllRoundersSection(allPlayers, team1Players, team2Players),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildMatchHeader(FantasyTeam team1, FantasyTeam team2, int score1, int score2, int wp1, int wp2) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Team logos and names row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTeamBlock(team1),
              // Live indicator
              Row(
                children: [
                  Icon(PhosphorIcons.record(PhosphorIconsStyle.fill), 
                    color: AppColors.red100, size: 10),
                  const SizedBox(width: 6),
                  Text('Live', 
                    style: TextStyle(color: AppColors.red100, fontSize: 12, fontWeight: FontWeight.w800)),
                ],
              ),
              _buildTeamBlock(team2),
            ],
          ),
          const SizedBox(height: 20),
          // Score row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$score1', 
                style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700)),
              Text(' : ', 
                style: TextStyle(color: Colors.grey.shade500, fontSize: 36, fontWeight: FontWeight.w300)),
              Text('$score2', 
                style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 16),
          // Win probability
          Text('WIN PROBABILITY', 
            style: TextStyle(color: Colors.grey.shade500, fontSize: 11, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: wp1 > 0 ? wp1 : 1,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: stringToColor(team1.teamColor),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3), bottomLeft: Radius.circular(3)),
                  ),
                ),
              ),
              Expanded(
                flex: wp2 > 0 ? wp2 : 1,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: stringToColor(team2.teamColor),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(3), bottomRight: Radius.circular(3)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$wp1%', 
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w600)),
              Text('$wp2%', 
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamBlock(FantasyTeam team) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: stringToColor(team.teamColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              stringToAvatar(team.teamIcon),
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: Text(
            team.teamName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        if (team.userName != null && team.userName!.isNotEmpty)
          Text('AKA ${team.userName}', 
            style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
      ],
    );
  }

  Widget _buildGameNavigation(Matchup matchup, List<Matchup> allMatchups, int currentIndex) {
    final canPrev = currentIndex > 0;
    final canNext = currentIndex < allMatchups.length - 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: canPrev ? () => widget.onMatchupChanged(currentIndex - 1) : null,
          icon: Icon(Icons.chevron_left, 
            color: canPrev ? Colors.white : Colors.grey.shade600, size: 28),
        ),
        Column(
          children: [
            Text('Game ${matchup.matchNum}', 
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
            Text(widget.league.tournamentAbbr ?? 'IPL', 
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
          ],
        ),
        IconButton(
          onPressed: canNext ? () => widget.onMatchupChanged(currentIndex + 1) : null,
          icon: Icon(Icons.chevron_right, 
            color: canNext ? Colors.white : Colors.grey.shade600, size: 28),
        ),
      ],
    );
  }

  Widget _buildBattingSection(List<FantasyPlayer> allPlayers, List<FantasyPlayer> team1Players, List<FantasyPlayer> team2Players) {
    final battingPlayers = allPlayers.where((p) {
      final role = p.role.toLowerCase();
      return (role.contains('bat') || role.contains('wicket') || role.contains('keeper'));
    }).toList();

    return Column(
      children: [
        _buildSectionHeader(PhosphorIcons.cricket(), 'BATTING'),
        const SizedBox(height: 12),
        battingPlayers.isEmpty 
          ? _buildEmptySection('No batting stats yet')
          : _buildPlayerGrid(battingPlayers, team1Players, team2Players, true),
      ],
    );
  }

  Widget _buildBowlingSection(List<FantasyPlayer> allPlayers, List<FantasyPlayer> team1Players, List<FantasyPlayer> team2Players) {
    final bowlingPlayers = allPlayers.where((p) {
      final role = p.role.toLowerCase();
      return role.contains('bowl');
    }).toList();

    return Column(
      children: [
        _buildSectionHeader(PhosphorIcons.baseball(), 'BOWLING'),
        const SizedBox(height: 12),
        bowlingPlayers.isEmpty 
          ? _buildEmptySection('No bowling stats yet')
          : _buildPlayerGrid(bowlingPlayers, team1Players, team2Players, false),
      ],
    );
  }

  Widget _buildAllRoundersSection(List<FantasyPlayer> allPlayers, List<FantasyPlayer> team1Players, List<FantasyPlayer> team2Players) {
    final allRounderPlayers = allPlayers.where((p) {
      final role = p.role.toLowerCase();
      return (role.contains('all') || role.contains('allrounder'));
    }).toList();

    return Column(
      children: [
        _buildSectionHeader(PhosphorIcons.star(), 'ALL-ROUNDERS'),
        const SizedBox(height: 12),
        allRounderPlayers.isEmpty 
          ? _buildEmptySection('No all-rounder stats yet')
          : _buildPlayerGrid(allRounderPlayers, team1Players, team2Players, false, isAllRounder: true),
      ],
    );
  }

  Widget _buildSectionHeader(IconData icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
      ],
    );
  }

  Widget _buildEmptySection(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(message, style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
      ),
    );
  }

  Widget _buildPlayerGrid(List<FantasyPlayer> players, List<FantasyPlayer> team1Players, 
      List<FantasyPlayer> team2Players, bool isBatting, {bool isAllRounder = false}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final crossCount = 2;
        final width = (constraints.maxWidth - spacing) / crossCount;
        
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: players.map((player) {
            return SizedBox(
              width: width,
              child: _buildPlayerCard(player, isBatting, isAllRounder: isAllRounder),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildPlayerCard(FantasyPlayer player, bool isBatting, {bool isAllRounder = false}) {
    return GestureDetector(
      onTap: () => _openScoreBreakdown(player),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(10),
          border: const Border(left: BorderSide(color: AppColors.green300, width: 3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(_getShortName(player.fullName),
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                ),
                // TODO: Add C/VC badges when captain data is available
              ],
            ),
            const SizedBox(height: 8),
            if (isBatting) ..._buildBattingStats(player),
            if (!isBatting && !isAllRounder) ..._buildBowlingStats(player),
            if (isAllRounder) ..._buildAllRounderStats(player),
            const SizedBox(height: 4),
            Text(_getMatchContext(player),
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
              maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBattingStats(FantasyPlayer player) {
    final sr = player.ballsFaced > 0 ? (player.runsScored / player.ballsFaced) * 100 : 0.0;
    final isGood = sr >= 120;
    
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('${player.runsScored}',
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(width: 4),
          Icon(isGood ? Icons.arrow_upward : Icons.arrow_downward,
            size: 14, color: isGood ? AppColors.green300 : AppColors.red100),
          const SizedBox(width: 4),
          Text('${player.ballsFaced}B',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
        ],
      ),
    ];
  }

  List<Widget> _buildBowlingStats(FantasyPlayer player) {
    final overs = player.ballsBowled / 6;
    final economy = overs > 0 ? (player.runsConceded / overs) : 0.0;
    final isGood = economy < 7.0 && economy > 0;
    
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('${player.runsConceded}',
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(width: 4),
          Icon(isGood ? Icons.arrow_upward : Icons.arrow_downward,
            size: 14, color: isGood ? AppColors.green300 : AppColors.red100),
          if (player.wicketsTaken > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.purple200,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('${player.wicketsTaken}W',
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
            ),
          ],
        ],
      ),
    ];
  }

  List<Widget> _buildAllRounderStats(FantasyPlayer player) {
    final total = player.fantasyPoints;
    final isGood = total >= 50;
    
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('$total',
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(width: 4),
          Icon(isGood ? Icons.arrow_upward : Icons.arrow_downward,
            size: 14, color: isGood ? AppColors.green300 : AppColors.red100),
        ],
      ),
    ];
  }

  String _getShortName(String fullName) {
    final parts = fullName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}. ${parts.last}';
    }
    return fullName;
  }

  String _getMatchContext(FantasyPlayer player) {
    if (player.homeTeamName.isEmpty || player.awayTeamName.isEmpty) return '';
    final home = _getTeamAbbr(player.homeTeamName);
    final away = _getTeamAbbr(player.awayTeamName);
    return '$home vs $away';
  }

  String _getTeamAbbr(String teamName) {
    final words = teamName.split(' ');
    if (words.length >= 2) {
      return words.map((w) => w[0]).take(2).join().toUpperCase();
    }
    return teamName.length >= 2 ? teamName.substring(0, 2).toUpperCase() : teamName;
  }

  void _openScoreBreakdown(FantasyPlayer player) {
    setState(() {
      _selectedPlayerForBreakdown = player;
    });
  }

  Widget _buildScoreBreakdownSheet() {
    if (_selectedPlayerForBreakdown == null) return const SizedBox();
    
    return GestureDetector(
      onTap: () => setState(() => _selectedPlayerForBreakdown = null),
      child: Container(
        color: Colors.black54,
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: AppColors.black200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20)),
            ),
            child: ListView(
              controller: controller,
              padding: EdgeInsets.only(
                top: 12, left: 20, right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 24),
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.black400,
                      borderRadius: BorderRadius.circular(2)),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Score Breakdown',
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 20),
                _buildPlayerHeader(_selectedPlayerForBreakdown!),
                const SizedBox(height: 16),
                _buildRelevantGame(_selectedPlayerForBreakdown!),
                const SizedBox(height: 16),
                _buildStatsTable(_selectedPlayerForBreakdown!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerHeader(FantasyPlayer player) {
    final total = _calculateTotalScore(player);
    
    return Column(
      children: [
        // Player name and score
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.black300,
              backgroundImage: player.playerImage.isNotEmpty ? NetworkImage(player.playerImage) : null,
              child: player.playerImage.isEmpty 
                ? Text(_getInitials(player.fullName),
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600))
                : null,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(player.fullName,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('Batscore Game',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
              ],
            ),
            const Spacer(),
            Text('$total',
              style: const TextStyle(color: AppColors.green300, fontSize: 32, fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    );
  }

  Widget _buildRelevantGame(FantasyPlayer player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Relevant Game',
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildTeamChip(_getTeamAbbr(player.homeTeamName)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('vs', style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
            ),
            _buildTeamChip(_getTeamAbbr(player.awayTeamName)),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamChip(String abbr) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(abbr,
        style: TextStyle(color: Colors.grey.shade300, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildStatsTable(FantasyPlayer player) {
    final breakdown = _computeScoreBreakdown(player);
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTableRow('', 'Start', 'Pre Perf', 'Points', isHeader: true),
          const Divider(height: 1, color: AppColors.black400),
          ...breakdown.map((row) => _buildTableRow(row.stat, '100', row.ptsPer, '${row.points}')),
          const Divider(height: 1, color: AppColors.black400),
          _buildTableRow('Total', '', '', '${_calculateTotalScore(player)}', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildTableRow(String stat, String start, String prePer, String points, {bool isHeader = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(stat,
              style: TextStyle(
                color: isHeader ? Colors.grey.shade400 : Colors.white,
                fontSize: isHeader ? 12 : 14,
                fontWeight: isHeader ? FontWeight.w600 : FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(start, textAlign: TextAlign.center,
              style: TextStyle(
                color: isHeader ? Colors.grey.shade400 : Colors.grey.shade300,
                fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(prePer, textAlign: TextAlign.center,
              style: TextStyle(
                color: isHeader ? Colors.grey.shade400 : Colors.grey.shade300,
                fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(points, textAlign: TextAlign.right,
              style: TextStyle(
                color: isTotal ? AppColors.green300 : Colors.white,
                fontSize: isTotal ? 18 : 14,
                fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  List<({String stat, String ptsPer, int points})> _computeScoreBreakdown(FantasyPlayer player) {
    final breakdown = <({String stat, String ptsPer, int points})>[];
    
    breakdown.add((stat: 'Runs', ptsPer: '1', points: player.runsScored));
    breakdown.add((stat: "4's scored", ptsPer: '1', points: player.fours));
    breakdown.add((stat: "6's scored", ptsPer: '2', points: player.sixes * 2));
    
    final sr = player.ballsFaced > 0 ? (player.runsScored / player.ballsFaced) * 100 : 0.0;
    final srBonus = sr > 140 ? 6 : 0;
    breakdown.add((stat: 'Strike Rate', ptsPer: 'B', points: srBonus));
    
    if (player.runsScored >= 100) {
      breakdown.add((stat: 'Century Bonus', ptsPer: '8', points: 8));
    }
    
    if (player.catches > 0) {
      breakdown.add((stat: 'Catch Taken', ptsPer: '8', points: player.catches * 8));
    }
    
    return breakdown;
  }

  int _calculateTotalScore(FantasyPlayer player) {
    final breakdown = _computeScoreBreakdown(player);
    return breakdown.fold(0, (sum, item) => sum + item.points);
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}

