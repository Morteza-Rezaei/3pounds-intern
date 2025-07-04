import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final String duration;

  const CourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 64.w, height: 64.w, fit: BoxFit.cover),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(rating.toString(), style: TextStyle(fontSize: 14.sp)),
                    SizedBox(width: 8.w),
                    Icon(Icons.access_time, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(duration, style: TextStyle(fontSize: 14.sp)),
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
