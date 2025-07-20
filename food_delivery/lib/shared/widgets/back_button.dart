import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:go_router/go_router.dart';

class BackBtn extends StatelessWidget {
  final bool isWhite;
  const BackBtn({super.key, this.isWhite = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        decoration: isWhite
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(25), // Yuvarlak gölge için
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 12,
                    offset: const Offset(0, 0),
                  ),
                ],
              )
            : null,
        child: Image.asset(
          isWhite ? AppPaths.backIconWhite : AppPaths.backIcon,
          width: 45.w,
          fit: BoxFit.contain,
        ),
      ),
      onPressed: () {
        context.pop();
      },
    );
  }
}
