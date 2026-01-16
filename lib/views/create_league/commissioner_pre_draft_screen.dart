import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/create_league/league_settings_screen.dart';
import 'package:sixers/views/home/home_screen.dart';

class CommissionerPreDraftScreen extends ConsumerStatefulWidget {
  static const String route = '/commissioner-pre-draft';

  final String leagueId;

  const CommissionerPreDraftScreen({super.key, required this.leagueId});

  @override
  ConsumerState<CommissionerPreDraftScreen> createState() =>
      _CommissionerPreDraftScreenState();
}

class _CommissionerPreDraftScreenState
    extends ConsumerState<CommissionerPreDraftScreen> {
  League? _league;
  bool _isLoading = true;
  bool copiedCode = false;
  bool _isSavingTimer = false;
  bool _isCommissioner = false;

  final LeagueService _leagueService = LeagueService();

  // wheel ranges & limits
  static const int _minuteRange = 10; // 0..9
  static const int _secondRange = 60; // 0..59
  static const int _maxTimerSeconds = _minuteRange * _secondRange - 1; // 9:59 => 599s

  // new: local draft timer seconds (clamped between 5 and _maxTimerSeconds)
  int _draftTimerSeconds = 120;

  @override
  void initState() {
    super.initState();
    _loadLeague();
  }

  Future<void> _loadLeague() async {
    try {
      final leagues = await ref.read(leaguesProvider.future);
      final league = leagues.firstWhere((l) => l.id == widget.leagueId);
      final session = await ref.read(authProviderProvider.future);
      final isCommissioner = session?.userId == league.creatorId;
      if (mounted) {
        setState(() {
          _league = league;
          _isCommissioner = isCommissioner;
          // initialize and clamp to [5, _maxTimerSeconds] seconds
          final start = league.draftSettings?.timePerPick ?? 120;
          _draftTimerSeconds = start.clamp(5, _maxTimerSeconds);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // improved: shows bottom sheet with wheel pickers (minutes, seconds)
  void _showTimerPicker() {
    if (!mounted) return;
    int tempMinutes = _draftTimerSeconds ~/ 60;
    int tempSeconds = _draftTimerSeconds % 60;

    // configure repeating (infinite-like) ranges
    const loops = 10000; // repeats to simulate infinite scroll
    final minuteCount = _minuteRange * loops;
    final secondCount = _secondRange * loops;
    final minuteBase = minuteCount ~/ 2;
    final secondBase = secondCount ~/ 2;
    final minController = FixedExtentScrollController(initialItem: minuteBase + tempMinutes);
    final secController = FixedExtentScrollController(initialItem: secondBase + tempSeconds);

    // current absolute selected index for visual distance calculations
    int selectedMinuteAbs = minuteBase + tempMinutes;
    int selectedSecondAbs = secondBase + tempSeconds;

    // helper: floor division for negatives
    int floorDiv(int a, int b) {
      if (a >= 0) return a ~/ b;
      return -(((-a) + b - 1) ~/ b);
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.black100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateSB) {
          return Container(
            height: 400,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Set Draft Timer',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Material(
                      color: AppColors.black400,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: AppColors.black800.withAlpha(0x66),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: PhosphorIcon(PhosphorIcons.x(), size: 20, color: AppColors.black800,),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Row(
                    children: [
                      // Minutes wheel
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ListWheelScrollView.useDelegate(
                                controller: minController,
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: 56,
                                diameterRatio: 1.5,
                                onSelectedItemChanged: (i) {
                                  HapticFeedback.selectionClick();
                                  setStateSB(() {
                                    selectedMinuteAbs = i;
                                    tempMinutes = i % _minuteRange;
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    final displayed = index % _minuteRange;
                                    final dist = (index - selectedMinuteAbs).abs();
                                    // size scales: selected (0) largest, dist 1 medium, else small
                                    final double fontSize = dist == 0 ? 36 : dist == 1 ? 24 : 16;
                                    final double scale = dist == 0 ? 1.12 : dist == 1 ? 0.9 : 0.78;
                                    final color = dist == 0 ? AppColors.black800 : AppColors.black700.withOpacity(0.65);
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: AnimatedDefaultTextStyle(
                                          duration: const Duration(milliseconds: 150),
                                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                            fontSize: fontSize,
                                            color: color,
                                          ),
                                          child: Transform.scale(
                                            scale: scale,
                                            child: Text(displayed.toString().padLeft(2, '0')),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: minuteCount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
 
                      // Colon separator centered
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            ':',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 32, color: AppColors.black500),
                          ),
                        ),
                      ),
 
                      // Seconds wheel
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListWheelScrollView.useDelegate(
                                controller: secController,
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: 56,
                                diameterRatio: 1.5,
                                onSelectedItemChanged: (i) {
                                  HapticFeedback.selectionClick();
                                  setStateSB(() {
                                    final delta = i - selectedSecondAbs;
                                    if (delta != 0) {
                                      final prevDisplayed = selectedSecondAbs % _secondRange;
                                      final wraps = floorDiv(prevDisplayed + delta, _secondRange);
                                      selectedSecondAbs = i;
                                      tempSeconds = i % _secondRange;
                                      if (wraps != 0) {
                                        // adjust minute abs and displayed minutes, wrap within _minuteRange
                                        selectedMinuteAbs += wraps;
                                        tempMinutes = (tempMinutes + wraps) % _minuteRange;
                                        if (tempMinutes < 0) tempMinutes += _minuteRange;
                                        // move minute wheel to reflect the wrap
                                        minController.jumpToItem(selectedMinuteAbs);
                                      }
                                    }
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    final displayed = index % secondCount == null ? 0 : index % _secondRange;
                                    final displayed2 = index % _secondRange;
                                    final dist = (index - selectedSecondAbs).abs();
                                    final double fontSize = dist == 0 ? 36 : dist == 1 ? 24 : 16;
                                    final double scale = dist == 0 ? 1.12 : dist == 1 ? 0.9 : 0.78;
                                    final color = dist == 0 ? AppColors.black800 : AppColors.black700.withOpacity(0.65);
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: AnimatedDefaultTextStyle(
                                          duration: const Duration(milliseconds: 150),
                                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                            fontSize: fontSize,
                                            color: color,
                                          ),
                                          child: Transform.scale(
                                            scale: scale,
                                            child: Text(displayed2.toString().padLeft(2, '0')),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: secondCount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
 
                // Save button applies selection and closes
                StatefulBuilder(
                  builder: (context, setSaveState) {
                    return ElevatedButton(
                      onPressed: _isSavingTimer
                          ? null
                          : () async {
                              var newSeconds = tempMinutes * 60 + tempSeconds;
                              newSeconds = newSeconds.clamp(5, _maxTimerSeconds);

                              setSaveState(() {});
                              setState(() {
                                _isSavingTimer = true;
                              });

                              try {
                                final updatedSettings = await _leagueService.updateDraftSettings(
                                  leagueId: widget.leagueId,
                                  timePerPick: newSeconds,
                                );

                                if (mounted) {
                                  setState(() {
                                    _draftTimerSeconds = newSeconds;
                                    _isSavingTimer = false;
                                  });

                                  // Update the local league with the new draft settings
                                  if (_league != null) {
                                    final updatedLeague = _league!.copyWith(
                                      draftSettings: updatedSettings,
                                    );
                                    _league = updatedLeague;
                                    ref.read(leaguesProvider.notifier).updateLeague(updatedLeague);
                                  }

                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(this.context).showSnackBar(
                                    const SnackBar(content: Text('Draft timer updated')),
                                  );
                                }
                              } catch (e) {
                                if (mounted) {
                                  setState(() {
                                    _isSavingTimer = false;
                                  });
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(this.context).showSnackBar(
                                    SnackBar(content: Text('Failed to update timer: $e')),
                                  );
                                }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black800,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: _isSavingTimer
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.black100,
                              ),
                            )
                          : Text('Save', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black100, fontWeight: FontWeight.bold)),
                    );
                  },
                ),
 
                const SizedBox(height: 20)
              ],
            ),
          );
        });
      },
    ).whenComplete(() {
      minController.dispose();
      secController.dispose();
    });
  }

  void _copyInviteCode() {
    if (_league != null) {
      Clipboard.setData(ClipboardData(text: _league!.joinCode));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invite code copied to clipboard')),
      );
      setState(() {
        copiedCode = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        if(mounted) {
          setState(() {
            copiedCode = false;   
          });
        }
      });
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
              onTap: () {
                if(context.canPop()) {
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
                _league!.name.toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: AppColors.black800),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to settings
                context.push(LeagueSettingsScreen.route(_league!.id));
              },
              child: PhosphorIcon(
                PhosphorIcons.gearSix(),
                size: 30,
                color: AppColors.black800,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _isLoading || _league == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Teams List
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: _copyInviteCode,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.black300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Invite Code',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: AppColors.black700,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        _league!.joinCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(fontSize: 30),
                                      ),
                                      const SizedBox(width: 5),
                                      PhosphorIcon(
                                        copiedCode ? PhosphorIcons.check() : PhosphorIcons.copy(),
                                        size: 24,
                                        color: AppColors.black800,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Teams (${_league!.teams.length})"),
                          const SizedBox(height: 5),
                          for (var team in _league!.teams)
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.black200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Row(
                                children: [
                                  // Team Avatar
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: stringToColor(team.teamColor),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: stringToColor(team.teamColor)
                                              .withOpacity(0.5),
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
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          team.teamName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(fontSize: 16),
                                        ),
                                        Text(
                                          'AKA ${team.userName ?? 'Unknown'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color: AppColors.black700,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Draft Info Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: _isCommissioner ? _showTimerPicker : null,
                      child: Row(
                        children: [
                          // Draft Timer
                          Text(
                            'Draft Timer',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: AppColors.black700),
                          ),
                          const Spacer(),
                          Text(
                            // use local selected timer
                            _formatTimer(Duration(seconds: _draftTimerSeconds)),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 30),
                          ),
                          if (_isCommissioner) ...[
                            const SizedBox(width: 5),
                            PhosphorIcon(
                              PhosphorIcons.pencilSimple(),
                              size: 24,
                              color: AppColors.black800,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ],
                      ),
                    ),
                  ),

                  // Begin Draft Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to draft screen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.black800,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Begin Draft',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
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


String _formatTimer(Duration d) {
  return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
}