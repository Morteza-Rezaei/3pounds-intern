import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:go_router/go_router.dart';

class SuccessMessagePage extends StatelessWidget {
  const SuccessMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(AppPaths.exit, width: 48.w, height: 48.h),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppPaths.success, width: 200.w, height: 200.h),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16.h),
            Text(
              'You successfully made a payment,\nenjoy our service!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: AppColors.lightGray),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
