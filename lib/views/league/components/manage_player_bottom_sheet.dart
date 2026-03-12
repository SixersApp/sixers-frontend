import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/theme/colors.dart';

class ManagePlayerBottomSheet extends StatefulWidget {
  final FantasyPlayer selectedPlayer;
  final String selectedSlot;
  final List<({FantasyPlayer? player, String slot})> availablePlayers;
  final Function(String slot1, String slot2) onSwap;
  final bool showMoveToBench;
  final String? currentCaptain;
  final String? currentViceCaptain;
  final Future<Map<String, dynamic>> Function(String captain, String viceCaptain) onCaptainChange;

  const ManagePlayerBottomSheet({
    super.key,
    required this.selectedPlayer,
    required this.selectedSlot,
    required this.availablePlayers,
    required this.onSwap,
    this.showMoveToBench = false,
    this.currentCaptain,
    this.currentViceCaptain,
    required this.onCaptainChange,
  });

  @override
  State<ManagePlayerBottomSheet> createState() => _ManagePlayerBottomSheetState();
}

class _ManagePlayerBottomSheetState extends State<ManagePlayerBottomSheet> {
  late String? selectedCaptainRole;
  late String? currentCaptain;
  late String? currentViceCaptain;
  bool isUpdatingCaptain = false;

  @override
  void initState() {
    super.initState();
    currentCaptain = widget.currentCaptain;
    currentViceCaptain = widget.currentViceCaptain;

    // Determine the current role for the selected player
    if (currentCaptain == widget.selectedPlayer.playerSeasonId ||
        currentCaptain == widget.selectedPlayer.playerId) {
      selectedCaptainRole = 'captain';
    } else if (currentViceCaptain == widget.selectedPlayer.playerSeasonId ||
        currentViceCaptain == widget.selectedPlayer.playerId) {
      selectedCaptainRole = 'vice_captain';
    } else {
      selectedCaptainRole = 'regular';
    }
  }

  String _getPositionTitle(String slot) {
    if (slot.startsWith('bat')) return 'BATSMAN';
    if (slot.startsWith('bowl')) return 'BOWLER';
    if (slot.startsWith('all')) return 'ALL-ROUNDER';
    if (slot.startsWith('wicket')) return 'WICKET-KEEPER';
    if (slot.startsWith('flex')) return 'FLEX';
    if (slot.startsWith('bench')) return 'BENCH';
    return 'PLAYER';
  }

