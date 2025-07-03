import 'package:educational_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingTitleBodyButtonsWidget extends StatelessWidget {
  final String title;
  final String body;
  final Widget buttonsRow;

  const LandingTitleBodyButtonsWidget({
    super.key,
    required this.title,
    required this.body,
    required this.buttonsRow,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 440.h,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 320.w,
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 28.h),
          SizedBox(width: 320.w, child: buttonsRow),
        ],
      ),
    );
  }
}
