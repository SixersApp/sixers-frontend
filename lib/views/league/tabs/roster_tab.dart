import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_provider.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_position_rule_model.dart';
import 'package:sixers/backend/leagues/league_position_rule_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/league/components/player_roster_card.dart';
import 'package:sixers/views/league/components/team_selector.dart';
import 'package:sixers/views/league/components/manage_player_bottom_sheet.dart';

class RosterTab extends ConsumerWidget {
  const RosterTab({
    super.key,
    required this.league,
    required this.selectedTeamIndex,
    required this.selectedGameNum,
    required this.onTeamSelected,
    required this.onGameChanged,
  });

  final League league;
  final int selectedTeamIndex;
  final int selectedGameNum;
  final Function(int) onTeamSelected;
  final Function(int) onGameChanged;

  /// Converts RosterPlayerData to FantasyPlayer objects with zero stats
  List<FantasyPlayer> _extractPlayersFromInstance(FantasyTeamInstance fti) {
    if (fti.players == null) return [];

    final rosterPlayers = fti.players!;

    // Helper to convert RosterPlayerData to FantasyPlayer
    FantasyPlayer? convertPlayer(RosterPlayerData? playerData) {
      if (playerData == null) return null;
      return FantasyPlayer(
        playerSeasonId: playerData.id,
        playerId: playerData.id,
        name: playerData.playerName,
        fullName: playerData.fullName,
        playerImage: playerData.image,
        role: playerData.role,
        countryName: playerData.countryName,
        countryImage: playerData.countryImage,
        performanceId: '',
        // All stats default to 0 for weeks without performances
      );
    }

    // Extract all players from roster (enforcing 2 bat, 1 wk, 3 bowl, 1 all, 1 flex, bench)
    final allPlayers = [
      convertPlayer(rosterPlayers.bat1),
      convertPlayer(rosterPlayers.bat2),
      convertPlayer(rosterPlayers.wicket1),
      convertPlayer(rosterPlayers.bowl1),
      convertPlayer(rosterPlayers.bowl2),
      convertPlayer(rosterPlayers.bowl3),
      convertPlayer(rosterPlayers.all1),
      convertPlayer(rosterPlayers.flex1),
      convertPlayer(rosterPlayers.bench1),
      convertPlayer(rosterPlayers.bench2),
      convertPlayer(rosterPlayers.bench3),
      convertPlayer(rosterPlayers.bench4),
      convertPlayer(rosterPlayers.bench5),
      convertPlayer(rosterPlayers.bench6),
      convertPlayer(rosterPlayers.bench7),
      convertPlayer(rosterPlayers.bench8),
    ];

    // Filter out nulls
    return allPlayers.whereType<FantasyPlayer>().toList();
  }

