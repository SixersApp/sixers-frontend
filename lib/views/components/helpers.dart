import 'dart:ui';

import 'package:sixers/theme/colors.dart';

({Color color, String iconPath}) roleIconAndColor(String role) => switch (role) {
  "Batsman" => (iconPath: 'assets/images/player_icons/Batsmen.png', color: AppColors.purple200),
  "Bowler" => (iconPath: 'assets/images/player_icons/Bowler.png', color: AppColors.cyan200),
  "Wicket-Keeper" => (
    iconPath: 'assets/images/player_icons/Batsmen.png', // Using Batsmen as placeholder for Wicket-Keeper
    color: AppColors.blue200,
  ),
  "All-Rounder" => (
    iconPath: 'assets/images/player_icons/AllRounder.png',
    color: AppColors.pink600,
  ),
  String() => (
    iconPath: 'assets/images/player_icons/Batsmen.png', // Default fallback
    color: AppColors.black200,
  ),
};
