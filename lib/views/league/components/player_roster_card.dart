import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/theme/colors.dart';

class PlayerRosterCard extends StatelessWidget {
  final FantasyPlayer player;
  final String? slot;
  final VoidCallback? onTap;
  final bool isSelected;
  final String? captainId;
  final String? viceCaptainId;

  const PlayerRosterCard({
    super.key,
    required this.player,
    this.slot,
    this.onTap,
    this.isSelected = false,
    this.captainId,
    this.viceCaptainId,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEditable = player.performanceId.isEmpty;

    return GestureDetector(
      onTap: isEditable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.red200 : AppColors.black300, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            // Player avatar
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.black300,
              backgroundImage: player.playerImage.isNotEmpty ? NetworkImage(player.playerImage) : null,
              child: player.playerImage.isEmpty
                  ? Text(
                      _getInitials(player.fullName),
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    )
                  : null,
            ),

            const SizedBox(width: 5),

            // Player info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        player.fullName,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 6),
                      // Captain/Vice-Captain badge
                      if (_getCaptainBadge() != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getCaptainBadge() == 'C' ? AppColors.red200 : AppColors.yellow300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _getCaptainBadge()!,
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      // Position badge (e.g., "GT")
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          _getTeamAbbr(),
                          style: TextStyle(color: Colors.grey.shade300, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Match info
                      Text('vs ${_getOpponentAbbr()}', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
                      const SizedBox(width: 4),
                      Text('• ${_getMatchTime()}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // Score section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [..._buildScoreDisplay()]),
                const SizedBox(width: 20),
                // Fantasy points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (player.performanceId.isNotEmpty)
                          Icon(
                            player.fantasyPoints > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                            color: player.fantasyPoints > 0 ? AppColors.green300 : Colors.grey,
                            size: 14,
                          ),
                        const SizedBox(width: 2),
                        player.performanceId.isNotEmpty
                            ? Text(
                                '${player.fantasyPoints}',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
                              )
                            : Text(
                                '-',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(color: AppColors.black600, fontSize: 16),
                              ),
                      ],
                    ),
                    Text(
                      '33', // Expected points placeholder
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),

            // Lock/Pen icon
            const SizedBox(width: 15),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                player.performanceId.isNotEmpty ? 'assets/images/player_icons/Lock.png' : 'assets/images/player_icons/Pen.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  String? _getCaptainBadge() {
    if (captainId != null && (captainId == player.playerSeasonId || captainId == player.playerId)) {
      return 'C';
    } else if (viceCaptainId != null && (viceCaptainId == player.playerSeasonId || viceCaptainId == player.playerId)) {
      return 'VC';
    }
    return null;
  }

  String _getTeamAbbr() {
    // Extract team abbreviation from team name
    if (player.homeTeamName.isNotEmpty) {
      final words = player.homeTeamName.split(' ');
      if (words.length >= 2) {
        return words.map((w) => w[0]).take(2).join().toUpperCase();
      }
      return player.homeTeamName.substring(0, 2).toUpperCase();
    }
    return 'GT';
  }

  String _getOpponentAbbr() {
    // Extract opponent abbreviation from team name
    if (player.awayTeamName.isNotEmpty) {
      final words = player.awayTeamName.split(' ');
      if (words.length >= 2) {
        return words.map((w) => w[0]).take(2).join().toUpperCase();
      }
      return player.awayTeamName.substring(0, 2).toUpperCase();
    }
    return 'MI';
  }

  String _getMatchTime() {
    // This would come from match data
    // For now, return a placeholder
    if (player.insertedAt != null) {
      final hour = player.insertedAt!.hour;
      final minute = player.insertedAt!.minute;
      return '${_getDayOfWeek(player.insertedAt!.weekday)} $hour:${minute.toString().padLeft(2, '0')} PM';
    }
    return 'Sun 7:30 PM';
  }

  String _getDayOfWeek(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  List<Widget> _buildScoreDisplay() {
    final role = player.role.toLowerCase();
    final isBatsman = role.contains('bat') || role.contains('wicket') || role.contains('keeper');
    final isBowler = role.contains('bowl');
    final isAllRounder = role.contains('allrounder') || role.contains('all-rounder') || role.contains('all rounder');

    final hasBattingStats = player.runsScored > 0 || player.ballsFaced > 0;
    final hasBowlingStats = player.wicketsTaken > 0 || player.runsConceded > 0 || player.ballsBowled > 0;

    if (isAllRounder) {
      // Show both batting and bowling stats for all-rounders
      return [
        if (hasBattingStats)
          Text(
            '${player.runsScored} (${player.ballsFaced})',
            style: const TextStyle(color: AppColors.black600, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        if (hasBattingStats && hasBowlingStats) const SizedBox(height: 2),
        if (hasBowlingStats)
          Text(
            '${player.wicketsTaken}-${player.runsConceded} (${(player.ballsBowled / 6).toStringAsFixed(1)})',
            style: const TextStyle(color: AppColors.black600, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        if (!hasBattingStats && !hasBowlingStats)
          Text(
            '-',
            style: TextStyle(color: AppColors.black600, fontSize: 14, fontWeight: FontWeight.w600),
          ),
      ];
    } else if (isBowler && hasBowlingStats) {
      // Show only bowling stats for bowlers
      return [
        Text(
          '${player.wicketsTaken}-${player.runsConceded} (${(player.ballsBowled / 6).toStringAsFixed(1)})',
          style: const TextStyle(color: AppColors.black600, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ];
    } else if (isBatsman && hasBattingStats) {
      // Show only batting stats for batsmen and wicketkeepers
      return [
        Text(
          '${player.runsScored} (${player.ballsFaced})',
          style: const TextStyle(color: AppColors.black600, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ];
    } else {
      // No stats available
      return [
        Text(
          '-',
          style: TextStyle(color: AppColors.black600, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ];
    }
  }
}
