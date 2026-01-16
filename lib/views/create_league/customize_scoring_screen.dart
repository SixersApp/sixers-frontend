import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/create_league/create_team_screen.dart';

class CustomizeScoringScreen extends ConsumerStatefulWidget {
  static const String route = '/customize-scoring';

  final Map<String, dynamic> leagueData;

  const CustomizeScoringScreen({super.key, required this.leagueData});

  @override
  ConsumerState<CustomizeScoringScreen> createState() =>
      _CustomizeScoringScreenState();
}

class _CustomizeScoringScreenState
    extends ConsumerState<CustomizeScoringScreen> {
  final _leagueService = LeagueService();
  final Map<String, TextEditingController> _controllers = {};
  bool _isLoading = true;
  List<LeagueScoringRule> _scoringRules = [];

  @override
  void initState() {
    super.initState();
    _loadDefaultScoringRules();
  }

  Future<void> _loadDefaultScoringRules() async {
    // Check if scoring rules were passed from the previous screen
    final passedRules =
        widget.leagueData['scoringRules'] as List<LeagueScoringRule>?;
    if (passedRules != null && passedRules.isNotEmpty) {
      logInfo('Using ${passedRules.length} passed scoring rules');
      if (mounted) {
        setState(() {
          _scoringRules = passedRules;
          _isLoading = false;
          _initializeControllers();
        });
      }
      return;
    }

    try {
      logInfo('Loading default scoring rules...');
      final rules = await _leagueService.getDefaultScoringRules();
      logInfo('Loaded ${rules.length} scoring rules');
      if (rules.isNotEmpty) {
        logInfo(
          'Categories: ${rules.map((r) => r.category).toSet().join(', ')}',
        );
      }
      if (mounted) {
        setState(() {
          _scoringRules = rules;
          _isLoading = false;
          _initializeControllers();
        });
      }
    } catch (e, st) {
      logError('Failed to load scoring rules: $e', st);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _initializeControllers() {
    for (var rule in _scoringRules) {
      if (rule.mode == RuleMode.band) {
        // For band rules, create controllers for left bound, right bound, and points
        final baseKey = _getRuleKey(rule);
        final (left, right, isOpenEnded) = _parseBand(rule.band);
        logInfo(
          'Band rule: ${rule.stat}, band="${rule.band}", parsed: left="$left", right="$right", isOpenEnded=$isOpenEnded, flatPoints=${rule.flatPoints}',
        );
        _controllers['${baseKey}_left'] = TextEditingController(text: left);
        if (!isOpenEnded) {
          _controllers['${baseKey}_right'] = TextEditingController(text: right);
        }
        _controllers['${baseKey}_points'] = TextEditingController(
          text: (rule.flatPoints ?? 0.0).toString(),
        );
      } else {
        final key = _getRuleKey(rule);
        final value = _getRuleValue(rule);
        _controllers[key] = TextEditingController(text: value.toString());
      }
    }
  }

  (String, String, bool) _parseBand(String? band) {
    if (band == null || band.isEmpty) return ('', '', false);

    // Handle mathematical interval notation like "[2.5,3.5)", "(0,30]", "[140,)"
    final intervalMatch = RegExp(
      r'^[\[\(]([0-9.]*),([0-9.]*)[\]\)]$',
    ).firstMatch(band);
    if (intervalMatch != null) {
      final left = intervalMatch.group(1) ?? '';
      final right = intervalMatch.group(2) ?? '';
      final isOpenEnded = right.isEmpty;
      return (left, right, isOpenEnded);
    }

    // Handle simple formats like "140+", "9+"
    if (band.endsWith('+')) {
      final left = band.substring(0, band.length - 1);
      return (left, '', true);
    }

    // Handle range formats like "0-30", "2.5-3.5"
    final dashMatch = RegExp(r'^([0-9.]+)-([0-9.]+)$').firstMatch(band);
    if (dashMatch != null) {
      return (dashMatch.group(1)!, dashMatch.group(2)!, false);
    }

    return (band, '', false);
  }

  String _getRuleKey(LeagueScoringRule rule) {
    // For band rules, include the band in the key to make it unique
    if (rule.mode == RuleMode.band && rule.band != null) {
      return '${rule.category}_${rule.stat}_${rule.band}';
    }
    return '${rule.category}_${rule.stat}_${rule.mode.name}';
  }

  num _getRuleValue(LeagueScoringRule rule) {
    return rule.perUnitPoints ??
        rule.flatPoints ??
        rule.threshold?.toDouble() ??
        rule.multiplier ??
        0.0;
  }

  String _formatStatLabel(String stat) {
    // Convert snake_case to Title Case
    return stat
        .split('_')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : '',
        )
        .join(' ');
  }

  String _formatCategoryLabel(String category) {
    return category[0].toUpperCase() + category.substring(1);
  }

  Map<String, List<LeagueScoringRule>> _groupRulesByCategory() {
    final grouped = <String, List<LeagueScoringRule>>{};
    for (var rule in _scoringRules) {
      grouped.putIfAbsent(rule.category, () => []).add(rule);
    }
    return grouped;
  }

  List<Widget> _buildDynamicScoringSections() {
    final grouped = _groupRulesByCategory();
    final widgets = <Widget>[];

    // Define preferred category order
    const categoryOrder = ['leadership', 'fielding', 'batting', 'bowling'];

    // Sort categories by preferred order, unknown categories go to end
    final sortedCategories = grouped.keys.toList()
      ..sort((a, b) {
        final aIndex = categoryOrder.indexOf(a);
        final bIndex = categoryOrder.indexOf(b);
        if (aIndex == -1 && bIndex == -1) return a.compareTo(b);
        if (aIndex == -1) return 1;
        if (bIndex == -1) return -1;
        return aIndex.compareTo(bIndex);
      });

    for (var category in sortedCategories) {
      final rules = grouped[category]!;

      // Category header
      widgets.add(
        Text(
          _formatCategoryLabel(category),
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: AppColors.black600),
        ),
      );
      widgets.add(const SizedBox(height: 8));

      // Separate band rules from regular rules
      final bandRules = rules.where((r) => r.mode == RuleMode.band).toList();
      final regularRules = rules.where((r) => r.mode != RuleMode.band).toList();

      // Build fields for regular rules
      for (var rule in regularRules) {
        final key = _getRuleKey(rule);
        final label = _formatStatLabel(rule.stat);
        widgets.add(_buildScoringField(label, key));
      }

      // Group band rules by stat type (e.g., strike_rate, economy)
      if (bandRules.isNotEmpty) {
        final bandGroups = <String, List<LeagueScoringRule>>{};
        for (var rule in bandRules) {
          // Extract the base stat name (e.g., "strike_rate" from "strike_rate_0_30")
          final statParts = rule.stat.split('_');
          String baseStat;
          if (rule.stat.contains('strike_rate')) {
            baseStat = 'strike_rate';
          } else if (rule.stat.contains('economy')) {
            baseStat = 'economy';
          } else {
            baseStat = statParts.take(2).join('_');
          }
          bandGroups.putIfAbsent(baseStat, () => []).add(rule);
        }

        for (var entry in bandGroups.entries) {
          widgets.add(const SizedBox(height: 12));
          widgets.add(
            Text(
              _formatStatLabel(entry.key),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.black800),
            ),
          );
          widgets.add(const SizedBox(height: 8));

          // Sort band rules by left bound ascending
          final sortedRules = entry.value.toList()
            ..sort((a, b) {
              final (leftA, _, _) = _parseBand(a.band);
              final (leftB, _, _) = _parseBand(b.band);
              final numA = double.tryParse(leftA) ?? 0;
              final numB = double.tryParse(leftB) ?? 0;
              return numA.compareTo(numB);
            });

          for (var rule in sortedRules) {
            widgets.add(_buildBandField(rule));
          }
        }
      }

      widgets.add(const SizedBox(height: 18));
    }

    return widgets;
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  List<LeagueScoringRule> _getCurrentRules() {
    return _scoringRules.map((rule) {
      final baseKey = _getRuleKey(rule);

      if (rule.mode == RuleMode.band) {
        final leftController = _controllers['${baseKey}_left'];
        final rightController = _controllers['${baseKey}_right'];
        final pointsController = _controllers['${baseKey}_points'];

        final left = leftController?.text ?? '';
        final points = double.tryParse(pointsController?.text ?? '0') ?? 0.0;

        String newBand;
        if (rightController == null) {
          newBand = '[$left,)';
        } else {
          final right = rightController.text;
          newBand = '[$left,$right)';
        }

        return rule.copyWith(band: newBand, flatPoints: points);
      } else {
        final controller = _controllers[baseKey];
        if (controller != null) {
          final value = double.tryParse(controller.text) ?? 0.0;
          return rule.copyWith(
            perUnitPoints: rule.mode == RuleMode.per_unit ? value : null,
            flatPoints: rule.mode == RuleMode.flat ? value : null,
            threshold: rule.mode == RuleMode.threshold ? value.toInt() : null,
            multiplier: rule.mode == RuleMode.multiplier ? value : null,
          );
        }
      }
      return rule;
    }).toList();
  }

  void _goBack() {
    final updatedRules = _getCurrentRules();
    context.pop(updatedRules);
  }

  void _navigateToCreateTeam() {
    final updatedRules = _getCurrentRules();

    context.push(
      CreateTeamScreen.route,
      extra: {
        'leagueName': widget.leagueData['leagueName']!,
        'tournamentId': widget.leagueData['tournamentId']!,
        'scoringRules': updatedRules,
      },
    );
  }

  Widget _buildScoringField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.black800),
            ),
          ),
          Container(
            width: 66,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.black200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.black400),
            ),
            child: Center(
              child: TextField(
                controller: _controllers[key],
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.transparent,
                  filled: false,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBandField(LeagueScoringRule rule) {
    final baseKey = _getRuleKey(rule);
    final (_, _, isOpenEnded) = _parseBand(rule.band);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Left bound input
          _buildSmallInput('${baseKey}_left', width: 50),
          // Only show separator and right bound for non-open-ended ranges
          if (!isOpenEnded) ...[
            const SizedBox(width: 4),
            Text(
              '-',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.black600),
            ),
            const SizedBox(width: 4),
            _buildSmallInput('${baseKey}_right', width: 50),
          ],
          if (isOpenEnded) ...[
            const SizedBox(width: 4),
            Text(
              '+',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.black600),
            ),
          ],
          const Spacer(),
          // Points input
          _buildSmallInput('${baseKey}_points', width: 66),
        ],
      ),
    );
  }

  Widget _buildSmallInput(String controllerKey, {required double width}) {
    return Container(
      width: width,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.black400),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[controllerKey],
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            fillColor: Colors.transparent,
            filled: false,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF1C1C1C),
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _goBack();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1C1C1C),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: _goBack,
                      child: PhosphorIcon(PhosphorIcons.caretLeft(), size: 24),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "CREATE LEAGUE",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // League Name (display only)
                        Text(
                          'League Name',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.black200,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.black400),
                          ),
                          child: Text(
                            widget.leagueData['leagueName'] ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Tournament (display only)
                        Text(
                          'Tournament',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.black200,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.black400),
                          ),
                          child: Text(
                            widget.leagueData['tournamentName'] ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Scoring Header
                        Text(
                          'Scoring',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        const SizedBox(height: 16),

                        // Dynamic scoring sections from API
                        ..._buildDynamicScoringSections(),

                        const SizedBox(height: 24),

                        // Next Button
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _navigateToCreateTeam,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
