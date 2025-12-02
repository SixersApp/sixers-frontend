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
    this.label = "SIXERS",
    this.width = "auto",
    this.selectedLeague,
  });

  final ValueChanged<League>? onSelected;
  final String label;
  final String width;
  final League? selectedLeague;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAv = ref.watch(leaguesProvider);

    return PopupMenuButton<League?>(
      onSelected: (value) {
        if (value != null) {
          onSelected?.call(value);
        }
      },
      itemBuilder: (ctx) {
        final List<PopupMenuEntry<League?>> menuItems = [];

        /// -------------------------
        /// LEAGUE LIST
        /// -------------------------
        leaguesAv.when(
          loading: () {
            menuItems.add(
              const PopupMenuItem(
                enabled: false,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          },
          error: (_, __) {
            menuItems.add(
              const PopupMenuItem(
                enabled: false,
                child: Text("Failed to load"),
              ),
            );
          },
          data: (leagues) {
            if (leagues.isEmpty) {
              menuItems.add(
                const PopupMenuItem(
                  enabled: false,
                  child: Text("No leagues yet"),
                ),
              );
            } else {
              menuItems.addAll(
                leagues.map(
                  (l) => PopupMenuItem(
                    value: l,
                    child: Consumer(
                      builder: (context, ref, _) {
                        // USER'S OWN TEAMS
                        final teamsAv = ref.watch(fantasyTeamsProvider);

                        return teamsAv.when(
                          loading: () =>
                              LeagueItem(league: l, teamName: "Loading..."),
                          error: (_, __) =>
                              LeagueItem(league: l, teamName: "Error"),
                          data: (teams) {
                            // find THIS USER's team for this league
                            final userTeam = teams
                                .firstWhereOrNull(
                                  (t) => t.leagueId == l.id,
                                )
                                ?.teamName;

                            return LeagueItem(
                              league: l,
                              teamName: userTeam ?? "No Team",
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        );

        /// -------------------------
        /// DIVIDER + CREATE/JOIN ACTIONS
        /// -------------------------
        menuItems.add(const PopupMenuDivider());

        menuItems.add(
          PopupMenuItem(
            child: Row(
              children: [
                Icon(PhosphorIcons.plusCircle(), color: AppColors.black800),
                const SizedBox(width: 10),
                const Text("Create New League"),
              ],
            ),
            onTap: () => GoRouter.of(ctx).push("/create-league"),
          ),
        );

        menuItems.add(
          PopupMenuItem(
            child: Row(
              children: [
                Icon(PhosphorIcons.signIn(), color: AppColors.black800),
                const SizedBox(width: 10),
                const Text("Join New League"),
              ],
            ),
            onTap: () => GoRouter.of(ctx).push("/joinLeague"),
          ),
        );

        return menuItems;
      },
      child: Container(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisSize:
              width == "auto" ? MainAxisSize.min : MainAxisSize.max,
          children: [
            selectedLeague != null
                ? Text(
                    selectedLeague!.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                : Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
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
        ? name.split(" ").map((w) => w[0]).take(2).join().toUpperCase()
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
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.black800,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}