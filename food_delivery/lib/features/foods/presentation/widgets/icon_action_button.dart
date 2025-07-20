import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconActionButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final double size;

  const IconActionButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.size = 45,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(iconPath, width: size.w, fit: BoxFit.contain),
      onPressed: onPressed,
    );
  }
}