  /// Merges roster data with performance data
  /// Performance data takes precedence, roster data provides base info for players without performances
  List<FantasyPlayer> _mergeRosterWithPerformances(List<FantasyPlayer> rosterPlayers, List<FantasyPlayer> performances) {
    // Create maps of performances by both player_season_id and player_id for flexible matching
    final performanceBySeasonId = <String, FantasyPlayer>{};
    final performanceByPlayerId = <String, FantasyPlayer>{};

    for (var perf in performances) {
      if (perf.playerSeasonId.isNotEmpty) {
        performanceBySeasonId[perf.playerSeasonId] = perf;
      }
      if (perf.playerId.isNotEmpty) {
        performanceByPlayerId[perf.playerId] = perf;
      }
    }

    // For each roster player, use performance data if available, otherwise use roster data
    final merged = rosterPlayers.map((rosterPlayer) {
      // Try to find performance by season ID first, then by player ID
      final performance = performanceBySeasonId[rosterPlayer.playerSeasonId] ?? performanceByPlayerId[rosterPlayer.playerId];

      if (performance != null) {
        // Performance data exists, use it (it has all the stats)
        return performance;
      } else {
        // No performance data, use roster data with zero stats
        return rosterPlayer;
      }
    }).toList();

    return merged;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instancesAsync = ref.watch(fantasyTeamInstancesProvider);

    return instancesAsync.when(
      data: (instances) {
        // Get all available match numbers and sort them
        final availableMatchNums = instances.map((i) => i.match_num).toList()..sort();

        if (availableMatchNums.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sports_cricket, color: Colors.grey, size: 48),
                const SizedBox(height: 16),
                const Text(
                  'No team instances found',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Get the specific instance for the selected game
        final fti = ref.read(fantasyTeamInstancesProvider.notifier).getInstanceByMatchNum(selectedGameNum);

        if (fti == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sports_cricket, color: Colors.grey, size: 48),
                const SizedBox(height: 16),
                Text(
                  'No team instance found for Game $selectedGameNum',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return _buildRosterView(context, ref, fti, availableMatchNums);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text('Error: $err', style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildRosterView(BuildContext context, WidgetRef ref, FantasyTeamInstance fti, List<int> availableMatchNums) {
    final performancesAsync = ref.watch(fantasyPlayerControllerProvider(fti.id));
    final positionRulesAsync = ref.watch(leaguePositionRulesProvider(league.id));

    // Extract base roster data from the team instance
    final baseRosterPlayers = _extractPlayersFromInstance(fti);

    return performancesAsync.when(
      data: (performances) {
        // Merge roster data with performance data
        final players = _mergeRosterWithPerformances(baseRosterPlayers, performances);

        return positionRulesAsync.when(
          data: (positionRules) => _buildRosterWithRules(context, fti, players, positionRules, availableMatchNums, ref: ref),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            // If position rules fail to load, fall back to hardcoded structure
            return _buildRosterFallback(context, fti, players, availableMatchNums, ref: ref);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        // If performances fail to load, use base roster data with zero stats
        return positionRulesAsync.when(
          data: (positionRules) => _buildRosterWithRules(context, fti, baseRosterPlayers, positionRules, availableMatchNums, ref: ref),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err2, stack2) => _buildRosterFallback(context, fti, baseRosterPlayers, availableMatchNums, ref: ref),
        );
      },
    );
  }

  Widget _buildRosterWithRules(
    BuildContext context,
    FantasyTeamInstance fti,
    List<FantasyPlayer> players,
    List<LeaguePositionRule> positionRules,
    List<int> availableMatchNums, {
    WidgetRef? ref,
  }) {
    // Create a map of players by their ID for easy lookup
    // Map both by playerSeasonId AND by playerId for flexible matching
    final playerMap = <String, FantasyPlayer>{};
    for (var p in players) {
      playerMap[p.playerSeasonId] = p;
      if (p.playerId.isNotEmpty && p.playerId != p.playerSeasonId) {
        playerMap[p.playerId] = p;
      }
    }

    // Use position rules as-is (no display order sorting needed)
    final sortedRules = List<LeaguePositionRule>.from(positionRules);

    // Validation state
    final validationErrors = <String>[];

    // Build sections and populate validation errors
    final sections = _buildGroupedSections(context, fti, playerMap, sortedRules, validationErrors, ref: ref);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Team selector
          TeamSelector(teams: league.teams, selectedIndex: selectedTeamIndex, onTeamSelected: onTeamSelected),
          const SizedBox(height: 20),

          // Validation errors section (shown at top)
          if (validationErrors.isNotEmpty) ...[_buildValidationErrors(validationErrors), const SizedBox(height: 24)],

          // Display the sections
          ...sections,
        ],
      ),
    );
  }

  Widget _buildRosterFallback(
    BuildContext context,
    FantasyTeamInstance fti,
    List<FantasyPlayer> players,
    List<int> availableMatchNums, {
    WidgetRef? ref,
  }) {
    // Fallback to hardcoded structure if position rules aren't available
    // Map both by playerSeasonId AND by playerId for flexible matching
    final playerMap = <String, FantasyPlayer>{};
    for (var p in players) {
      playerMap[p.playerSeasonId] = p;
      if (p.playerId.isNotEmpty && p.playerId != p.playerSeasonId) {
        playerMap[p.playerId] = p;
      }
    }

    if (fti.players == null) {
      return const Center(
        child: Text('No roster data available', style: TextStyle(color: Colors.white)),
      );
    }

    // Get slot info for each category
    final battingSlots = _getSlotInfoForCategory(fti, 'batting', playerMap);
    final bowlingSlots = _getSlotInfoForCategory(fti, 'bowling', playerMap);
    final wkSlots = _getSlotInfoForCategory(fti, 'wicket-keeper', playerMap);
    final allRounderSlots = _getSlotInfoForCategory(fti, 'all-rounder', playerMap);
    final flexSlots = _getSlotInfoForCategory(fti, 'flex', playerMap);
    final benchSlots = _getSlotInfoForCategory(fti, 'bench', playerMap);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TeamSelector(teams: league.teams, selectedIndex: selectedTeamIndex, onTeamSelected: onTeamSelected),
          const SizedBox(height: 20),
          _buildSectionWithRulesV2(context, 'BATTING', battingSlots, 2, 2, fti: fti, ref: ref),
          _buildSectionWithRulesV2(context, 'BOWLING', bowlingSlots, 3, 3, fti: fti, ref: ref),
          _buildSectionWithRulesV2(context, 'WICKET-KEEPER', wkSlots, 1, 1, fti: fti, ref: ref),
          _buildSectionWithRulesV2(context, 'ALL-ROUNDER', allRounderSlots, 1, 1, fti: fti, ref: ref),
          _buildSectionWithRulesV2(context, 'FLEX', flexSlots, 1, 1, fti: fti, ref: ref),
          _buildSectionWithRulesV2(context, 'BENCH', benchSlots, 8, 8, fti: fti, ref: ref),
        ],
      ),
    );
  }

