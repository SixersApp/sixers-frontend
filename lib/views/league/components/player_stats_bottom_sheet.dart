import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/player_stats/player_stats_model.dart';
import 'package:sixers/backend/player_stats/player_stats_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/components/helpers.dart';

class PlayerStatsBottomSheet extends StatefulWidget {
  final String playerId;
  final String playerName;
  final String? defaultSeasonId;
  final String? fantasyTeamName;
  final String? fantasyTeamIcon;
  final Color? fantasyTeamColor;

  const PlayerStatsBottomSheet({
    super.key,
    required this.playerId,
    required this.playerName,
    this.defaultSeasonId,
    this.fantasyTeamName,
    this.fantasyTeamIcon,
    this.fantasyTeamColor,
  });

  @override
  State<PlayerStatsBottomSheet> createState() => _PlayerStatsBottomSheetState();
}

class _PlayerStatsBottomSheetState extends State<PlayerStatsBottomSheet>
    with TickerProviderStateMixin {
  PlayerStats? _stats;
  bool _loading = true;
  String? _error;
  String? _selectedSeasonId;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchStats();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchStats() async {
    try {
      final stats = await PlayerStatsService().getPlayerStats(widget.playerId);
      if (!mounted) return;
      setState(() {
        _stats = stats;
        _loading = false;
        if (stats != null && stats.seasons.isNotEmpty) {
          _selectedSeasonId =
              stats.seasons
                  .where((s) => s.seasonId == widget.defaultSeasonId)
                  .firstOrNull
                  ?.seasonId ??
              stats.seasons.first.seasonId;
        }
      });
    } catch (e, st) {
      debugPrint('PlayerStats error: $e\n$st');
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  List<SeasonStats> get _tournamentSeasons {
    if (_stats == null || _selectedSeasonId == null) return [];
    final current = _stats!.seasons
        .where((s) => s.seasonId == _selectedSeasonId)
        .firstOrNull;
    if (current == null || current.tournamentName == null)
      return _stats!.seasons;
    return _stats!.seasons
        .where((s) => s.tournamentName == current.tournamentName)
        .toList();
  }

  SeasonStats? get _selectedSeason {
    if (_stats == null || _selectedSeasonId == null) return null;
    return _stats!.seasons
        .where((s) => s.seasonId == _selectedSeasonId)
        .firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.black100,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          clipBehavior: Clip.antiAlias,
          child: _loading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : _error != null
              ? Center(
                  child: Text(
                    'Failed to load stats',
                    style: TextStyle(color: AppColors.black600),
                  ),
                )
              : _stats != null && _selectedSeason != null
              ? _buildContent(scrollController)
              : Center(
                  child: Text(
                    'No stats available',
                    style: TextStyle(color: AppColors.black600),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildContent(ScrollController scrollController) {
    final stats = _stats!;
    final season = _selectedSeason!;
    return Column(
      children: [
        // Non-scrollable header area
        Column(
          children: [
            _buildHeader(stats, season),
            // Tab bar matching LeagueTabSelector style
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF101010),
              ),
              padding: const EdgeInsets.all(5),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.black300,
                  borderRadius: BorderRadius.circular(5),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.black800,
                unselectedLabelColor: AppColors.black600,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                tabs: const [
                  Tab(text: 'Stats'),
                  Tab(text: 'Game Log'),
                  Tab(text: 'Transactions'),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        // Swipeable tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildStatsTab(season, scrollController),
              _buildGameLogTab(),
              _buildTransactionsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsTab(SeasonStats season, ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '"%" Represent Percentile Rankings',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.black500),
              ),
            ),
            if (_tournamentSeasons.length > 1)
              _buildSeasonDropdown(_tournamentSeasons),
          ],
        ),

        const SizedBox(height: 20),

        // ── BATTING ──
        if (season.batting != null) ...[
          Text(
            'BATTING',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _buildStatsGrid([
            if (season.batting!.matchesBatted != null)
              _StatItem('Matches', season.batting!.matchesBatted!),
            if (season.batting!.totalRuns != null)
              _StatItem('Runs', season.batting!.totalRuns!),
            if (season.batting!.halfCenturies != null)
              _StatItem('Half Centuries', season.batting!.halfCenturies!),
            if (season.batting!.centuries != null)
              _StatItem('Centuries', season.batting!.centuries!),
            if (season.batting!.strikeRate != null)
              _StatItem('Strike Rate', season.batting!.strikeRate!),
            if (season.batting!.battingAverage != null)
              _StatItem('Average', season.batting!.battingAverage!),
          ]),
          const SizedBox(height: 24),
        ],

        // ── BOWLING ──
        if (season.bowling != null) ...[
          Text(
            'BOWLING',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _buildStatsGrid([
            if (season.bowling!.matchesBowled != null)
              _StatItem('Matches', season.bowling!.matchesBowled!),
            if (season.bowling!.totalWickets != null)
              _StatItem('Wickets', season.bowling!.totalWickets!),
            if (season.bowling!.threeWicketHauls != null)
              _StatItem('3-wicket hauls', season.bowling!.threeWicketHauls!),
            if (season.bowling!.fiveWicketHauls != null)
              _StatItem('5-wicket hauls', season.bowling!.fiveWicketHauls!),
            if (season.bowling!.bowlingAverage != null)
              _StatItem('Average', season.bowling!.bowlingAverage!),
            if (season.bowling!.bowlingEconomy != null)
              _StatItem('Economy', season.bowling!.bowlingEconomy!),
          ]),
        ],

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildGameLogTab() {
    return Center(
      child: Text(
        'Game Log coming soon',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.black500),
      ),
    );
  }

  Widget _buildTransactionsTab() {
    return Center(
      child: Text(
        'Transactions coming soon',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.black500),
      ),
    );
  }

  Widget _buildSeasonDropdown(List<SeasonStats> seasons) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedSeasonId,
          isDense: true,
          dropdownColor: AppColors.black300,
          icon: PhosphorIcon(
            PhosphorIcons.caretDown(),
            color: AppColors.black800,
            size: 16,
          ),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.black800,
            fontWeight: FontWeight.w600,
          ),
          items: seasons.map((s) {
            final abbr = s.tournamentAbbreviation ?? s.tournamentName ?? '';
            final label =  '${s.endYear}  ';
            return DropdownMenuItem(value: s.seasonId, child: Text(label));
          }).toList(),
          onChanged: (value) {
            if (value != null && value != _selectedSeasonId) {
              setState(() => _selectedSeasonId = value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeader(PlayerStats stats, SeasonStats season) {
    final primaryRole = _stats!.seasons.first.role;
    final role = roleIconAndColor(primaryRole);
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          height: 40,
          color: role.color,
          child: CustomPaint(
            painter: _OpaquePatternPainter(
              image: rolePatternImage(primaryRole),
            ),
            size: Size.infinite,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Player image
                  Container(
                    width: 47,
                    height: 47,
                    decoration: BoxDecoration(
                      color: AppColors.black400,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.black100, width: 2),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: stats.image.isNotEmpty
                        ? Image.network(
                            stats.image,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.person,
                              color: Colors.white38,
                              size: 32,
                            ),
                          )
                        : const Icon(Icons.person, color: Colors.white38, size: 32),
                  ),
                  const Spacer(),
                  // Fantasy team info
                  if (widget.fantasyTeamName != null)
                    Container(
                      width: 47,
                      height: 47,
                      decoration: BoxDecoration(
                        color: widget.fantasyTeamColor ?? AppColors.black400,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: AppColors.black100, width: 2),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: widget.fantasyTeamIcon != null
                          ? Image.asset(
                              stringToAvatar(widget.fantasyTeamIcon),
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const SizedBox(),
                            )
                          : const SizedBox(),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                stats.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.black800,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              role.icon as PhosphorIconData,
                              color: role.color,
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          season.teamName,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black600),
                        ),
                      ],
                    ),
                  ),
                  if (widget.fantasyTeamName != null)
                    Text(
                      widget.fantasyTeamName!,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.black800, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(List<_StatItem> items) {
    final rows = <Widget>[];
    for (int i = 0; i < items.length; i += 2) {
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: i + 2 < items.length ? 8 : 0),
          child: Row(
            children: [
              Expanded(child: _AnimatedStatCard(item: items[i], percentileColor: _percentileColor, formatValue: _formatValue)),
              const SizedBox(width: 8),
              Expanded(
                child: i + 1 < items.length
                    ? _AnimatedStatCard(item: items[i + 1], percentileColor: _percentileColor, formatValue: _formatValue)
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }

  // Stat cards are now _AnimatedStatCard widgets

  String _formatValue(double value) {
    if (value == value.roundToDouble()) {
      final intStr = value.toInt().toString();
      if (intStr.length <= 4) return intStr;
      if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}k';
      return intStr.substring(0, 4);
    }
    final intPart = value.toInt().toString();
    if (intPart.length >= 3) return intPart;
    final decimals = 4 - intPart.length - 1;
    return value.toStringAsFixed(decimals > 0 ? decimals : 0);
  }

  Color _percentileColor(double percentile) {
    if (percentile >= 0.66) return AppColors.green300;
    if (percentile >= 0.33) return AppColors.yellow300;
    return AppColors.red100;
  }
}

class _StatItem {
  final String label;
  final StatEntry entry;
  const _StatItem(this.label, this.entry);
}

class _AnimatedStatCard extends StatefulWidget {
  final _StatItem item;
  final Color Function(double) percentileColor;
  final String Function(double) formatValue;

  const _AnimatedStatCard({
    required this.item,
    required this.percentileColor,
    required this.formatValue,
  });

  @override
  State<_AnimatedStatCard> createState() => _AnimatedStatCardState();
}

class _AnimatedStatCardState extends State<_AnimatedStatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void didUpdateWidget(_AnimatedStatCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.entry != widget.item.entry) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentile = widget.item.entry.percentile ?? 0;
    final value = widget.item.entry.value ?? 0;
    final color = widget.percentileColor(percentile);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final targetInt = value.round();
        final animatedInt = (targetInt * _animation.value).round();
        final animatedValue = animatedInt.toDouble();
        final animatedPercentile = percentile * _animation.value;
        final animatedPctInt = (animatedPercentile * 100).round();

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.black200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.item.label,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.black600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '$animatedPctInt%',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.formatValue(animatedValue),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.black800,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: CustomPaint(
                      size: const Size(80, 30),
                      painter: _BellCurvePainter(
                        percentile: animatedPercentile,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BellCurvePainter extends CustomPainter {
  final double percentile;
  final Color color;

  _BellCurvePainter({required this.percentile, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const steps = 100;

    final outlinePath = Path();
    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final x = t * w;
      final y = h - _bellY(t) * h * 0.85;
      if (i == 0) {
        outlinePath.moveTo(x, y);
      } else {
        outlinePath.lineTo(x, y);
      }
    }

    final greyFill = Path.from(outlinePath)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(greyFill, Paint()..color = AppColors.black400);

    final colorPath = Path();
    final pxEnd = (percentile * w).clamp(0.0, w);
    final colorSteps = (percentile * steps).round();
    for (int i = 0; i <= colorSteps; i++) {
      final t = i / steps;
      final x = t * w;
      final y = h - _bellY(t) * h * 0.85;
      if (i == 0) {
        colorPath.moveTo(x, y);
      } else {
        colorPath.lineTo(x, y);
      }
    }
    colorPath.lineTo(pxEnd, h);
    colorPath.lineTo(0, h);
    colorPath.close();
    canvas.drawPath(colorPath, Paint()..color = color);

    // Vertical marker line — always 20px tall
    final markerX = pxEnd;
    final curveY = h - _bellY(percentile) * h * 0.85;
    const lineHeight = 20.0;
    final lineTop = h - lineHeight;
    canvas.drawLine(
      Offset(markerX, lineTop),
      Offset(markerX, h),
      Paint()
        ..color = color
        ..strokeWidth = 2,
    );

    // White circle with black border at the curve intersection
    const circleRadius = 3.0;
    canvas.drawCircle(
      Offset(markerX, curveY),
      circleRadius,
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      Offset(markerX, curveY),
      circleRadius,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  double _bellY(double t) {
    const mean = 0.5;
    const sigma = 0.18;
    final exponent = -math.pow(t - mean, 2) / (2 * sigma * sigma);
    return math.exp(exponent);
  }

  @override
  bool shouldRepaint(covariant _BellCurvePainter oldDelegate) =>
      oldDelegate.percentile != percentile || oldDelegate.color != color;
}

/// Show the player stats bottom sheet.
void showPlayerStatsSheet(
  BuildContext context, {
  required String playerId,
  required String playerName,
  String? defaultSeasonId,
  String? fantasyTeamName,
  String? fantasyTeamIcon,
  Color? fantasyTeamColor,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (_) => PlayerStatsBottomSheet(
      playerId: playerId,
      playerName: playerName,
      defaultSeasonId: defaultSeasonId,
      fantasyTeamName: fantasyTeamName,
      fantasyTeamIcon: fantasyTeamIcon,
      fantasyTeamColor: fantasyTeamColor,
    ),
  );
}

class _OpaquePatternPainter extends CustomPainter {
  final ui.Image image;

  _OpaquePatternPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final matrix = Matrix4.identity()..scale(2.0, 2.0);
    final paint = Paint()
      ..shader = ImageShader(
          image, TileMode.repeated, TileMode.repeated, matrix.storage);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _OpaquePatternPainter oldDelegate) {
    return oldDelegate.image != image;
  }
}
