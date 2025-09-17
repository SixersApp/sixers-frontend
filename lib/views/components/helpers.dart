import 'dart:ui';

import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/theme/colors.dart';

({Color color, Object icon}) roleIconAndColor(String role) => switch (role) {
  "Batsman" => (icon: PhosphorIcons.cricket(), color: AppColors.purple200),
  "Bowler" => (icon: PhosphorIcons.boules(), color: AppColors.cyan200),
  "Wicket-Keeper" => (
    icon: PhosphorIcons.boxingGlove(),
    color: AppColors.blue200,
  ),
  "All-Rounder" => (
    icon: PhosphorIcons.star(),
    color: AppColors.pink200,
  ), // amber-ish
  // TODO: Handle this case.
  String() => (
    icon: PhosphorIcons.arrowsClockwise(),
    color: AppColors.black200,
  ),
};
