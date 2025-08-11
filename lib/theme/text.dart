import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _headingFont = 'Unbounded';
const _bodyFont = 'Instrument Sans';

TextTheme buildTextTheme(Brightness b) {
  final base = b == Brightness.dark
      ? ThemeData.dark().textTheme
      : ThemeData.light().textTheme;

  final heading = GoogleFonts.getFont(_headingFont).fontFamily!;
  final body = GoogleFonts.getFont(_bodyFont).fontFamily!;

  return base.copyWith(
    // (h1) LOGIN/SIGN UP
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w700,
      fontSize: 64,
    ),

    // (h2) BASIC INFO/EXPERIENCE
    headlineLarge: base.headlineLarge?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w700,
      fontSize: 64,
    ),

    // (h3) SIXERS/Team Score
    headlineMedium: base.headlineMedium?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w600,
      fontSize: 30,
    ),

    // (h4) ROLE CATEGORY/GAME SCORE
    headlineSmall: base.headlineSmall?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),

    // (h5) Live/Upcoming Games
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: body,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),

    titleMedium: base.titleMedium?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w600,
    ),

    // Head-to_head text/player name in a player block
    titleSmall: base.titleSmall?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),

    //standard body (text field)
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: body,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),

    //(button) view all/create an account
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: body,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),

    //Fantasy team name in draft pick block
    bodySmall: base.bodySmall?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w300,
      fontSize: 12,
    ),

    //(Bold Caption) Team's name in head-to-head/
    labelLarge: base.labelLarge?.copyWith(
      fontFamily: heading,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),

    //(Large Caption) Round and Pick in completed draft pick/info field in player draft block/info in player block in head-to-head
    labelMedium: base.labelMedium?.copyWith(
      fontFamily: body,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),

    //(Caption) AKA...
    labelSmall: base.labelSmall?.copyWith(
      fontFamily: body,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
