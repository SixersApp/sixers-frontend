import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          data: (positionRules) => _buildRosterWithRules(context, fti, players, positionRules, availableMatchNums),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            // If position rules fail to load, fall back to hardcoded structure
            return _buildRosterFallback(context, fti, players, availableMatchNums);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        // If performances fail to load, use base roster data with zero stats
        return positionRulesAsync.when(
          data: (positionRules) => _buildRosterWithRules(context, fti, baseRosterPlayers, positionRules, availableMatchNums),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err2, stack2) => _buildRosterFallback(context, fti, baseRosterPlayers, availableMatchNums),
        );
      },
    );
  }

  Widget _buildRosterWithRules(
    BuildContext context,
    FantasyTeamInstance fti,
    List<FantasyPlayer> players,
    List<LeaguePositionRule> positionRules,
    List<int> availableMatchNums,
  ) {
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
    final sections = _buildGroupedSections(context, fti, playerMap, sortedRules, validationErrors);

    // Find current position in available match nums
    final currentIndex = availableMatchNums.indexOf(selectedGameNum);
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < availableMatchNums.length - 1;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Team selector
          TeamSelector(teams: league.teams, selectedIndex: selectedTeamIndex, onTeamSelected: onTeamSelected),
          const SizedBox(height: 16),

          // Game selector
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.black200),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: hasPrevious ? () => onGameChanged(availableMatchNums[currentIndex - 1]) : null,
                  color: hasPrevious ? Colors.white : Colors.grey.shade600,
                ),
                Text(
                  'Game $selectedGameNum',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: hasNext ? () => onGameChanged(availableMatchNums[currentIndex + 1]) : null,
                  color: hasNext ? Colors.white : Colors.grey.shade600,
                ),
              ],
            ),
          ),
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
    List<int> availableMatchNums,
  ) {
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

    final rosterPlayers = fti.players!;

    final batsmen = [
      rosterPlayers.bat1?.id,
      rosterPlayers.bat2?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    final wicketKeepers = [
      rosterPlayers.wicket1?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    final bowlers = [
      rosterPlayers.bowl1?.id,
      rosterPlayers.bowl2?.id,
      rosterPlayers.bowl3?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    final allRounders = [
      rosterPlayers.all1?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    final flex = [
      rosterPlayers.flex1?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    final bench = [
      rosterPlayers.bench1?.id,
      rosterPlayers.bench2?.id,
      rosterPlayers.bench3?.id,
      rosterPlayers.bench4?.id,
      rosterPlayers.bench5?.id,
      rosterPlayers.bench6?.id,
      rosterPlayers.bench7?.id,
      rosterPlayers.bench8?.id,
    ].where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

    // Find current position in available match nums
    final currentIndex = availableMatchNums.indexOf(selectedGameNum);
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < availableMatchNums.length - 1;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TeamSelector(teams: league.teams, selectedIndex: selectedTeamIndex, onTeamSelected: onTeamSelected),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.black200),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: hasPrevious ? () => onGameChanged(availableMatchNums[currentIndex - 1]) : null,
                  color: hasPrevious ? Colors.white : Colors.grey.shade600,
                ),
                Text(
                  'Game $selectedGameNum',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: hasNext ? () => onGameChanged(availableMatchNums[currentIndex + 1]) : null,
                  color: hasNext ? Colors.white : Colors.grey.shade600,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionWithRules(context, 'BATTING', batsmen, 2, 2, 2),
          const SizedBox(height: 24),
          _buildSectionWithRules(context, 'WICKET-KEEPERS', wicketKeepers, 1, 1, 1),
          const SizedBox(height: 24),
          _buildSectionWithRules(context, 'BOWLING', bowlers, 3, 3, 3),
          const SizedBox(height: 24),
          _buildSectionWithRules(context, 'ALL-ROUNDERS', allRounders, 1, 1, 1),
          const SizedBox(height: 24),
          _buildSectionWithRules(context, 'FLEX', flex, 1, 1, 1),
          const SizedBox(height: 24),
          _buildSectionWithRules(context, 'BENCH', bench, 8, 8, 8),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  List<Widget> _buildGroupedSections(
    BuildContext context,
    FantasyTeamInstance fti,
    Map<String, FantasyPlayer> playerMap,
    List<LeaguePositionRule> rules,
    List<String> validationErrors,
  ) {
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

    // Build sections in order: batting, wicket-keeper, bowling, all-rounder, flex, bench
    final List<Widget> sections = [];
    final orderedCategories = ['batting', 'wicket-keeper', 'bowling', 'all-rounder', 'flex', 'bench'];

    for (var category in orderedCategories) {
      // Always render the main sections (batting, bowling, all-rounder, bench)
      final categoryRules = groupedRules[category] ?? [];

      // Combine min/max from all rules in this category (defaults to 0 if no rules)
      final totalMin = categoryRules.isEmpty ? 0 : categoryRules.fold<int>(0, (sum, rule) => sum + rule.minCount);
      final totalMax = categoryRules.isEmpty ? 0 : categoryRules.fold<int>(0, (sum, rule) => sum + rule.maxCount);

      // Get players from FTI slots for this category
      final playerIds = _getPlayerIdsForPosition(fti, category);

      final filledPlayers = playerIds.where((id) => id != null && playerMap.containsKey(id)).map((id) => playerMap[id]!).toList();

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
            _buildSectionWithRules(
              context,
              sectionTitle,
              filledPlayers,
              totalMin,
              totalMax,
              playerIds.length, // Use actual slot count
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    }

    return sections;
  }

  bool _rolesMatch(String playerRole, String ruleName) {
    // Helper to check if a player's role matches a rule's role name
    final normalizedPlayerRole = playerRole.toLowerCase().trim();
    final normalizedRuleName = ruleName.toLowerCase().trim();

    // Direct match
    if (normalizedPlayerRole == normalizedRuleName) return true;

    // Common variations
    if (normalizedPlayerRole == 'batsman' && (normalizedRuleName.contains('bat') || normalizedRuleName.contains('batter'))) {
      return true;
    }
    if (normalizedPlayerRole == 'bowler' && normalizedRuleName.contains('bowl')) {
      return true;
    }
    if ((normalizedPlayerRole.contains('allrounder') || normalizedPlayerRole.contains('all-rounder')) &&
        (normalizedRuleName.contains('allrounder') || normalizedRuleName.contains('all-rounder'))) {
      return true;
    }
    if ((normalizedPlayerRole.contains('wicket') || normalizedPlayerRole.contains('keeper')) &&
        (normalizedRuleName.contains('wicket') || normalizedRuleName.contains('keeper'))) {
      return true;
    }

    return false;
  }

  String _getCategoryFromRoleNames(List<String> roleNames) {
    final lowerNames = roleNames.map((r) => r.toLowerCase()).toList();

    // Categorize based on the PRIMARY role type
    // "Batting Allrounder" → batting (not all-rounder)
    // "Bowling Allrounder" → bowling (not all-rounder)
    // "Wicket Keeper" → batting (wicket-keepers can be placed in batting slots)

    // Check for batting-related roles (includes wicket-keepers)
    if (lowerNames.any(
      (r) => r.contains('bat') || r == 'batsman' || r.contains('order batter') || r.contains('wicket') || r.contains('keeper'),
    )) {
      return 'batting';
    }
    // Check for bowling-related roles
    else if (lowerNames.any((r) => r.contains('bowl') || r == 'bowler')) {
      return 'bowling';
    }
    // Check for pure all-rounders (not batting/bowling allrounder)
    else if (lowerNames.any(
      (r) =>
          (r.contains('allrounder') || r.contains('all-rounder') || r.contains('all rounder')) &&
          !r.contains('bat') &&
          !r.contains('bowl'),
    )) {
      return 'all-rounder';
    } else if (lowerNames.any((r) => r == 'flex')) {
      return 'flex';
    } else if (lowerNames.any((r) => r == 'bench')) {
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

  Widget _buildSectionWithRules(
    BuildContext context,
    String title,
    List<FantasyPlayer> players,
    int minRequired,
    int maxAllowed,
    int totalSlots,
  ) {
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
          // Only show filled player slots
          ...players.map((player) => PlayerRosterCard(player: player)),
        ],
      ),
    );
  }

  Widget _buildValidationErrors(List<String> errors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade900.withOpacity(0.2),
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
    String? iconPath;
    switch (title) {
      case 'BATTING':
        iconPath = 'assets/images/player_icons/Batsmen.png';
        break;
      case 'BOWLING':
        iconPath = 'assets/images/player_icons/Bowler.png';
        break;
      case 'ALL-ROUNDER':
      case 'ALL-ROUNDERS':
        iconPath = 'assets/images/player_icons/AllRounder.png';
        break;
      case 'WICKET-KEEPER':
      case 'WICKET-KEEPERS':
        iconPath = 'assets/images/player_icons/Batsmen.png'; // Using Batsmen as placeholder
        break;
      case 'BENCH':
      case 'FLEX':
      default:
        return const Icon(Icons.people, color: Colors.white, size: 20);
    }

    return Image.asset(iconPath, width: 20, height: 20, fit: BoxFit.contain);
  }
}
