import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/theme/app_theme.dart';
import 'package:food_delivery/features/splash/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iPhone 12 Pro size
      builder: (context, child) {
        return MaterialApp(
          title: 'Food Delivery App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(context),
          home: SplashPage(),
        );
      },
    );
  }
}
