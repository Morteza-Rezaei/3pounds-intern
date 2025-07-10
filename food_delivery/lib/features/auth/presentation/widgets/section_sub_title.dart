import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class SectionSubtitle extends StatelessWidget {
  final String text;
  final String? clickableText;
  final String? endText;
  final VoidCallback? onTap;

  const SectionSubtitle({
    super.key,
    required this.text,
    this.clickableText,
    this.endText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: text),
            if (clickableText != null)
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: clickableText!,
                style: TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (endText != null) TextSpan(text: endText!),
          ],
        ),
      ),
    );
  }
}
