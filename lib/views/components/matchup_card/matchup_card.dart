import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/main.dart';
import 'package:sixers/theme/colors.dart';

class MatchupCard extends StatelessWidget {
  const MatchupCard({
    super.key,
    required this.team1Name,
    required this.team1Score,
    required this.team1PlayersLeft,
    required this.team1WinProbability,
    required this.team1Logo,
    required this.team1Color,
    required this.team2Name,
    required this.team2Score,
    required this.team2PlayersLeft,
    required this.team2WinProbability,
    required this.team2Logo,
    required this.team2Color,
    required this.leagueName,
    required this.gameNumber,
    required this.matchupId,
    required this.leagueId,
    required this.team1FtiId,
    required this.team2FtiId,
    this.isLive = true,
    this.width,
    this.onTap,
  });

  final String team1Name;
  final String team1Score;
  final int team1PlayersLeft;
  final int team1WinProbability;
  final Widget team1Logo;
  final Color team1Color;
  final String team2Name;
  final String team2Score;
  final int team2PlayersLeft;
  final int team2WinProbability;
  final Widget team2Logo;
  final Color team2Color;
  final String leagueName;
  final String gameNumber;
  final String matchupId;
  final String leagueId;
  final String team1FtiId;
  final String team2FtiId;
  final bool isLive;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          '/fantasyMatchup',
          extra: {
            "team1FtiId": team1FtiId,
            "team2FtiId": team2FtiId,
          },
        );
      },
      child: Container(
        width: 350,
        decoration: BoxDecoration(color: AppColors.black200, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            // Left pattern strip - much wider
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 30,
                decoration: BoxDecoration(
                  color: team1Color,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                child: const PatternBackground(),
              ),
            ),
            // Right pattern strip
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 30,
                decoration: BoxDecoration(
                  color: team2Color,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child: const PatternBackground(),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row 1: Team names and Live indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Team 1 name badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.black100,
                          border: Border.all(color: AppColors.black100),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Text(
                          team1Name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: AppColors.black800),
                        ),
                      ),

                      // Live indicator
                      if (isLive)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(PhosphorIcons.record(PhosphorIconsStyle.fill), color: AppColors.red100, size: 12),
                            const SizedBox(width: 6),
                            Text(
                              'Live',
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(color: AppColors.red100, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),

                      // Team 2 name badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.black100,
                          border: Border.all(color: AppColors.black100),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Text(
                          team2Name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: AppColors.black800),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  // Row 2: Team logos and scores
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Team 1 logo
                      Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          color: team1Color,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.black100, width: 2),
                        ),
                        child: Center(child: team1Logo),
                      ),

                      // Scores
                      Row(
                        children: [
                          Text(
                            team1Score,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: AppColors.black800,
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ':',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: AppColors.black500,
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            team2Score,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: AppColors.black800,
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),

                      // Team 2 logo
                      Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          color: team2Color,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.black100, width: 2),
                        ),
                        child: Center(child: team2Logo),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        // Row 3: Players left numbers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$team1PlayersLeft',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'PLAYERS LEFT',
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(color: AppColors.black600, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '$team2PlayersLeft',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        // Row 4: Win probability numbers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$team1WinProbability%',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'WIN PROBABILITY',
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(color: AppColors.black600, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '$team2WinProbability%',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        // Row 5: Win probability bar (full width)
                        Container(
                          height: 4,
                          decoration: BoxDecoration(color: AppColors.black300, borderRadius: BorderRadius.circular(2)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: team1WinProbability,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: team1Color,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(2),
                                      bottomLeft: Radius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 1),
                              Expanded(
                                flex: team2WinProbability,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: team2Color,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(2),
                                      bottomRight: Radius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 5),

                        // Row 6: League and game number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              leagueName,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black500, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              gameNumber,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.black500, fontWeight: FontWeight.w600),
                            ),
                          ],
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
    );
  }
}

class ImagePatternPainter extends CustomPainter {
  final ui.Image image;
  final Paint paintPattern;

  ImagePatternPainter({required this.image})
    : paintPattern = Paint()..shader = ImageShader(image, TileMode.repeated, TileMode.repeated, Matrix4.identity().storage);

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = 0.10;
    final Matrix4 scaleMatrix = Matrix4.identity()..scale(scale, scale);

    paintPattern.shader = ImageShader(image, TileMode.repeated, TileMode.repeated, scaleMatrix.storage);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paintPattern);
  }

  @override
  bool shouldRepaint(covariant ImagePatternPainter oldDelegate) {
    return oldDelegate.image != image;
  }
}

class PatternBackground extends StatefulWidget {
  const PatternBackground({super.key});

  @override
  State<PatternBackground> createState() => _PatternBackgroundState();
}

class _PatternBackgroundState extends State<PatternBackground> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    setState(() {
      _image = matchupPatternImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return CustomPaint(
      painter: ImagePatternPainter(image: _image!),
      size: Size.infinite,
    );
  }
}

class PreDraftCard extends StatelessWidget {
  const PreDraftCard({super.key, required this.league});

  final League league;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/draft', extra: league),
      child: Container(
        width: 341,
        decoration: BoxDecoration(color: AppColors.black300, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  league.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  'Draft hasn\'t started yet',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.black600, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Icon(PhosphorIcons.arrowRight(), color: AppColors.black700),
          ],
        ),
      ),
    );
  }
}
