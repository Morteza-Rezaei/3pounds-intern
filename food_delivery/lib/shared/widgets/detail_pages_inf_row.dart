import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class MealInfoRow extends StatelessWidget {
  final String rating;
  final String delivery;
  final String deliveryTime;

  const MealInfoRow({
    super.key,
    required this.rating,
    required this.delivery,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_border, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 4.w),
        Text(
          rating,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 24.w),
        Icon(
          Icons.delivery_dining_outlined,
          size: 24.sp,
          color: AppColors.primary,
        ),
        SizedBox(width: 4.w),
        Text(delivery),
        SizedBox(width: 24.w),
        Icon(Icons.timer_outlined, size: 24.sp, color: AppColors.primary),
        SizedBox(width: 4.w),
        Text(deliveryTime),
      ],
    );
  }
}
