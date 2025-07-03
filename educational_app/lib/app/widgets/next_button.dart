import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18.sp),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(AppStrings.next),
    );
  }
}
