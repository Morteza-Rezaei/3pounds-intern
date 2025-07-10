import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          padding: EdgeInsets.symmetric(vertical: 15.h),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
