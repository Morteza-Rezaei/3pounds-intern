import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF491B6D),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF491B6D),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}

// other app colors
class AppColors {
  static const Color primaryColor = Color(0xFF491B6D);
}
