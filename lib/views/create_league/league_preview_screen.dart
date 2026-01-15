import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/onboarding/onboarding_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';

class LeaguePreviewScreen extends ConsumerStatefulWidget {
  static const String route = '/join-league/preview';

  final League league;

  const LeaguePreviewScreen({super.key, required this.league});

  @override
  ConsumerState<LeaguePreviewScreen> createState() =>
      _LeaguePreviewScreenState();
}

class _LeaguePreviewScreenState extends ConsumerState<LeaguePreviewScreen> {
  void _joinLeague() {
    // Navigate to create team screen for this league
    context.push(
      '/join-league/${widget.league.id}/team',
      extra: {'league': widget.league},
    );
  }

  @override
  Widget build(BuildContext context) {
    final league = widget.league;
    final user = ref.read(onboardingStageProvider);

    return Scaffold(
      backgroundColor: AppColors.black100,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: PhosphorIcon(
                      PhosphorIcons.caretLeft(),
                      size: 24,
                      color: AppColors.black800,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "JOIN LEAGUE",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            // League Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.black200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // League name and tournament
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            league.name.toUpperCase(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            league.tournamentAbbr ?? 'Tournament',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: AppColors.black500),
                          ),
                        ],
                      ),
                    ),
                    // Team avatars
                    if (league.teams.isNotEmpty)
                      Row(
                        children: [
                          ...league.teams.take(6).map((
                            team,
                          ) {
                            return Align(
                              widthFactor: 0.75,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: stringToColor(team.teamColor),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.black400,
                                    width: 2,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    stringToAvatar(team.teamIcon),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(width: 10),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Teams List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var team in league.teams)
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.black200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Row(
                          children: [
                            // Team Avatar
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: stringToColor(team.teamColor),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: stringToColor(
                                      team.teamColor,
                                    ).withOpacity(0.5),
                                    blurRadius: 60,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  stringToAvatar(team.teamIcon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    team.teamName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    'AKA ${team.userName ?? 'Unknown'}',
                                    style: Theme.of(context).textTheme.titleSmall
                                        ?.copyWith(color: AppColors.black700),
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
            ),

            // Join Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: league.teams.length >= league.maxTeams || league.teams.any((t) => t.userId == user.value?.userId)
                      ? null
                      : _joinLeague,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black800,
                    disabledBackgroundColor: AppColors.black400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    league.teams.length >= league.maxTeams
                        ? 'League Full'
                        : league.teams.any((t) => t.userId == user.value?.userId) ? 'Already in League' : 'Join',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black100,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
