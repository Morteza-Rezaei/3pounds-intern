import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class IngredientItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final bool isAllergic;
  const IngredientItem({
    super.key,
    required this.imagePath,
    required this.name,
    this.isAllergic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.orange.withAlpha(30),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 32.r,
            height: 32.r,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          name,
          style: TextStyle(fontSize: 12.sp, color: AppColors.gray),
        ),
        if (isAllergic)
          Text(
            '(Alergy)',
            style: TextStyle(fontSize: 10.sp, color: AppColors.gray),
          ),
      ],
    );
  }
}
