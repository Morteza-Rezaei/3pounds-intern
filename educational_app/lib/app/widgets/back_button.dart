import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 18.sp),
        foregroundColor: AppColors.primaryColor,
      ),
      child: Text(AppStrings.back),
    );
  }
}
