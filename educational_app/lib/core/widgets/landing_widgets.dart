import 'package:educational_app/app/theme/theme.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// the skip text button
Widget skipbutton() {
  return Positioned(
    top: 48.h,
    right: 36.w,
    child: TextButton(
      onPressed: () {
        // todo: navigate to sing in screen
      },
      child: Text(
        AppStrings.skip,
        style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
      ),
    ),
  );
}

// the image widget for the landing page
Widget landingImage({required String imagePath}) {
  return Positioned(
    top: 100.h,
    child: Image.asset(
      imagePath,
      width: 300.w,
      height: 280.h,
      fit: BoxFit.contain,
    ),
  );
}

// the the title body and buttons for the landing page
Widget landingTitleBodyButtons({
  required String title,
  required String body,
  required Widget buttonsRow,
}) {
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
          width: 320.w, // Add width constraint
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

// back button widget
Widget backButton({required VoidCallback onPressed}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      textStyle: TextStyle(fontSize: 18.sp),
      foregroundColor: AppColors.primaryColor,
    ),
    child: Text(AppStrings.back),
  );
}

// next button widget
Widget nextButton({required VoidCallback onPressed}) {
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

// page indicator widget
Widget pageIndicator({required int currentPage, required int totalPages}) {
  return Positioned(
    top: 400.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: 8.r,
          height: 8.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage ? Colors.black : Colors.grey[400],
          ),
        ),
      ),
    ),
  );
}
