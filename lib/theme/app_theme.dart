// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'colors.dart';
import 'text.dart';
import 'brand_tokens.dart';

class AppTheme {
  // Optional accent for buttons, sliders, etc. (kept subtle)
  static const _seed = AppColors.black700;

  // You’re designing dark-first; keep light if you want a future light mode.
  static ThemeData dark = _build(brightness: Brightness.dark);
  static ThemeData light = _build(brightness: Brightness.light);

  static ThemeData _build({required Brightness brightness}) {
    // Base Material scheme, then override our neutrals.
    var scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: brightness);

    // Map your black scale -> surfaces & “on*” text colors.
    scheme = scheme.copyWith(
      surface: AppColors.black200, // foreground / dark tile
      surfaceContainerHighest: AppColors.black300, // general tile
      outline: AppColors.black400, // text on bg
      onSurface: AppColors.black800, // text on tiles
      onSurfaceVariant: AppColors.black600, // muted text
      primary: AppColors.black700, // subtle accent
      onPrimary: AppColors.black100,
      primaryContainer: AppColors.black400, // used for selected nav bg, etc.
      onPrimaryContainer: AppColors.black800,
    );

    // --- Brand extensions (your tokens) ------------------------------------
    const surfaces = SurfaceColors(
      background: AppColors.black100,
      foreground: AppColors.black200,
      darkTile: AppColors.black200,
      tile: AppColors.black300,
      lightTile: AppColors.black400,
    );

    const chips = ChipColors(
      bg: AppColors.black300,
      text: AppColors.black600,
      bgSelected: AppColors.black800,
      textSelected: AppColors.black100,
    );

    const fields = FieldColors(
      fill: AppColors.black200,
      border: AppColors.black400,
    );

    const nav = NavColors(
      icon: AppColors.black600,
      bg: Colors.transparent, // no background
      iconSelected: AppColors.black800,
      bgSelected: AppColors.black400,
    );

    // --- ThemeData ----------------------------------------------------------
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.black100,
      textTheme: buildTextTheme(brightness),

      // Cards & list tiles (your tiles)
      cardTheme: CardThemeData(
        color: surfaces.tile,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      ),
      listTileTheme: ListTileThemeData(
        tileColor: surfaces.tile,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: surfaces.foreground,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        titleTextStyle: buildTextTheme(
          brightness,
        ).headlineLarge?.copyWith(letterSpacing: 0.2, color: scheme.onSurface),
        iconTheme: IconThemeData(color: scheme.onSurface),
        leadingWidth: 40,
        titleSpacing: -8,
      ),

      // Dividers
      dividerTheme: DividerThemeData(color: scheme.outline, thickness: 1),

      // TextFields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.fromRGBO(34, 34, 34, 1),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: fields.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: fields.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.green300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.red100),
        ),
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        errorStyle: TextStyle(
          fontFamily: "Instrument Sans",
          fontSize: 12,
          color: AppColors.red100
        )
      ),

      // Chips (back-compat for older SDKs):
      // Use this with the BrandedChoiceChip wrapper to hide/show borders per state.
      chipTheme: ChipThemeData(
        backgroundColor: chips.bg, // idle fill
        selectedColor: chips.bgSelected, // selected fill
        disabledColor: chips.bg,
        labelStyle: TextStyle(
          // idle text
          fontWeight: FontWeight.w600,
          color: chips.text,
        ),
        secondaryLabelStyle: TextStyle(
          // selected text
          fontWeight: FontWeight.w600,
          color: chips.textSelected,
        ),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),

      // M3 NavigationBar (selected pill + icon colors)
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        backgroundColor: nav.bg,
        indicatorColor: nav.bgSelected, // selected item background
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        // NOTE: If your SDK supports iconTheme state props, uncomment below and remove per-destination coloring.
        // iconTheme: MaterialStateProperty.resolveWith((states) {
        //   final sel = states.contains(MaterialState.selected);
        //   return IconThemeData(color: sel ? nav.iconSelected : nav.icon);
        // }),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black800,
          foregroundColor: AppColors.black100,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center,
          textStyle: TextStyle(
            fontFamily: 'InstrumentSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.black300,
          foregroundColor: AppColors.black800,
          textStyle: TextStyle(
            fontFamily: 'InstrumentSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.black800,
          textStyle: TextStyle(
            fontFamily: 'InstrumentSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center,
        ),
      ),
      // Register your tokens
      extensions: const <ThemeExtension<dynamic>>[surfaces, chips, fields, nav],
    );
  }
}
