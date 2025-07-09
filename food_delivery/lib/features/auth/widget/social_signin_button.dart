import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String iconPath;
  final double iconSize;

  const SocialSignInButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.iconPath,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: Text(text),
        icon: Image.asset(iconPath, width: iconSize.w, height: iconSize.h),
      ),
    );
  }
}
