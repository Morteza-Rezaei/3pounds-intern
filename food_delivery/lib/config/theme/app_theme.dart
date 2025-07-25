import 'package:flutter/material.dart';
import 'package:food_delivery/config/theme/button_theme.dart';
import 'package:food_delivery/config/theme/text_theme_config.dart';
import 'package:food_delivery/config/theme/textfield_theme.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFF7622);

  static ThemeData lightTheme(BuildContext context) {
    // In Here we set the app's font
    final textTheme = createTextTheme(context, "Roboto", "Roboto");

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 80,
        titleSpacing: 4,
      ),
      elevatedButtonTheme: elevatedButtonTheme(),
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }
}
