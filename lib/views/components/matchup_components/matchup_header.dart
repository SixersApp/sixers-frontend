import 'package:flutter/material.dart';

/// A scoreboard-style header widget for showing a live matchup.
///
/// This widget is designed to resemble the reference image the user provided:
/// - Left and right team "cards" with logo, rank badge, team name and manager.
/// - Big centered scores with a colon separator.
/// - Small "Live" indicator and game/league labels.
/// - Win probability bar across the bottom.
class MatchupHeader extends StatelessWidget {
  const MatchupHeader({
    super.key,
    required this.leftTeam,
    required this.rightTeam,
    required this.leftScore,
    required this.rightScore,
    // required this.leftWinProbability, // 0–1
    // required this.rightWinProbability, // 0–1
    this.gameLabel = 'Game',
    this.leagueLabel,
    this.isLive = true,
  });
  

  /// Data for the left team (home).
  final MatchupTeamInfo leftTeam;

  /// Data for the right team (away).
  final MatchupTeamInfo rightTeam;

  /// Current score for the left team.
  final int leftScore;

  /// Current score for the right team.
  final int rightScore;

  /// Win probability for the left team (0–1).
  final double leftWinProbability = .5;

  /// Win probability for the right team (0–1).
  final double rightWinProbability = .5;

  /// Label for the current game (e.g. "Game 8").
  final String gameLabel;

  /// Label for the league/competition (e.g. "IPL").
  final String? leagueLabel;

  /// Whether the matchup is live.
  final bool isLive;

  @Preview(name: 'MatchupHeader')
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // Normalize probabilities in case they don't sum exactly to 1.
    final totalProb = leftWinProbability + rightWinProbability;
    final leftPct = (leftWinProbability / totalProb).clamp(0.0, 1.0);
    final rightPct = (rightWinProbability / totalProb).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF181B20),
            Color(0xFF101217),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top row: team cards + scores in the middle
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _TeamCard(
                  info: leftTeam,
                  alignment: CrossAxisAlignment.start,
                  isLeft: true,
                ),
              ),
              const SizedBox(width: 12),
              _ScoreBlock(
                leftScore: leftScore,
                rightScore: rightScore,
                isLive: isLive,
                gameLabel: gameLabel,
                leagueLabel: leagueLabel,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TeamCard(
                  info: rightTeam,
                  alignment: CrossAxisAlignment.end,
                  isLeft: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Win probability label
          Center(
            child: Text(
              'WIN PROBABILITY',
              style: textTheme.labelSmall?.copyWith(
                color: Colors.grey.shade400,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Percentages + bar
          Row(
            children: [
              Text(
                '${(leftPct * 100).round()}%',
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: SizedBox(
                    height: 6,
                    child: Row(
                      children: [
                        Expanded(
                          flex: (leftPct * 1000).round().clamp(1, 999),
                          child: Container(
                            color: const Color(0xFFF2C94C),
                          ),
                        ),
                        Expanded(
                          flex: (rightPct * 1000).round().clamp(1, 999),
                          child: Container(
                            color: const Color(0xFF4C6FFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(rightPct * 100).round()}%',
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Team info model used by [MatchupHeader].
class MatchupTeamInfo {
  const MatchupTeamInfo({
    required this.teamName,
    // required this.managerName,
    // required this.rankLabel,
    this.logo,
    this.logoBackgroundColor = const Color(0xFF20232A),
  });

  /// Full fantasy team name (e.g. "KITTU'S KOOL KIDS").
  final String teamName;

  /// Manager name (e.g. "AKA Pranav").
//   final String managerName;

  /// Rank label (e.g. "#1").
//   final String rankLabel;

  /// Optional logo widget (e.g. Image.asset / CircleAvatar).
  final Widget? logo;

  /// Background color for the logo square.
  final Color logoBackgroundColor;
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({
    required this.info,
    required this.alignment,
    required this.isLeft,
  });

  final MatchupTeamInfo info;
  final CrossAxisAlignment alignment;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment:
          isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (!isLeft) const SizedBox(width: 8),
        if (isLeft) _LogoBadge(info: info, isLeft: isLeft),
        if (isLeft) const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: alignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                info.teamName.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: isLeft ? TextAlign.left : TextAlign.right,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                info.teamName,
                textAlign: isLeft ? TextAlign.left : TextAlign.right,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        if (!isLeft) const SizedBox(width: 10),
        if (!isLeft) _LogoBadge(info: info, isLeft: isLeft),
        if (isLeft) const SizedBox(width: 8),
      ],
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge({
    required this.info,
    required this.isLeft,
  });

  final MatchupTeamInfo info;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: info.logoBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: info.logo ??
              Icon(
                Icons.sports_cricket,
                color: Colors.white,
                size: 36,
              ),
        ),
        Positioned(
          bottom: -10,
          left: isLeft ? 8 : null,
          right: isLeft ? null : 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.85),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Text(
              "1",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScoreBlock extends StatelessWidget {
  const _ScoreBlock({
    required this.leftScore,
    required this.rightScore,
    required this.isLive,
    required this.gameLabel,
    required this.leagueLabel,
  });

  final int leftScore;
  final int rightScore;
  final bool isLive;
  final String gameLabel;
  final String? leagueLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Live pill
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLive) ...[
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Live',
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ] else
              Text(
                'Final',
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // Scores
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$leftScore',
              style: textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                ':',
                style: textTheme.headlineMedium?.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '$rightScore',
              style: textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Game / league labels
        Column(
          children: [
            Text(
              gameLabel,
              style: textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade300,
              ),
            ),
            if (leagueLabel != null) ...[
              const SizedBox(height: 2),
              Text(
                leagueLabel!,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}