  List<Widget> _buildGroupedSections(
    BuildContext context,
    FantasyTeamInstance fti,
    Map<String, FantasyPlayer> playerMap,
    List<LeaguePositionRule> rules,
    List<String> validationErrors, {
    WidgetRef? ref,
  }) {
    // Group position rules by category
    final Map<String, List<LeaguePositionRule>> groupedRules = {};

    for (var rule in rules) {
      if (rule.roleDetails.isEmpty) {
        continue;
      }

      final roleNames = rule.roleDetails.map((r) => r.name).toList();
      final category = _getCategoryFromRoleNames(roleNames);

      if (category.isEmpty) {
        continue;
      }

      groupedRules.putIfAbsent(category, () => []).add(rule);
    }

    // Validate captain and vice captain
    if (fti.captain == null || fti.captain!.isEmpty) {
      validationErrors.add('No captain selected');
    } else {
      // Check if captain is on bench
      final captainSlot = _findSlotForPlayer(fti, fti.captain!);
      if (captainSlot != null && captainSlot.startsWith('bench')) {
        validationErrors.add('Captain is on bench');
      }
    }

    if (fti.vice_captain == null || fti.vice_captain!.isEmpty) {
      validationErrors.add('No vice captain selected');
    } else {
      // Check if vice captain is on bench
      final viceCaptainSlot = _findSlotForPlayer(fti, fti.vice_captain!);
      if (viceCaptainSlot != null && viceCaptainSlot.startsWith('bench')) {
        validationErrors.add('Vice captain is on bench');
      }
    }

    // Validate EACH individual rule before building sections
    for (var category in groupedRules.keys) {
      final categoryRules = groupedRules[category]!;
      final playerIds = _getPlayerIdsForPosition(fti, category);
      final filledPlayers = playerIds.where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

      // Validate each rule individually
      for (var rule in categoryRules) {
        // Get the role names for this rule
        final ruleRoleNames = rule.roleDetails.map((r) => r.name.toLowerCase()).toSet();

        // Count how many filled players match this rule's roles
        // A player matches if their role is in the rule's eligible roles
        final matchingCount = filledPlayers.where((player) {
          final playerRole = player.role.toLowerCase();
          // Check if player's role matches any of the rule's roles
          return ruleRoleNames.any(
            (ruleName) => playerRole.contains(ruleName) || ruleName.contains(playerRole) || _rolesMatch(playerRole, ruleName),
          );
        }).length;

        if (matchingCount < rule.minCount) {
          // Create a readable error message
          final roleNames = rule.roleDetails.map((r) => r.name).join(" or ");
          validationErrors.add('$roleNames: $matchingCount/${rule.minCount} minimum required');
        }
      }
    }

    // Build sections in order: batting, bowling, wicket-keeper, all-rounder, flex, bench
    final List<Widget> sections = [];
    final orderedCategories = ['batting', 'bowling', 'wicket-keeper', 'all-rounder', 'flex', 'bench'];

    for (var category in orderedCategories) {
      // Always render the main sections (batting, bowling, all-rounder, bench)
      final categoryRules = groupedRules[category] ?? [];

      // Combine min/max from all rules in this category (defaults to 0 if no rules)
      final totalMin = categoryRules.isEmpty ? 0 : categoryRules.fold<int>(0, (sum, rule) => sum + rule.minCount);
      final totalMax = categoryRules.isEmpty ? 0 : categoryRules.fold<int>(0, (sum, rule) => sum + rule.maxCount);

      // Get players from FTI slots for this category
      final slotInfo = _getSlotInfoForCategory(fti, category, playerMap);

      // Determine display title
      String sectionTitle;
      switch (category) {
        case 'batting':
          sectionTitle = 'BATTING';
          break;
        case 'wicket-keeper':
          sectionTitle = 'WICKET-KEEPER';
          break;
        case 'bowling':
          sectionTitle = 'BOWLING';
          break;
        case 'all-rounder':
          sectionTitle = 'ALL-ROUNDER';
          break;
        case 'flex':
          sectionTitle = 'FLEX';
          break;
        case 'bench':
          sectionTitle = 'BENCH';
          break;
        default:
          sectionTitle = category.toUpperCase();
      }

      sections.add(
        Column(
          children: [
            _buildSectionWithRulesV2(
              context,
              sectionTitle,
              slotInfo,
              totalMin,
              totalMax,
              fti: fti,
              ref: ref,
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }

    return sections;
  }

  bool _rolesMatch(String playerRole, String ruleName) {
    final normalizedPlayerRole = playerRole.toLowerCase().trim();
    final normalizedRuleName = ruleName.toLowerCase().trim();

    if (normalizedPlayerRole == normalizedRuleName) return true;

    if (normalizedPlayerRole == 'batsman' && (normalizedRuleName.contains('bat') || normalizedRuleName.contains('batter'))) {
      return true;
    }
    if (normalizedPlayerRole == 'bowler' && normalizedRuleName.contains('bowl')) {
      return true;
    }
    if ((normalizedPlayerRole.contains('wicket') || normalizedPlayerRole.contains('keeper')) &&
        (normalizedRuleName.contains('wicket') || normalizedRuleName.contains('keeper'))) {
      return true;
    }

    return false;
  }

  List<({String slot, FantasyPlayer? player})> _getSlotInfoForCategory(
    FantasyTeamInstance fti,
    String category,
    Map<String, FantasyPlayer> playerMap,
  ) {
    if (fti.players == null) return [];

    final players = fti.players!;
    final slotInfo = <({String slot, FantasyPlayer? player})>[];

    switch (category) {
      case 'batting':
        slotInfo.add((slot: 'bat1', player: players.bat1?.id != null ? playerMap[players.bat1!.id] : null));
        slotInfo.add((slot: 'bat2', player: players.bat2?.id != null ? playerMap[players.bat2!.id] : null));
        break;
      case 'bowling':
        slotInfo.add((slot: 'bowl1', player: players.bowl1?.id != null ? playerMap[players.bowl1!.id] : null));
        slotInfo.add((slot: 'bowl2', player: players.bowl2?.id != null ? playerMap[players.bowl2!.id] : null));
        slotInfo.add((slot: 'bowl3', player: players.bowl3?.id != null ? playerMap[players.bowl3!.id] : null));
        break;
      case 'wicket-keeper':
        slotInfo.add((slot: 'wicket1', player: players.wicket1?.id != null ? playerMap[players.wicket1!.id] : null));
        break;
      case 'all-rounder':
        slotInfo.add((slot: 'all1', player: players.all1?.id != null ? playerMap[players.all1!.id] : null));
        break;
      case 'flex':
        slotInfo.add((slot: 'flex1', player: players.flex1?.id != null ? playerMap[players.flex1!.id] : null));
        break;
      case 'bench':
        slotInfo.add((slot: 'bench1', player: players.bench1?.id != null ? playerMap[players.bench1!.id] : null));
        slotInfo.add((slot: 'bench2', player: players.bench2?.id != null ? playerMap[players.bench2!.id] : null));
        slotInfo.add((slot: 'bench3', player: players.bench3?.id != null ? playerMap[players.bench3!.id] : null));
        slotInfo.add((slot: 'bench4', player: players.bench4?.id != null ? playerMap[players.bench4!.id] : null));
        slotInfo.add((slot: 'bench5', player: players.bench5?.id != null ? playerMap[players.bench5!.id] : null));
        slotInfo.add((slot: 'bench6', player: players.bench6?.id != null ? playerMap[players.bench6!.id] : null));
        slotInfo.add((slot: 'bench7', player: players.bench7?.id != null ? playerMap[players.bench7!.id] : null));
        slotInfo.add((slot: 'bench8', player: players.bench8?.id != null ? playerMap[players.bench8!.id] : null));
        break;
    }

    return slotInfo;
  }

  String _getCategoryFromRoleNames(List<String> roleNames) {
    final lowerNames = roleNames.map((r) => r.toLowerCase()).toList();

    // Wicket-Keepers get their own section
    if (lowerNames.any((r) => r.contains('wicket') || r.contains('keeper'))) {
      return 'wicket-keeper';
    }
    // Batsmen
    if (lowerNames.any(
      (r) => r.contains('bat') || r == 'batsman',
    )) {
      return 'batting';
    }
    // Bowlers
    if (lowerNames.any((r) => r.contains('bowl') || r == 'bowler')) {
      return 'bowling';
    }
    if (lowerNames.any((r) => r == 'flex')) {
      return 'flex';
    }
    if (lowerNames.any((r) => r == 'bench')) {
      return 'bench';
    }
    return '';
  }

  List<String?> _getPlayerIdsForPosition(FantasyTeamInstance fti, String category) {
    if (fti.players == null) return [];

    final players = fti.players!;

    switch (category) {
      case 'batting':
        return [players.bat1?.id, players.bat2?.id];
      case 'wicket-keeper':
        return [players.wicket1?.id];
      case 'bowling':
        return [players.bowl1?.id, players.bowl2?.id, players.bowl3?.id];
      case 'all-rounder':
        return [players.all1?.id];
      case 'flex':
        return [players.flex1?.id];
      case 'bench':
        return [
          players.bench1?.id,
          players.bench2?.id,
          players.bench3?.id,
          players.bench4?.id,
          players.bench5?.id,
          players.bench6?.id,
          players.bench7?.id,
          players.bench8?.id,
        ];
      default:
        return [];
    }
  }


  Widget _buildSectionWithRulesV2(
    BuildContext context,
    String title,
    List<({String slot, FantasyPlayer? player})> slotInfo,
    int minRequired,
    int maxAllowed, {
    FantasyTeamInstance? fti,
    WidgetRef? ref,
  }) {
    // For bench, only show filled slots
    final isBenchSection = title == 'BENCH';
    final slotsToShow = isBenchSection ? slotInfo.where((s) => s.player != null).toList() : slotInfo;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionIcon(title),
              const SizedBox(width: 8),
              Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),
          // Show slots (filled or empty)
          ...slotsToShow.map((slotData) {
            if (slotData.player != null) {
              // Filled slot
              return PlayerRosterCard(
                player: slotData.player!,
                slot: slotData.slot,
                onTap: fti != null && ref != null ? () => _showManagePlayerSheet(context, ref, fti, slotData.player!, slotData.slot) : null,
                captainId: fti?.captain,
                viceCaptainId: fti?.vice_captain,
              );
            } else {
              // Empty slot
              return _buildEmptySlotCard(context, ref, fti, slotData.slot, title);
            }
          }),
        ],
      ),
    );
  }

