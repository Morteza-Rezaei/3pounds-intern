import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class MealDescription extends StatelessWidget {
  final String description;
  final double? fontSize;
  final Color? textColor;

  const MealDescription({
    super.key,
    required this.description,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        color: textColor ?? AppColors.lightGray,
      ),
    );
  }
}
