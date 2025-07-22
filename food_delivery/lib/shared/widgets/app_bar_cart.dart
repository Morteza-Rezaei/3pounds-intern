import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:go_router/go_router.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/cart');
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: Stack(
          children: [
            Image.asset(AppPaths.basketIcon, width: 45.w),
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 10.sp,
                backgroundColor: AppColors.primary,
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
