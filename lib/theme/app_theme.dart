import 'package:flutter/material.dart';

class AppColors {
  static const ink = Color(0xFF0E1B26);
  static const graphite = Color(0xFF243443);
  static const slate = Color(0xFF4C6B82);
  static const mist = Color(0xFFF6F2EB);
  static const sand = Color(0xFFF0E6D8);
  static const peach = Color(0xFFF5C28B);
  static const coral = Color(0xFFF2997A);
  static const teal = Color(0xFF2E8C88);
  static const sky = Color(0xFF77A6C6);
  static const lime = Color(0xFF9DD9A5);
}

class AppTheme {
  static ThemeData build() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.teal,
      brightness: Brightness.light,
      primary: AppColors.ink,
      secondary: AppColors.teal,
      surface: AppColors.mist,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.mist,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.ink,
        titleTextStyle: TextStyle(
          color: AppColors.ink,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.sand,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(
            color: AppColors.ink,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
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
