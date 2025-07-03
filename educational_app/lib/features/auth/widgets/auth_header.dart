import 'package:educational_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;

  const AuthHeaderWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imagePath != null)
          Image.asset(imagePath!, width: 160.r, fit: BoxFit.fitWidth),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),
          ),
      ],
    );
  }
}
