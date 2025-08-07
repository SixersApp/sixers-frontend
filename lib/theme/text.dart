import 'package:flutter/material.dart';


TextTheme buildTextTheme(Brightness b) {
  final base = b == Brightness.dark ? ThemeData.dark().textTheme : ThemeData.light().textTheme;


  final fam = base;

  return fam.copyWith(
    headlineLarge: fam.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
    titleLarge:    fam.titleLarge?.copyWith(fontWeight: FontWeight.w700),
    titleMedium:   fam.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    bodyLarge:     fam.bodyLarge?.copyWith(height: 1.3),
    bodyMedium:    fam.bodyMedium,
    bodySmall:     fam.bodySmall,
    labelLarge:    fam.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  );
}
