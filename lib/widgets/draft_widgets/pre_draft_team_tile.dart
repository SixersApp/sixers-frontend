// lib/widgets/draft_widgets/pre_draft_team_tile.dart
import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.team,
    required this.index,
    this.accentColor,          // optional override for glow/logo color
    this.logoImage,            // optional ImageProvider for team image
  });

  final FantasyTeam team;
  final int index;
  final Color? accentColor;
  final ImageProvider? logoImage;

  Color _colorForIndex(int i) {
    const palette = [
      Color(0xFFF8BD00), // Yellow-300 (Figma fallback)
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
    final aka = team.akaName ?? '';


    const double tileRadius = 12;
    const double pad = 10;

 
    const double avatar = 40;   
    const double avatarRadius = 5;

    const double glowBlur = 61.2;
    const double glowSpread = 3.0;

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

            
            Padding(
              padding: const EdgeInsets.all(pad),
              child: Row(
                children: [
             
                  SizedBox(
                    width: avatar,  
                    height: avatar,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                    
                        Container(
                          width: avatar,
                          height: avatar,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.01),    
                            borderRadius: BorderRadius.circular(avatarRadius),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.70),
                                blurRadius: glowBlur,
                                spreadRadius: glowSpread,
                                offset: Offset.zero,
                              ),
                            ],
                          ),
                        ),

            
                        ClipRRect(
                          borderRadius: BorderRadius.circular(avatarRadius),
                          child: Container(
                            width: avatar,
                            height: avatar,
                            decoration: BoxDecoration(
                              color: color, 
                              image: logoImage != null
                                  ? DecorationImage(
                                      image: logoImage!,
                                      fit: BoxFit.cover, 
                                    )
                                  : null,
                            ),
                            child: logoImage == null
                                ? const Icon(Icons.sports_cricket, color: Colors.white)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  // ===== Team name + AKA =====
                  Expanded(
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${team.teamName}  ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'AKA $aka',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white70, fontWeight: FontWeight.w500),
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
