// lib/ui/draft/lobby/edit_pick_timer_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/theme/colors.dart';

// ⬇️ change this import/name if your actions provider is different
import 'package:sixers/backend/draft_settings/draft_settings_provider.dart'
  show draftSettingsActionsProvider;

class EditPickTimerSheet extends ConsumerStatefulWidget {
  const EditPickTimerSheet({
    super.key,
    required this.leagueId,
    required this.initialSeconds,
    this.maxMinutes = 20,
  });

  final String leagueId;
  final int initialSeconds;
  final int maxMinutes;

  static Future<void> show(
    BuildContext context, {
    required String leagueId,
    required int initialSeconds,
    int maxMinutes = 20,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: AppColors.black100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditPickTimerSheet(
        leagueId: leagueId,
        initialSeconds: initialSeconds,
        maxMinutes: maxMinutes,
      ),
    );
  }

  @override
  ConsumerState<EditPickTimerSheet> createState() => _EditPickTimerSheetState();
}

class _EditPickTimerSheetState extends ConsumerState<EditPickTimerSheet> {
  late final FixedExtentScrollController _minCtrl;
  late final FixedExtentScrollController _secCtrl;

  int get _initMin => (widget.initialSeconds ~/ 60).clamp(0, widget.maxMinutes);
  int get _initSec => (widget.initialSeconds % 60).clamp(0, 59);

  @override
  void initState() {
    super.initState();
    _minCtrl = FixedExtentScrollController(initialItem: _initMin);
    _secCtrl = FixedExtentScrollController(initialItem: _initSec);
  }

  @override
  void dispose() {
    _minCtrl.dispose();
    _secCtrl.dispose();
    super.dispose();
  }

  String _mmss(int m, int s) =>
      '${m.toString()}:${s.toString().padLeft(2, '0')}';

  Future<void> _save(WidgetRef ref) async {
    final m = _minCtrl.selectedItem;
    final s = _secCtrl.selectedItem;
    final total = m * 60 + s;
    if (total <= 0) return; // ignore zero-length timer
    await ref.read(draftSettingsActionsProvider).setTimePerPick(
          widget.leagueId,
          total,
        );
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final wheelText = text.titleLarge?.copyWith(color: Colors.white);
    final labelText =
        text.labelMedium?.copyWith(color: Colors.white70, fontWeight: FontWeight.w600);

    return Consumer(builder: (context, ref, _) {
      return SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: const BoxDecoration(
            color: AppColors.black100,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Grab handle
              Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header row
              Row(
                children: [
                  Text('Pick Timer', style: text.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      await _save(ref);
                      if (mounted) Navigator.pop(context);
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Preview of current value
              Builder(builder: (_) {
                final m = _minCtrl.selectedItem;
                final s = _secCtrl.selectedItem;
                return Text(
                  _mmss(m, s),
                  style: text.displaySmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900),
                );
              }),
              const SizedBox(height: 8),

              // Wheels
              SizedBox(
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Wheel(
                      controller: _minCtrl,
                      itemCount: widget.maxMinutes + 1,
                      itemLabelBuilder: (i) => '$i',
                      onChanged: (_) => HapticFeedback.selectionClick(),
                      textStyle: wheelText!,
                      label: 'min',
                      labelStyle: labelText!,
                    ),
                    const SizedBox(width: 12),
                    _Wheel(
                      controller: _secCtrl,
                      itemCount: 60,
                      itemLabelBuilder: (i) => i.toString().padLeft(2, '0'),
                      onChanged: (_) => HapticFeedback.selectionClick(),
                      textStyle: wheelText,
                      label: 'sec',
                      labelStyle: labelText,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Tip / zero guard
              Text(
                'Tip: swipe down to dismiss — it auto-saves.',
                style: text.bodySmall?.copyWith(color: Colors.white38),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _Wheel extends StatelessWidget {
  const _Wheel({
    required this.controller,
    required this.itemCount,
    required this.itemLabelBuilder,
    required this.onChanged,
    required this.textStyle,
    required this.label,
    required this.labelStyle,
  });

  final FixedExtentScrollController controller;
  final int itemCount;
  final String Function(int) itemLabelBuilder;
  final ValueChanged<int> onChanged;
  final TextStyle textStyle;
  final String label;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        children: [
          Text(label, style: labelStyle),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: controller,
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 40,
              perspective: 0.002,
              diameterRatio: 2.0,
              onSelectedItemChanged: onChanged,
              useMagnifier: true,
              magnification: 1.10,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: itemCount,
                builder: (context, index) {
                  return Center(
                    child: Text(itemLabelBuilder(index), style: textStyle),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
