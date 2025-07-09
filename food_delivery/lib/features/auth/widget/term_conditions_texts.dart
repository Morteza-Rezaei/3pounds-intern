import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class TermsAndConditionsText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsAndConditionsText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: AppColors.lightGray,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            const TextSpan(text: 'By signing up, you have agreed to our '),
            WidgetSpan(
              child: GestureDetector(
                onTap: onTermsTap,
                child: Text(
                  'Terms and conditions',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const TextSpan(text: ' & '),
            WidgetSpan(
              child: GestureDetector(
                onTap: onPrivacyTap,
                child: Text(
                  'Privacy policy',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
