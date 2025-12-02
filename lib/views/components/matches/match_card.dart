import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String homeTeamName;
  final String awayTeamName;
  final String matchDateFormatted; // Raw date string from backend
  final String homeScore;
  final String awayScore;
  final String tournamentLabel;
  final bool isLive;

  const MatchCard({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.matchDateFormatted,
    required this.homeScore,
    required this.awayScore,
    required this.tournamentLabel,
    required this.isLive,
  });

  // -------------------------------------------------------------
  // Helper: truncate text (15 chars max)
  // -------------------------------------------------------------
  String _truncate(String? s) {
    if (s == null) return "";
    return s.length <= 15 ? s : "${s.substring(0, 15)}…";
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
      "", "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[m];
  }

  // -------------------------------------------------------------
  // Build UI
  // -------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
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
              Row(children: [
                const Icon(Icons.sports_cricket, color: Colors.white, size: 22),
                const SizedBox(width: 6),
                Text(
                  _truncate(homeTeamName),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ]),
              const Text("vs",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Row(children: [
                Text(
                  _truncate(awayTeamName),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.sports_cricket, color: Colors.white, size: 22),
              ]),
            ],
          ),

          const SizedBox(height: 8),

          // ---------------------------------------------------------
          // ROW 2 — Match Date + Status Badge
          // ---------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDate(matchDateFormatted),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isLive
                      ? Colors.red.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isLive ? "Live" : "Upcoming",
                  style: TextStyle(
                    color: isLive ? Colors.redAccent : Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ---------------------------------------------------------
          // ROW 3 — Scores
          // ---------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeScore,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                awayScore,
                style: const TextStyle(color: Colors.white, fontSize: 18),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tournamentLabel,
                style:
                    const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}