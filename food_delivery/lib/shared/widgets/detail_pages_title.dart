import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealTitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MealTitle({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
