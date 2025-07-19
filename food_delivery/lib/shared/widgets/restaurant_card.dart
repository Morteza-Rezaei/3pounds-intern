import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/shared/models/restaurant_entity.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              restaurant.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  // the meals name
                  restaurant.meals.map((meal) => meal.category).join(' - '),
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      restaurant.rating.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.delivery_dining_outlined, size: 24.sp),
                    SizedBox(width: 4.w),
                    Text(restaurant.deliveryType),
                    SizedBox(width: 16.w),
                    Icon(Icons.timer_outlined, size: 24.sp),
                    SizedBox(width: 4.w),
                    Text(restaurant.deliveryTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
