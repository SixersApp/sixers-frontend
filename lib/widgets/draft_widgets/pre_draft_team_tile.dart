// lib/widgets/draft_widgets/pre_draft_team_tile.dart
import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.team,
    required this.index,
    this.accentColor,
  });

  final FantasyTeam team;
  final int index;
  final Color? accentColor;

  Color _colorForIndex(int i) {
    const palette = [
      Color(0xFFFFD166),
      Color(0xFF66A3FF),
      Color(0xFFFF8B66),
      Color(0xFFFF66D4),
      Color(0xFF66D18F),
    ];
    return palette[i % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? _colorForIndex(index);
    final aka = team.akaName;

    const double tileRadius = 12;
    const double pad = 10;
    const double avatar = 40;

    final double glowDiameter = 250;

    
    final double glowLeft = pad + (avatar / 2) - (glowDiameter / 2);
    final double glowTop = pad + (avatar / 2) - (glowDiameter / 2);

    return Container(
      margin: const EdgeInsets.only(top: 9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(tileRadius),
        clipBehavior: Clip.hardEdge, 
        child: Stack(
          children: [
           
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.black300),
              ),
            ),

          
            Positioned(
              left: glowLeft,
              top: glowTop,
              width: glowDiameter,
              height: glowDiameter,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                
                    gradient: RadialGradient(
                      radius:
                          0.8, 
                      colors: [
                        color.withOpacity(0.5), 
                        color.withOpacity(0.3),
                        color.withOpacity(0.15),
                        color.withOpacity(0.0)
                      ],
                      stops: const [0.0, 0.075, 0.15, 0.4],
                    ),
                  ),
                ),
              ),
            ),

            // 3) Content row
            Padding(
              padding: const EdgeInsets.all(pad),
              child: Row(
                children: [
                  Container(
                    width: avatar,
                    height: avatar,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.sports_cricket,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${team.teamName}  ',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          TextSpan(
                            text: 'AKA $aka',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
