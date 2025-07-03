import 'package:educational_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ForgotPasswordLink({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
