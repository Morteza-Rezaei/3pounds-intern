import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final String? highlightedText;
  final String? endText;

  const SectionTitle({
    super.key,
    required this.text,
    this.highlightedText,
    this.endText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: text),
            if (highlightedText != null)
              TextSpan(
                text: highlightedText!,
                style: TextStyle(color: AppColors.red),
              ),
            if (endText != null) TextSpan(text: endText!),
          ],
        ),
      ),
    );
  }
}
