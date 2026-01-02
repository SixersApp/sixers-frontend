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
  final bool isLive;
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
    required this.isLive,
    required this.homeTeamLogo,
    required this.awayTeamLogo
  });
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

  List<String> _separateScoreStrings(String s) {
    final reg = RegExp(r'^(\d{1,3}/\d{1,2})\s*\((\d{1,2}\.\d)\)$');
    final match = reg.firstMatch(s);

    if (match != null) {
      return [match.group(1)!, match.group(2)!];
    }
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDate(matchDateFormatted),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.black600),
              ),
              if (isLive) ...[
                PhosphorIcon(
                  PhosphorIcons.record(),
                  size: 14,
                  color: AppColors.red100,
                ),
                const SizedBox(width: 4),
              ],

              Text(
                isLive ? "Live" : "Upcoming",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isLive ? AppColors.red100 : AppColors.black600,
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
                child: Uri.tryParse(homeTeamLogo ?? "") != null ? Image.network(homeTeamLogo!, width: 16, height: 16,) : Center()
              ),
              const SizedBox(width: 6),
              Text(
                homeTeamName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Text(
                homeTeamScoreValues[0],
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: AppColors.black800),
              ),
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
                child: Uri.tryParse(awayTeamLogo ?? "") != null ? Image.network(awayTeamLogo!, width: 16, height: 16,) : Center()
              ),
              const SizedBox(width: 6),
              Text(
                awayTeamName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Text(
                awayTeamScoreValues[0],
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: AppColors.black800),
              ),
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
          // Tournament Label
          // ---------------------------------------------------------
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.black400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tournamentLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
