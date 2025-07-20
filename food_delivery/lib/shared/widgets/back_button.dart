import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:go_router/go_router.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(AppPaths.backIcon, width: 45.w, fit: BoxFit.contain),
      onPressed: () {
        context.pop();
      },
    );
  }
}