  Widget _buildEmptySlotCard(
    BuildContext context,
    WidgetRef? ref,
    FantasyTeamInstance? fti,
    String slot,
    String sectionTitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.black300, width: 1, strokeAlign: BorderSide.strokeAlignInside),
      ),
      child: Row(
        children: [
          // Empty avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black400,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.black500, width: 2, strokeAlign: BorderSide.strokeAlignInside),
            ),
            child: const Icon(
              Icons.person_add,
              color: Colors.white38,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          // Empty info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Empty Slot',
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tap a bench player to fill this position',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _showManagePlayerSheet(
    BuildContext context,
    WidgetRef ref,
    FantasyTeamInstance fti,
    FantasyPlayer selectedPlayer,
    String selectedSlot,
  ) {
    // Get all players from the roster
    final allPlayers = _extractPlayersFromInstance(fti);
    final playerMap = <String, FantasyPlayer>{};
    for (var p in allPlayers) {
      playerMap[p.playerSeasonId] = p;
      if (p.playerId.isNotEmpty && p.playerId != p.playerSeasonId) {
        playerMap[p.playerId] = p;
      }
    }

    // Determine available players for swapping based on role compatibility
    final availablePlayers = <({FantasyPlayer? player, String slot})>[];

    // Determine eligible slots for the selected player based on their role
    final eligibleSlots = _getEligibleSlotsForPlayer(selectedPlayer, selectedSlot);

    // Add all players from eligible slots (except the current slot)
    for (final slot in eligibleSlots) {
      if (slot == selectedSlot) continue; // Skip the current slot

      final playerId = _getPlayerIdForSlot(fti, slot);

      // Handle empty slots
      if (playerId == null || !playerMap.containsKey(playerId)) {
        // Only show empty active slots (not empty bench slots individually)
        if (!slot.startsWith('bench')) {
          availablePlayers.add((player: null, slot: slot));
        }
        continue;
      }

      final player = playerMap[playerId]!;

      // Check role compatibility for bench slots
      if (slot.startsWith('bench')) {
        if (!_isRoleCompatible(selectedPlayer, player)) {
          continue; // Skip incompatible roles
        }
      }

      // Only allow swap if the player hasn't played yet (performanceId is empty)
      if (player.performanceId.isEmpty) {
        availablePlayers.add((player: player, slot: slot));
      }
    }

    // Add "Move to Bench" option if current slot is not bench
    final hasEmptyBenchSlot = _getNextAvailableBenchSlot(fti) != null;
    final showMoveToBench = !selectedSlot.startsWith('bench') && hasEmptyBenchSlot;

    // Capture the parent context for use in the callbacks
    final parentContext = context;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ManagePlayerBottomSheet(
        selectedPlayer: selectedPlayer,
        selectedSlot: selectedSlot,
        availablePlayers: availablePlayers,
        showMoveToBench: showMoveToBench,
        currentCaptain: fti.captain,
        currentViceCaptain: fti.vice_captain,
        onCaptainChange: (captain, viceCaptain) async {
          // Call the API to update captain/vice captain
          final result = await ref.read(fantasyTeamInstancesProvider.notifier).updateCaptains(
                ftiId: fti.id,
                captain: captain,
                viceCaptain: viceCaptain,
              );
          return result;
        },
        onSwap: (slot1, slot2) async {
          // Handle "Move to Bench" special case
          String targetSlot = slot2;
          if (slot2 == 'bench') {
            final nextBenchSlot = _getNextAvailableBenchSlot(fti);
            if (nextBenchSlot == null) {
              ScaffoldMessenger.of(parentContext).showSnackBar(
                const SnackBar(
                  content: Text('No available bench slots'),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }
            targetSlot = nextBenchSlot;
          }

          // Show loading indicator using parent context
          showDialog(
            context: parentContext,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );

          // Call the swap API
          final result = await ref.read(fantasyTeamInstancesProvider.notifier).swapSlots(
                ftiId: fti.id,
                slot1: slot1,
                slot2: targetSlot,
              );

          // Close loading indicator using parent context
          if (parentContext.mounted) Navigator.pop(parentContext);

          // Show result message using parent context
          if (parentContext.mounted) {
            ScaffoldMessenger.of(parentContext).showSnackBar(
              SnackBar(
                content: Text(
                  result['ok'] == true ? 'Players swapped successfully!' : result['message'] ?? 'Failed to swap players',
                ),
                backgroundColor: result['ok'] == true ? Colors.green : Colors.red,
              ),
            );
          }
        },
      ),
    );
  }

  String? _getPlayerIdForSlot(FantasyTeamInstance fti, String slot) {
    if (fti.players == null) return null;
    final players = fti.players!;

    switch (slot) {
      case 'bat1':
        return players.bat1?.id;
      case 'bat2':
        return players.bat2?.id;
      case 'wicket1':
        return players.wicket1?.id;
      case 'bowl1':
        return players.bowl1?.id;
      case 'bowl2':
        return players.bowl2?.id;
      case 'bowl3':
        return players.bowl3?.id;
      case 'all1':
        return players.all1?.id;
      case 'flex1':
        return players.flex1?.id;
      case 'bench1':
        return players.bench1?.id;
      case 'bench2':
        return players.bench2?.id;
      case 'bench3':
        return players.bench3?.id;
      case 'bench4':
        return players.bench4?.id;
      case 'bench5':
        return players.bench5?.id;
      case 'bench6':
        return players.bench6?.id;
      case 'bench7':
        return players.bench7?.id;
      case 'bench8':
        return players.bench8?.id;
      default:
        return null;
    }
  }

  List<String> _getEligibleSlotsForPlayer(FantasyPlayer player, String currentSlot) {
    final role = player.role.toLowerCase();
    final isWicketKeeper = role.contains('wicket') || role.contains('keeper');
    final isBatsman = role.contains('bat');
    final isBowler = role.contains('bowl');

    final eligibleSlots = <String>[];
    final isBenchSlot = currentSlot.startsWith('bench');

    if (!isBenchSlot) {
      eligibleSlots.addAll(['bench1', 'bench2', 'bench3', 'bench4', 'bench5', 'bench6', 'bench7', 'bench8']);
    }

    final isAllRounder = role.contains('allrounder') || role.contains('all-rounder') || role.contains('all rounder');

    // Wicket-keepers can go in wicket1, bat1, bat2, flex1
    if (isWicketKeeper) {
      eligibleSlots.addAll(['wicket1', 'bat1', 'bat2', 'flex1']);
    }

    // Batsmen can go in bat1, bat2, flex1 (NOT wicket1)
    if (isBatsman) {
      eligibleSlots.addAll(['bat1', 'bat2', 'flex1']);
    }

    // Bowlers can go in bowl1, bowl2, bowl3, flex1
    if (isBowler) {
      eligibleSlots.addAll(['bowl1', 'bowl2', 'bowl3', 'flex1']);
    }

    // All-rounders can go in all1, flex1
    if (isAllRounder) {
      eligibleSlots.addAll(['all1', 'flex1']);
    }

    return eligibleSlots;
  }

  bool _isRoleCompatible(FantasyPlayer player1, FantasyPlayer player2) {
    final role1 = player1.role.toLowerCase();
    final role2 = player2.role.toLowerCase();

    final isWK1 = role1.contains('wicket') || role1.contains('keeper');
    final isBatsman1 = role1.contains('bat') || isWK1;
    final isBowler1 = role1.contains('bowl');

    final isWK2 = role2.contains('wicket') || role2.contains('keeper');
    final isBatsman2 = role2.contains('bat') || isWK2;
    final isBowler2 = role2.contains('bowl');

    if (isBatsman1 && isBatsman2) return true;
    if (isBowler1 && isBowler2) return true;

    return false;
  }

  String? _getNextAvailableBenchSlot(FantasyTeamInstance fti) {
    final benchSlots = ['bench1', 'bench2', 'bench3', 'bench4', 'bench5', 'bench6', 'bench7', 'bench8'];
    for (final slot in benchSlots) {
      final playerId = _getPlayerIdForSlot(fti, slot);
      if (playerId == null) {
        return slot;
      }
    }
    return null; // All bench slots are full
  }

  String? _findSlotForPlayer(FantasyTeamInstance fti, String playerId) {
    if (fti.players == null) return null;
    final players = fti.players!;

    final allSlots = {
      'bat1': players.bat1?.id,
      'bat2': players.bat2?.id,
      'bowl1': players.bowl1?.id,
      'bowl2': players.bowl2?.id,
      'bowl3': players.bowl3?.id,
      'wicket1': players.wicket1?.id,
      'all1': players.all1?.id,
      'flex1': players.flex1?.id,
      'bench1': players.bench1?.id,
      'bench2': players.bench2?.id,
      'bench3': players.bench3?.id,
      'bench4': players.bench4?.id,
      'bench5': players.bench5?.id,
      'bench6': players.bench6?.id,
      'bench7': players.bench7?.id,
      'bench8': players.bench8?.id,
    };

    for (final entry in allSlots.entries) {
      if (entry.value == playerId) {
        return entry.key;
      }
    }

    return null;
  }

  Widget _buildValidationErrors(List<String> errors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade900.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade800, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red.shade400, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Roster Incomplete',
                  style: TextStyle(color: Colors.red.shade400, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...errors.map(
              (error) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(Icons.circle, color: Colors.red.shade400, size: 6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(error, style: TextStyle(color: Colors.red.shade300, fontSize: 12), softWrap: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionIcon(String title) {
    switch (title) {
      case 'BATTING':
        return Icon(PhosphorIcons.cricket(), color: AppColors.black800, size: 20);
      case 'BOWLING':
        return Icon(PhosphorIcons.boules(), color: AppColors.black800, size: 20);
      case 'ALL-ROUNDER':
      case 'ALL-ROUNDERS':
        return Icon(PhosphorIcons.personSimpleThrow(), color: AppColors.black800, size: 20);
      case 'WICKET-KEEPER':
      case 'WICKET-KEEPERS':
        return Icon(PhosphorIcons.handsClapping(), color: AppColors.black800, size: 20);
      case 'FLEX':
        return Icon(PhosphorIcons.shuffleAngular(), color: AppColors.black800, size: 20);
      case 'BENCH':
      default:
        return Icon(PhosphorIcons.users(), color: AppColors.black800, size: 20);
    }
  }
}
