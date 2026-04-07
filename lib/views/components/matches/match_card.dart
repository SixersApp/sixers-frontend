import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/theme/colors.dart';

class MatchCard extends StatelessWidget {
  final String homeTeamName;
  final String awayTeamName;
  final String matchDateFormatted; // Raw date string from backend
  final String homeScore;
  final String awayScore;
  final String tournamentLabel;
  final String status; // 'LIVE', 'NS', 'FINISHED', 'ABAN', etc.
  final String? result;
  final String? homeTeamLogo;
  final String? awayTeamLogo;

  const MatchCard({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.matchDateFormatted,
    required this.homeScore,
    required this.awayScore,
    required this.tournamentLabel,
    required this.status,
    this.result,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
  });
  bool get _isLive => status.toUpperCase() == 'LIVE';
  bool get _isFinished {
    final s = status.toUpperCase();
    return s == 'FINISHED' || s == 'ABAN';
  }

  // -------------------------------------------------------------
  // Helper: convert raw date into "Jun 12"
  // -------------------------------------------------------------
  String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      return "${_month(dt.month)} ${dt.day}";
    } catch (_) {
      return "--";
    }
  }

  String _month(int m) {
    const months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[m];
  }

  /// Returns [score, overs] or [score, ""] or ["", ""] if empty.
  List<String> _separateScoreStrings(String s) {
    if (s.isEmpty) return ["", ""];
    final reg = RegExp(r'^(\d{1,3}/\d{1,2})\s*\((\d{1,2}\.\d)\)$');
    final match = reg.firstMatch(s);
    if (match != null) return [match.group(1)!, match.group(2)!];
    // Score without overs (e.g. "0/0")
    if (RegExp(r'^\d{1,3}/\d{1,2}$').hasMatch(s)) return [s, ""];
    return ["", ""];
  }

  // -------------------------------------------------------------
  // Build UI
  // -------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    var homeTeamScoreValues = _separateScoreStrings(homeScore);
    var awayTeamScoreValues = _separateScoreStrings(awayScore);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------------------------------------------------
          // ROW 1 — Home Team vs Away Team
          // ---------------------------------------------------------
          Row(
            children: [
              Text(
                _formatDate(matchDateFormatted),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.black600),
              ),
              const Spacer(),
              if (_isLive) ...[
                PhosphorIcon(
                  PhosphorIcons.record(PhosphorIconsStyle.fill),
                  size: 14,
                  color: AppColors.red100,
                ),
                const SizedBox(width: 4),
              ],
              if (_isFinished) ...[
                PhosphorIcon(
                  PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                  size: 14,
                  color: AppColors.black600,
                ),
                const SizedBox(width: 4),
              ],

              Text(
                _isLive ? "Live" : _isFinished ? "Final" : "Upcoming",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _isLive ? AppColors.red100 : AppColors.black600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.black400,
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: homeTeamLogo != null && homeTeamLogo!.isNotEmpty
                    ? Image.network(homeTeamLogo!, width: 16, height: 16)
                    : const Center(),
              ),
              const SizedBox(width: 6),
              Text(
                homeTeamName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              if (homeTeamScoreValues[0].isNotEmpty)
                Text(
                  homeTeamScoreValues[0],
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.black800),
                ),
              if (homeTeamScoreValues[1].isNotEmpty)
                Text(
                  " (${homeTeamScoreValues[1]})",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.black600),
                ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.black400,
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: awayTeamLogo != null && awayTeamLogo!.isNotEmpty
                    ? Image.network(awayTeamLogo!, width: 16, height: 16)
                    : const Center(),
              ),
              const SizedBox(width: 6),
              Text(
                awayTeamName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              if (awayTeamScoreValues[0].isNotEmpty)
                Text(
                  awayTeamScoreValues[0],
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.black800),
                ),
              if (awayTeamScoreValues[1].isNotEmpty)
                Text(
                  " (${awayTeamScoreValues[1]})",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.black600),
                ),
            ],
          ),

          const SizedBox(height: 10),

          // ---------------------------------------------------------
          // Result + Tournament Label
          // ---------------------------------------------------------
          Row(
            children: [
              if (_isFinished && result != null && result!.isNotEmpty)
                Expanded(
                  child: Text(
                    result!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.black600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (!_isFinished || result == null || result!.isEmpty)
                const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.black400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tournamentLabel,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.black700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
