import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // image icon from AppPaths
      icon: Image.asset(AppPaths.menuIcon, width: 45.w),
      onPressed: () {
        // todo: Handle menu action
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Menu tapped!')));
      },
    );
  }
}
