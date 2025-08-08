import 'package:flutter/material.dart';


class SurfaceColors extends ThemeExtension<SurfaceColors> {
  final Color background;  
  final Color foreground;  
  final Color darkTile;     
  final Color tile;         
  final Color lightTile;    

  const SurfaceColors({
    required this.background,
    required this.foreground,
    required this.darkTile,
    required this.tile,
    required this.lightTile,
  });

  @override
  SurfaceColors copyWith({
    Color? background,
    Color? foreground,
    Color? darkTile,
    Color? tile,
    Color? lightTile,
  }) =>
      SurfaceColors(
        background: background ?? this.background,
        foreground: foreground ?? this.foreground,
        darkTile: darkTile ?? this.darkTile,
        tile: tile ?? this.tile,
        lightTile: lightTile ?? this.lightTile,
      );

  @override
  SurfaceColors lerp(ThemeExtension<SurfaceColors>? other, double t) {
    if (other is! SurfaceColors) return this;
    return SurfaceColors(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      darkTile: Color.lerp(darkTile, other.darkTile, t)!,
      tile: Color.lerp(tile, other.tile, t)!,
      lightTile: Color.lerp(lightTile, other.lightTile, t)!,
    );
  }
}

class ChipColors extends ThemeExtension<ChipColors> {
  final Color bg;        
  final Color text;          
  final Color bgSelected;    
  final Color textSelected;  

  const ChipColors({
    required this.bg,
    required this.text,
    required this.bgSelected,
    required this.textSelected,
  });

  @override
  ChipColors copyWith({
    Color? bg,
    Color? text,
    Color? bgSelected,
    Color? textSelected,
  }) =>
      ChipColors(
        bg: bg ?? this.bg,
        text: text ?? this.text,
        bgSelected: bgSelected ?? this.bgSelected,
        textSelected: textSelected ?? this.textSelected,
      );

  @override
  ChipColors lerp(ThemeExtension<ChipColors>? other, double t) {
    if (other is! ChipColors) return this;
    return ChipColors(
      bg: Color.lerp(bg, other.bg, t)!,
      text: Color.lerp(text, other.text, t)!,
      bgSelected: Color.lerp(bgSelected, other.bgSelected, t)!,
      textSelected: Color.lerp(textSelected, other.textSelected, t)!,
    );
  }
}


class FieldColors extends ThemeExtension<FieldColors> {
  final Color fill;   
  final Color border; 

  const FieldColors({required this.fill, required this.border});

  @override
  FieldColors copyWith({Color? fill, Color? border}) =>
      FieldColors(fill: fill ?? this.fill, border: border ?? this.border);

  @override
  FieldColors lerp(ThemeExtension<FieldColors>? other, double t) {
    if (other is! FieldColors) return this;
    return FieldColors(
      fill: Color.lerp(fill, other.fill, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}

class NavColors extends ThemeExtension<NavColors> {
  final Color icon;          
  final Color bg;           
  final Color iconSelected; 
  final Color bgSelected;     

  const NavColors({
    required this.icon,
    required this.bg,
    required this.iconSelected,
    required this.bgSelected,
  });

  @override
  NavColors copyWith({
    Color? icon,
    Color? bg,
    Color? iconSelected,
    Color? bgSelected,
  }) =>
      NavColors(
        icon: icon ?? this.icon,
        bg: bg ?? this.bg,
        iconSelected: iconSelected ?? this.iconSelected,
        bgSelected: bgSelected ?? this.bgSelected,
      );

  @override
  NavColors lerp(ThemeExtension<NavColors>? other, double t) {
    if (other is! NavColors) return this;
    return NavColors(
      icon: Color.lerp(icon, other.icon, t)!,
      bg: Color.lerp(bg, other.bg, t)!,
      iconSelected: Color.lerp(iconSelected, other.iconSelected, t)!,
      bgSelected: Color.lerp(bgSelected, other.bgSelected, t)!,
    );
  }
}
