// the apps Textfield theme
import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/decoration.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    // backgroundColor: AppColors.grayLight,
    fillColor: AppColors.textFieldFill,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.gray, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.primary, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.red, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.gray, width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppDecorations.textFieldRadius,
      borderSide: BorderSide(color: AppColors.gray, width: 0.5),
    ),
  );
}
