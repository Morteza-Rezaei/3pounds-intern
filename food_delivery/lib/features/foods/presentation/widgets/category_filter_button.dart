import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class CategoryFilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CategoryFilterButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        side: BorderSide(color: AppColors.lowghtGray, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(label),
          ),
          Icon(Icons.arrow_drop_down, color: AppColors.primary, size: 32.sp),
        ],
      ),
    );
  }
}
