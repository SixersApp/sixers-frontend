import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/home/home_screen.dart';

class LeagueSettingsScreen extends ConsumerStatefulWidget {
  static String route(String id) => "/league/$id/settings";

  final String leagueId;

  const LeagueSettingsScreen({super.key, required this.leagueId});

  @override
  ConsumerState<LeagueSettingsScreen> createState() =>
      _LeagueSettingsScreenState();
}

class _LeagueSettingsScreenState extends ConsumerState<LeagueSettingsScreen> {
  final _leagueService = LeagueService();
  final Map<String, TextEditingController> _controllers = {};

  League? _league;
  bool _isLoading = true;
  bool _isSaving = false;
  bool _isCommissioner = false;
  List<LeagueScoringRule> _scoringRules = [];

  @override
  void initState() {
    super.initState();
    _loadLeagueData();
  }

  Future<void> _loadLeagueData() async {
    try {
      final leagues = await ref.read(leaguesProvider.future);
      final league = leagues.firstWhere((l) => l.id == widget.leagueId);
      final session = await ref.read(authProviderProvider.future);

      if (mounted) {
        setState(() {
          _league = league;
          _scoringRules = List.from(league.scoringRules);
          _isCommissioner = session?.userId == league.creatorId;
          _isLoading = false;
          _initializeControllers();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _initializeControllers() {
    for (var rule in _scoringRules) {
      if (rule.mode == RuleMode.band) {
        final baseKey = _getRuleKey(rule);
        final (left, right, isOpenEnded) = _parseBand(rule.band);
        _controllers['${baseKey}_left'] = TextEditingController(text: left);
        if (!isOpenEnded) {
          _controllers['${baseKey}_right'] = TextEditingController(text: right);
        }
        _controllers['${baseKey}_points'] =
            TextEditingController(text: (rule.flatPoints ?? 0.0).toString());
      } else {
        final key = _getRuleKey(rule);
        final value = _getRuleValue(rule);
        _controllers[key] = TextEditingController(text: value.toString());
      }
    }
  }

  (String, String, bool) _parseBand(String? band) {
    if (band == null || band.isEmpty) return ('', '', false);

    final intervalMatch =
        RegExp(r'^[\[\(]([0-9.]*),([0-9.]*)[\]\)]$').firstMatch(band);
    if (intervalMatch != null) {
      final left = intervalMatch.group(1) ?? '';
      final right = intervalMatch.group(2) ?? '';
      final isOpenEnded = right.isEmpty;
      return (left, right, isOpenEnded);
    }

    if (band.endsWith('+')) {
      final left = band.substring(0, band.length - 1);
      return (left, '', true);
    }

    final dashMatch = RegExp(r'^([0-9.]+)-([0-9.]+)$').firstMatch(band);
    if (dashMatch != null) {
      return (dashMatch.group(1)!, dashMatch.group(2)!, false);
    }

    return (band, '', false);
  }

  String _getRuleKey(LeagueScoringRule rule) {
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
    return stat
        .split('_')
        .map((word) =>
            word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : '')
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

  List<LeagueScoringRule> _getUpdatedRules() {
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

        return rule.copyWith(
          band: newBand,
          flatPoints: points,
        );
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

  Future<void> _saveChanges() async {
    if (!_isCommissioner || _league == null) return;

    setState(() => _isSaving = true);

    try {
      final updatedRules = _getUpdatedRules();
      final savedRules = await _leagueService.updateLeagueScoringRules(
        leagueId: widget.leagueId,
        scoringRules: updatedRules,
      );

      // Update local state and provider
      final updatedLeague = _league!.copyWith(scoringRules: savedRules);
      ref.read(leaguesProvider.notifier).updateLeague(updatedLeague);

      if (mounted) {
        setState(() {
          _league = updatedLeague;
          _scoringRules = savedRules;
          _isSaving = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Scoring rules updated')),
        );
        context.pop();
      }
    } catch (e) {
      logError(e.toString());
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save: $e')),
        );
      }
    }
  }

  List<Widget> _buildDynamicScoringSections() {
    final grouped = _groupRulesByCategory();
    final widgets = <Widget>[];

    const categoryOrder = ['leadership', 'fielding', 'batting', 'bowling'];

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

      widgets.add(
        Text(
          _formatCategoryLabel(category),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.black600,
              ),
        ),
      );
      widgets.add(const SizedBox(height: 8));

      final bandRules = rules.where((r) => r.mode == RuleMode.band).toList();
      final regularRules = rules.where((r) => r.mode != RuleMode.band).toList();

      for (var rule in regularRules) {
        final key = _getRuleKey(rule);
        final label = _formatStatLabel(rule.stat);
        widgets.add(_buildScoringField(label, key));
      }

      if (bandRules.isNotEmpty) {
        final bandGroups = <String, List<LeagueScoringRule>>{};
        for (var rule in bandRules) {
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
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black800,
                  ),
            ),
          );
          widgets.add(const SizedBox(height: 8));

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

  Widget _buildScoringField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black800,
                  ),
            ),
          ),
          Container(
            width: 66,
            height: 36,
            decoration: BoxDecoration(
              color: _isCommissioner ? AppColors.black200 : AppColors.black300,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.black400),
            ),
            child: Center(
              child: TextField(
                controller: _controllers[key],
                textAlign: TextAlign.center,
                enabled: _isCommissioner,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: _isCommissioner
                          ? AppColors.black800
                          : AppColors.black600,
                    ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
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
          _buildSmallInput('${baseKey}_left', width: 50),
          if (!isOpenEnded) ...[
            const SizedBox(width: 4),
            Text(
              '-',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.black600,
                  ),
            ),
            const SizedBox(width: 4),
            _buildSmallInput('${baseKey}_right', width: 50),
          ],
          if (isOpenEnded) ...[
            const SizedBox(width: 4),
            Text(
              '+',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.black600,
                  ),
            ),
          ],
          const Spacer(),
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
        color: _isCommissioner ? AppColors.black200 : AppColors.black300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.black400),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[controllerKey],
          textAlign: TextAlign.center,
          enabled: _isCommissioner,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true, signed: true),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    _isCommissioner ? AppColors.black800 : AppColors.black600,
              ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
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
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.black100,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_league == null) {
      return Scaffold(
        backgroundColor: AppColors.black100,
        body: Center(
          child: Text(
            'League not found',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black100,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(HomeScreen.route);
                }
              },
              child: PhosphorIcon(
                PhosphorIcons.caretLeft(),
                size: 24,
                color: AppColors.black800,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                'SETTINGS',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.black800),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // League Name
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
                        _league!.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Tournament
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
                        _league!.tournamentAbbr ?? 'Unknown',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Commissioner badge
                    if (!_isCommissioner)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.black300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PhosphorIcon(
                              PhosphorIcons.eye(),
                              size: 16,
                              color: AppColors.black600,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'View only - Only the commissioner can edit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.black600),
                            ),
                          ],
                        ),
                      ),

                    // Scoring Header
                    Text(
                      'Scoring Rules',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(height: 16),

                    // Dynamic scoring sections
                    if (_scoringRules.isEmpty)
                      Text(
                        'No scoring rules configured',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.black600),
                      )
                    else
                      ..._buildDynamicScoringSections(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Save button (only for commissioners)
            if (_isCommissioner)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black800,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
                            'Save Changes',
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
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