  @override
  Widget build(BuildContext context) {
    final positionTitle = _getPositionTitle(widget.selectedSlot);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.black100,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(2)),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Text(
                  'MANAGE $positionTitle',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Selected player card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.black200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.red200, width: 2),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.black300,
                  backgroundImage: widget.selectedPlayer.playerImage.isNotEmpty
                      ? NetworkImage(widget.selectedPlayer.playerImage)
                      : null,
                  child: widget.selectedPlayer.playerImage.isEmpty
                      ? Text(
                          _getInitials(widget.selectedPlayer.fullName),
                          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                        )
                      : null,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.selectedPlayer.fullName,
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 6),
                          if (_getSelectedPlayerBadge() != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getSelectedPlayerBadge() == 'C' ? AppColors.red200 : AppColors.yellow300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                _getSelectedPlayerBadge()!,
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              _getTeamAbbr(widget.selectedPlayer),
                              style: TextStyle(color: Colors.grey.shade300, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'vs ${_getOpponentAbbr(widget.selectedPlayer)}',
                            style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '• ${_getMatchTime(widget.selectedPlayer)}',
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Compact captain dropdown with loading indicator
                isUpdatingCaptain
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.red200),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.black300, borderRadius: BorderRadius.circular(6)),
                        child: DropdownButton<String>(
                          value: selectedCaptainRole,
                          isDense: true,
                          dropdownColor: AppColors.black400,
                          underline: const SizedBox(),
                          style: const TextStyle(color: Colors.white, fontSize: 11),
                          items: const [
                            DropdownMenuItem(value: 'captain', child: Text('Captain')),
                            DropdownMenuItem(value: 'vice_captain', child: Text('Vice Captain')),
                            DropdownMenuItem(value: 'regular', child: Text('Regular')),
                          ],
                          onChanged: (value) async {
                            if (value != null) {
                              await _updateCaptainSelection(value);
                            }
                          },
                        ),
                      ),
                const SizedBox(width: 15),
                // Fantasy points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.selectedPlayer.performanceId.isNotEmpty)
                          Icon(
                            widget.selectedPlayer.fantasyPoints > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                            color: widget.selectedPlayer.fantasyPoints > 0 ? AppColors.green300 : Colors.grey,
                            size: 14,
                          ),
                        const SizedBox(width: 2),
                        widget.selectedPlayer.performanceId.isNotEmpty
                            ? Text(
                                '${widget.selectedPlayer.fantasyPoints}',
                                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
                              )
                            : const Text('-', style: TextStyle(color: AppColors.black600, fontSize: 16)),
                      ],
                    ),
                    Text(
                      '33', // Predicted points
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Move to Bench option
          if (widget.showMoveToBench) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Move Player',
                  style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildMoveToBenchCard(context),
            const SizedBox(height: 20),
          ],

          // Available swap players section
          if (widget.availablePlayers.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Swap With',
                  style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: widget.availablePlayers.length,
                itemBuilder: (context, index) {
                  final playerData = widget.availablePlayers[index];
                  if (playerData.player == null) {
                    return _buildEmptySlotCard(context, playerData.slot);
                  }
                  return _buildSwapPlayerCard(context, playerData.player!, playerData.slot);
                },
              ),
            ),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSwapPlayerCard(BuildContext context, FantasyPlayer player, String slot) {
    // Determine if this player is captain or vice captain using local state
    String? captainBadge;
    if (currentCaptain == player.playerSeasonId || currentCaptain == player.playerId) {
      captainBadge = 'C';
    } else if (currentViceCaptain == player.playerSeasonId || currentViceCaptain == player.playerId) {
      captainBadge = 'VC';
    }

    final bool hasPlayed = player.performanceId.isNotEmpty;

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.onSwap(widget.selectedSlot, slot);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Lock/Swap icon on the left
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(5),
              child: hasPlayed
                  ? Image.asset('assets/images/player_icons/Lock.png', width: 20, height: 20, fit: BoxFit.contain)
                  : const Icon(Icons.swap_vert, color: AppColors.black800, size: 20),
            ),
            const SizedBox(width: 12),

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
                      if (captainBadge != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: captainBadge == 'C' ? AppColors.red200 : AppColors.yellow300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            captainBadge,
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      // Team badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          _getTeamAbbr(player),
                          style: TextStyle(color: Colors.grey.shade300, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('vs ${_getOpponentAbbr(player)}', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
                      const SizedBox(width: 4),
                      Text('• ${_getMatchTime(player)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // Score section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [..._buildScoreDisplay(player)]),
                const SizedBox(width: 15),
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
                                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
                              )
                            : const Text(
                                '-',
                                style: TextStyle(color: AppColors.black600, fontSize: 16),
                              ),
                      ],
                    ),
                    Text(
                      '33', // Predicted points
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _getSelectedPlayerBadge() {
    if (currentCaptain == widget.selectedPlayer.playerSeasonId || currentCaptain == widget.selectedPlayer.playerId) {
      return 'C';
    } else if (currentViceCaptain == widget.selectedPlayer.playerSeasonId ||
        currentViceCaptain == widget.selectedPlayer.playerId) {
      return 'VC';
    }
    return null;
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  List<Widget> _buildScoreDisplay(FantasyPlayer player) {
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
          const Text(
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
        const Text(
          '-',
          style: TextStyle(color: AppColors.black600, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ];
    }
  }

  Future<void> _updateCaptainSelection(String role) async {
    String? newCaptain = currentCaptain;
    String? newViceCaptain = currentViceCaptain;

    final playerId = widget.selectedPlayer.playerSeasonId.isNotEmpty
        ? widget.selectedPlayer.playerSeasonId
        : widget.selectedPlayer.playerId;

    // If changing TO captain
    if (role == 'captain') {
      newCaptain = playerId;
      // If this player was vice captain, clear vice captain
      if (newViceCaptain == playerId) {
        newViceCaptain = null;
      }
    }
    // If changing TO vice captain
    else if (role == 'vice_captain') {
      newViceCaptain = playerId;
      // If this player was captain, clear captain
      if (newCaptain == playerId) {
        newCaptain = null;
      }
    }
    // If changing TO regular
    else {
      // Remove from captain or vice captain if applicable
      if (newCaptain == playerId) {
        newCaptain = null;
      }
      if (newViceCaptain == playerId) {
        newViceCaptain = null;
      }
    }

    // Validate both captain and vice captain are selected
    if (newCaptain == null || newViceCaptain == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Both captain and vice captain must be selected'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Show loading indicator
    setState(() {
      isUpdatingCaptain = true;
    });

    // Call the API
    final result = await widget.onCaptainChange(newCaptain, newViceCaptain);

    // Hide loading indicator
    if (mounted) {
      setState(() {
        isUpdatingCaptain = false;
      });
    }

    // Handle result
    if (result['ok'] == true) {
      // Update local state on success
      if (mounted) {
        setState(() {
          currentCaptain = newCaptain;
          currentViceCaptain = newViceCaptain;
          selectedCaptainRole = role;
        });
      }

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Captain updated successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
      }
    } else {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Failed to update captain'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  String _getTeamAbbr(FantasyPlayer player) {
    if (player.homeTeamName.isNotEmpty) {
      final words = player.homeTeamName.split(' ');
      if (words.length >= 2) {
        return words.map((w) => w[0]).take(2).join().toUpperCase();
      }
      return player.homeTeamName.substring(0, 2).toUpperCase();
    }
    return 'GT';
  }

  String _getOpponentAbbr(FantasyPlayer player) {
    if (player.awayTeamName.isNotEmpty) {
      final words = player.awayTeamName.split(' ');
      if (words.length >= 2) {
        return words.map((w) => w[0]).take(2).join().toUpperCase();
      }
      return player.awayTeamName.substring(0, 2).toUpperCase();
    }
    return 'MI';
  }

  String _getMatchTime(FantasyPlayer player) {
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

  String _getSlotDisplayName(String slot) {
    if (slot == 'bat1') return 'Batsman 1';
    if (slot == 'bat2') return 'Batsman 2';
    if (slot == 'wicket1') return 'Wicket-Keeper';
    if (slot == 'bowl1') return 'Bowler 1';
    if (slot == 'bowl2') return 'Bowler 2';
    if (slot == 'bowl3') return 'Bowler 3';
    if (slot == 'all1') return 'All-Rounder';
    if (slot == 'flex1') return 'Flex';
    return 'Position';
  }

  Widget _buildMoveToBenchCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.onSwap(widget.selectedSlot, 'bench');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black300, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(color: AppColors.black400, borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.event_seat, color: Colors.white70, size: 24),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Move to Bench',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text('Move player to next available bench slot', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.red200, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySlotCard(BuildContext context, String slot) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.onSwap(widget.selectedSlot, slot);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.black200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black300, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.black400,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.black500, width: 2, strokeAlign: BorderSide.strokeAlignInside),
              ),
              child: const Icon(Icons.add, color: Colors.white38, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Empty - ${_getSlotDisplayName(slot)}',
                    style: const TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  const Text('Move player to this position', style: TextStyle(color: Colors.white38, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.red200, size: 24),
          ],
        ),
      ),
    );
  }
}
