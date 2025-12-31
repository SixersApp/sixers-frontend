import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/home/home_screen.dart';

void showLeagueDropDown(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Color(0x80000000),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          final userLeagues = ref.watch(leaguesProvider);
          final userTeams = ref.watch(fantasyTeamsProvider);
          
          final val = userLeagues.value ?? [];
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Material(
                color: AppColors.black200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.black400),
                ),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavOption(
                        context,
                        iconBg: AppColors.black400,
                        icon: Center(
                          child: Image.asset(
                            "assets/splash_logo.png",
                            height: 16,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: "FANTASY HUB",
                        path: HomeScreen.route,
                      ),
                      _buildNavOption(
                        context,
                        iconBg: AppColors.black400,
                        icon: PhosphorIcon(PhosphorIcons.plus(), size: 20,),
                        title: "CREATE NEW LEAGUE",
                        path: "/create",
                      ),
                      _buildNavOption(
                        context,
                        iconBg: AppColors.black400,
                        icon: PhosphorIcon(PhosphorIcons.signIn(), size: 20,),
                        title: "JOIN NEW LEAGUE",
                        path: "/join",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildNavOption(
  BuildContext context, {
  required Color iconBg,
  required Widget icon,
  required String title,
  required String path,
  String? subtitle,
  String? chipText,
}) {
  return GestureDetector(
    onTap: () {
      // Close the dialog first, then navigate.
      Navigator.of(context, rootNavigator: true).pop();
      Future.microtask(() => context.go(path));
    },
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: iconBg,
            ),
            child: icon,
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.black600),
                ),
            ],
          ),
          const Spacer(),
          if (chipText != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.black400,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                chipText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    ),
  );
}
