import 'package:flutter/material.dart';

class AppTheme {
  static const Color violet = Color(0xFF6C63FF);
  static const Color teal = Color(0xFF21B6A8);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    colorScheme: ColorScheme.fromSeed(seedColor: violet, brightness: Brightness.light),
    scaffoldBackgroundColor: const Color(0xFFF7F7FC),
    appBarTheme: const AppBarTheme(centerTitle: false, backgroundColor: Color(0xFFF7F7FC)),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    colorScheme: ColorScheme.fromSeed(seedColor: violet, brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color(0xFF11121A),
    cardTheme: CardThemeData(
      elevation: 0,
      color: const Color(0xFF1C1D2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
  );
}
