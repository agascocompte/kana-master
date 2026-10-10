import 'package:flutter/material.dart';

/// Colours for one brightness.
class AppPalette {
  final Color ink;
  final Color graphite;
  final Color slate;
  final Color mist;
  final Color sand;
  final Color peach;
  final Color coral;
  final Color teal;
  final Color sky;
  final Color lime;

  /// Background of cards, dialogs and inputs.
  final Color surface;

  /// Text and icons drawn on top of [ink].
  final Color onInk;

  const AppPalette({
    required this.ink,
    required this.graphite,
    required this.slate,
    required this.mist,
    required this.sand,
    required this.peach,
    required this.coral,
    required this.teal,
    required this.sky,
    required this.lime,
    required this.surface,
    required this.onInk,
  });

  static const light = AppPalette(
    ink: Color(0xFF0E1B26),
    graphite: Color(0xFF243443),
    slate: Color(0xFF4C6B82),
    mist: Color(0xFFF6F2EB),
    sand: Color(0xFFF0E6D8),
    peach: Color(0xFFF5C28B),
    coral: Color(0xFFF2997A),
    teal: Color(0xFF2E8C88),
    sky: Color(0xFF77A6C6),
    lime: Color(0xFF9DD9A5),
    surface: Colors.white,
    onInk: Colors.white,
  );

  // Accents are deeper so light text stays readable on them.
  static const dark = AppPalette(
    ink: Color(0xFFE6ECF2),
    graphite: Color(0xFFC3CDD6),
    slate: Color(0xFF93A9BA),
    mist: Color(0xFF10161C),
    sand: Color(0xFF2A343E),
    peach: Color(0xFF9C6532),
    coral: Color(0xFFB85C45),
    teal: Color(0xFF2B7F7B),
    sky: Color(0xFF3F6C8C),
    lime: Color(0xFF4E8A5B),
    surface: Color(0xFF1A232B),
    onInk: Color(0xFF0E1B26),
  );

  static AppPalette of(Brightness brightness) =>
      brightness == Brightness.dark ? dark : light;
}

/// App colours for the current brightness. [MyApp] calls [setBrightness]
/// before building the widget tree and rebuilds it when the brightness
/// changes.
class AppColors {
  static AppPalette _palette = AppPalette.light;

  static void setBrightness(Brightness brightness) =>
      _palette = AppPalette.of(brightness);

  static Color get ink => _palette.ink;
  static Color get graphite => _palette.graphite;
  static Color get slate => _palette.slate;
  static Color get mist => _palette.mist;
  static Color get sand => _palette.sand;
  static Color get peach => _palette.peach;
  static Color get coral => _palette.coral;
  static Color get teal => _palette.teal;
  static Color get sky => _palette.sky;
  static Color get lime => _palette.lime;
  static Color get surface => _palette.surface;
  static Color get onInk => _palette.onInk;
}

class AppTheme {
  static ThemeData build(Brightness brightness) {
    final p = AppPalette.of(brightness);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: p.teal,
      brightness: brightness,
      primary: p.ink,
      onPrimary: p.onInk,
      secondary: p.teal,
      surface: p.mist,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: p.mist,
      dialogTheme: DialogThemeData(backgroundColor: p.surface),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: p.ink,
        titleTextStyle: TextStyle(
          color: p.ink,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.surface,
        indicatorColor: p.sand,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.w600,
            color: p.ink,
          ),
        ),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(
            color: p.ink,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
