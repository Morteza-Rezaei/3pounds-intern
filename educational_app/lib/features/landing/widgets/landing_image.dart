import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingImageWidget extends StatelessWidget {
  final String imagePath;

  const LandingImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      child: Image.asset(
        imagePath,
        width: 300.w,
        height: 280.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
