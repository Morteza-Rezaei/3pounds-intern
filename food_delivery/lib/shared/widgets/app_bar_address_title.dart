import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';

class AppBarAddressTitle extends StatelessWidget {
  const AppBarAddressTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deliver to',
          style: TextStyle(color: AppColors.primary, fontSize: 12.sp),
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Address tapped!')));
          },
          child: Row(
            children: [
              Text(
                'Los Angeles, USA',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 24.sp,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
