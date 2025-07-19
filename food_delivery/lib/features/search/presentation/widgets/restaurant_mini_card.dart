import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/shared/models/restaurant_entity.dart';

class RestaurantMiniCard extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantMiniCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              restaurant.imageUrl,
              width: 60.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(restaurant.name),
          subtitle: Row(
            children: [
              const Icon(
                Icons.star_outline,
                color: AppColors.primary,
                size: 20,
              ),
              SizedBox(width: 4.w),
              Text(
                restaurant.rating.toString(),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        // divider
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            height: 1.h,
            thickness: 1.w,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
