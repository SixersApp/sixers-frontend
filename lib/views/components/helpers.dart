import 'dart:ui' as ui;

import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/main.dart';
import 'package:sixers/theme/colors.dart';

({ui.Color color, Object icon}) roleIconAndColor(String role) {
  final r = role.toLowerCase();
  if (r.contains('allrounder') || r.contains('all-rounder')) {
    return (icon: PhosphorIcons.personSimpleThrow(PhosphorIconsStyle.fill), color: AppColors.blue200);
  }
  if (r.contains('batter') || r == 'batsman') {
    return (icon: PhosphorIcons.cricket(PhosphorIconsStyle.fill), color: AppColors.purple200);
  }
  if (r.contains('bowler') || r == 'bowler') {
    return (icon: PhosphorIcons.boules(PhosphorIconsStyle.fill), color: AppColors.cyan200);
  }
  if (r.contains('wicket') || r.contains('keeper')) {
    return (icon: PhosphorIcons.handsClapping(PhosphorIconsStyle.fill), color: AppColors.orange600);
  }
  return (icon: PhosphorIcons.arrowsClockwise(PhosphorIconsStyle.fill), color: AppColors.black200);
}

ui.Image rolePatternImage(String role) {
  final r = role.toLowerCase();
  if (r.contains('allrounder') || r.contains('all-rounder')) {
    return allrounderPatternImage;
  }
  if (r.contains('batter') || r == 'batsman') {
    return batPatternImage;
  }
  if (r.contains('bowler') || r == 'bowler') {
    return bowlPatternImage;
  }
  if (r.contains('wicket') || r.contains('keeper')) {
    return wicketkeeperPatternImage;
  }
  return matchupPatternImage;
}
