import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/standings.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';

// Column widths shared between the header row and data rows so they line up.
const double _kRankW = 24;
const double _kIconSize = 26;
const double _kIconGap = 12;
const double _kWlW = 26;
const double _kMatchesW = 30;
const double _kAvgW = 48;

class LeaderboardSheet extends StatelessWidget {
  final League league;

  const LeaderboardSheet({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    final ranked = sortedStandings(league.teams);
    final userTeamId = league.userTeamId;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.black100,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            border: Border.all(color: AppColors.black400),
          ),
          child: Column(
            children: [
              // ── Header: league name + tournament, with avatar cluster ──
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            league.name.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if ((league.tournamentAbbr ?? '').isNotEmpty)
                            Text(
                              league.tournamentAbbr!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: AppColors.black600),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    _AvatarCluster(teams: ranked),
                  ],
                ),
              ),

              const Divider(height: 1, thickness: 1, color: AppColors.black300),

              // ── Column header row ──
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: _HeaderRow(),
              ),

              const Divider(height: 1, thickness: 1, color: AppColors.black300),

              // ── Rows ──
              Expanded(
                child: ranked.isEmpty
                    ? Center(
                        child: Text(
                          'No teams yet',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.black600),
                        ),
                      )
                    : ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                        itemCount: ranked.length,
                        separatorBuilder: (_, _) => const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.black300,
                        ),
                        itemBuilder: (context, index) {
                          final team = ranked[index];
                          return _LeaderboardRow(
                            rank: index + 1,
                            team: team,
                            isUserTeam: team.id == userTeamId,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Overlapping cluster of circular team icons shown in the header.
class _AvatarCluster extends StatelessWidget {
  final List<FantasyTeam> teams;
  static const int _max = 6;

  const _AvatarCluster({required this.teams});

  @override
  Widget build(BuildContext context) {
    if (teams.isEmpty) return const SizedBox.shrink();

    const double size = 28;
    const double step = 18; // size - overlap
    final shown = teams.length > _max ? teams.sublist(0, _max) : teams;
    final width = (shown.length - 1) * step + size;

    return SizedBox(
      height: size,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < shown.length; i++)
            Positioned(
              left: i * step,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black100, width: 2),
                ),
                child: _teamCircle(shown[i], size),
              ),
            ),
        ],
      ),
    );
  }
}

/// A circular team avatar backed by the team's color.
Widget _teamCircle(FantasyTeam team, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: stringToColor(team.teamColor),
      shape: BoxShape.circle,
    ),
    child: ClipOval(
      child: Image.asset(
        stringToAvatar(team.teamIcon),
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.black600,
        );
    return Row(
      children: [
        SizedBox(width: _kRankW, child: Text('#', style: style)),
        const SizedBox(width: _kIconGap),
        const SizedBox(width: _kIconSize),
        const SizedBox(width: _kIconGap),
        Expanded(child: Text('Name', style: style)),
        SizedBox(
          width: _kWlW,
          child: Text('W', style: style, textAlign: TextAlign.center),
        ),
        SizedBox(
          width: _kWlW,
          child: Text('L', style: style, textAlign: TextAlign.center),
        ),
        SizedBox(
          width: _kMatchesW,
          child: Text('M', style: style, textAlign: TextAlign.center),
        ),
        SizedBox(
          width: _kAvgW,
          child: Text('AVG', style: style, textAlign: TextAlign.right),
        ),
      ],
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final FantasyTeam team;
  final bool isUserTeam;

  const _LeaderboardRow({
    required this.rank,
    required this.team,
    required this.isUserTeam,
  });

  @override
  Widget build(BuildContext context) {
    final wins = team.wins ?? 0;
    final losses = team.losses ?? 0;
    final played = team.matchesCompleted ?? 0;
    final avg = team.avgPointsPerGame;

    final weight = isUserTeam ? FontWeight.w700 : FontWeight.w400;
    final cellStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.black800,
          fontWeight: weight,
        );

    Widget numCell(String text, double width) => SizedBox(
          width: width,
          child: Text(text, style: cellStyle, textAlign: TextAlign.center),
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        children: [
          SizedBox(
            width: _kRankW,
            child: Text('$rank', style: cellStyle),
          ),
          const SizedBox(width: _kIconGap),
          _teamCircle(team, _kIconSize),
          const SizedBox(width: _kIconGap),
          Expanded(
            child: Text(
              team.teamName,
              style: cellStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          numCell('$wins', _kWlW),
          numCell('$losses', _kWlW),
          numCell('$played', _kMatchesW),
          SizedBox(
            width: _kAvgW,
            child: Text(
              played > 0 && avg != null ? avg.toStringAsFixed(1) : '—',
              style: cellStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

void showLeaderboardSheet(
  BuildContext context, {
  required League league,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (_) => LeaderboardSheet(league: league),
  );
}
