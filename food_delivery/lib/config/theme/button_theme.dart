// the apps elevated button theme
import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/decoration.dart';

// the app elevated button theme
ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: AppDecorations.buttonRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
  );
}
