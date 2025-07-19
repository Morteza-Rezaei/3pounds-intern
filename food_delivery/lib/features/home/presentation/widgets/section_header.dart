import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),

          GestureDetector(
            onTap: () {
              // Todo: Handle "See All" tap
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('See All tapped')));
            },
            child: Row(
              children: [
                Text('See All', style: TextStyle(fontSize: 14.sp)),
                SizedBox(width: 12.w),
                Icon(Icons.arrow_forward_ios, size: 16.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
