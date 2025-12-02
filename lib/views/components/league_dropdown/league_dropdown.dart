import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:collection/collection.dart';

class LeagueDropdown extends ConsumerWidget {
  const LeagueDropdown({
    super.key,
    this.onSelected,
    this.label = 'SIXERS',
    this.width = 'auto',
    this.selectedLeague,
  });

  final ValueChanged<League>? onSelected;
  final String label;
  final String width;
  final League? selectedLeague;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider);

    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.black200,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 8,
          textStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
        ),
      ),
      child: PopupMenuButton<League?>(
        onSelected: (value) {
          if (value != null) {
            onSelected?.call(value);
          }
        },
        itemBuilder: (ctx) {
          final List<PopupMenuEntry<League?>> entries = [
            const PopupMenuDivider(height: 8),
            PopupMenuItem<League?>(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Icon(PhosphorIcons.plusCircle(), size: 18, color: AppColors.black800),
                  const SizedBox(width: 10),
                  const Text('Create New League'),
                ],
              ),
              onTap: () => GoRouter.of(ctx).push('/create-league'),
            ),
            PopupMenuItem<League?>(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Icon(PhosphorIcons.signIn(), size: 18, color: AppColors.black800),
                  const SizedBox(width: 10),
                  const Text('Join New League'),
                ],
              ),
              onTap: () => GoRouter.of(ctx).push('/joinLeague'),
            ),
          ];

          // LEAGUE LIST
          final leagueItems = leaguesAsync.maybeWhen(
            data: (leagues) {
              if (leagues.isEmpty) {
                return [
                  const PopupMenuItem<League?>(
                    enabled: false,
                    child: Text('No leagues yet'),
                  )
                ];
              }

              return leagues.map((l) {
                return PopupMenuItem<League?>(
                  value: l,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final teamAsync = ref.watch(userTeamInLeagueProvider(l.id));
                      return teamAsync.when(
                        data: (team) => LeagueItem(
                          league: l,
                          teamName: team?.teamName ?? "No Team",
                        ),
                        loading: () => LeagueItem(league: l, teamName: "Loading..."),
                        error: (_, __) => LeagueItem(league: l, teamName: "Error"),
                      );
                    },
                  ),
                );
              }).toList();
            },
            loading: () => [
              const PopupMenuItem<League?>(
                enabled: false,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            ],
            orElse: () => [
              const PopupMenuItem<League?>(enabled: false, child: Text("Failed to load"))
            ],
          );

          return [...leagueItems, ...entries];
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisSize: width == "auto" ? MainAxisSize.min : MainAxisSize.max,
            mainAxisAlignment:
                width == "fill" ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            children: [
              selectedLeague != null
                  ? Consumer(
                      builder: (context, ref, _) {
                        final teamAsync = ref.watch(
                          userTeamInLeagueProvider(selectedLeague!.id),
                        );
                        return teamAsync.when(
                          data: (team) => LeagueItem(
                            league: selectedLeague!,
                            teamName: team?.teamName ?? 'No Team',
                          ),
                          loading: () => LeagueItem(
                            league: selectedLeague!,
                            teamName: 'Loading...',
                          ),
                          error: (_, __) => LeagueItem(
                            league: selectedLeague!,
                            teamName: 'Error',
                          ),
                        );
                      },
                    )
                  : Row(
                      children: [
                        Image.asset('assets/sixers_logo.png', width: 24, height: 24),
                        const SizedBox(width: 8),
                        Text(label,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.black800)),
                      ],
                    ),
              Icon(
                PhosphorIcons.caretDown(PhosphorIconsStyle.fill),
                color: AppColors.black800,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LeagueItem extends StatelessWidget {
  const LeagueItem({super.key, required this.league, required this.teamName});

  final League league;
  final String teamName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LeagueAvatar(name: league.name),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                league.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                teamName,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 12, height: 1.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LeagueAvatar extends StatelessWidget {
  const _LeagueAvatar({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final initials = name.isNotEmpty
        ? name.split(" ").map((word) => word[0]).take(2).join().toUpperCase()
        : "?";

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.black300,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        initials,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: AppColors.black800, fontWeight: FontWeight.bold),
      ),
    );
  }
}