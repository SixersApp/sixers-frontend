import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/theme/colors.dart';

class PlayerRosterCard extends StatelessWidget {
  final FantasyPlayer player;

  const PlayerRosterCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.black300, width: 1),
      ),
      child: Row(
        children: [
          // Player avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.black300,
            backgroundImage: player.playerImage.isNotEmpty
                ? NetworkImage(player.playerImage)
                : null,
            child: player.playerImage.isEmpty
                ? Text(
                    _getInitials(player.fullName),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
          ),

          const SizedBox(width: 12),

          // Player info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      player.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Captain/Vice-Captain badge
                    if (_getCaptainBadge() != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getCaptainBadge() == 'C'
                              ? AppColors.red200
                              : AppColors.yellow300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getCaptainBadge()!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _getTeamAbbr(),
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Match info
                    Text(
                      'vs ${_getOpponentAbbr()}',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '• ${_getMatchTime()}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Score section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (player.runsScored > 0 || player.ballsFaced > 0) ...[
                Text(
                  '${player.runsScored} (${player.ballsFaced})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ] else if (player.wicketsTaken > 0 ||
                  player.runsConceded > 0) ...[
                Text(
                  '${player.wicketsTaken}-${player.runsConceded} (${(player.ballsBowled / 6).toStringAsFixed(1)})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ] else ...[
                Text(
                  '-',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const SizedBox(height: 4),
              // Fantasy points
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: player.fantasyPoints > 0
                      ? AppColors.green700
                      : AppColors.black300,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      player.fantasyPoints > 0
                          ? Icons.arrow_upward
                          : Icons.remove,
                      color: player.fantasyPoints > 0
                          ? AppColors.green300
                          : Colors.grey,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${player.fantasyPoints}',
                      style: TextStyle(
                        color: player.fantasyPoints > 0
                            ? AppColors.green300
                            : Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '33', // Total points placeholder
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          // Edit icon
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            color: Colors.grey.shade600,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
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
    // This would come from the FTI or player data
    // For now, return null as we don't have this data yet
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
}

