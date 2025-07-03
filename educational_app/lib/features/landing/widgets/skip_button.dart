import 'package:educational_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const SkipButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 48.h,
      right: 36.w,
      child: TextButton(
        onPressed:
            onPressed ??
            () {
              // todo: navigate to sign in screen
            },
        child: Text(
          AppStrings.skip,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
