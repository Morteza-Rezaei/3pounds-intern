import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/router/app_router.dart';
import 'package:food_delivery/config/theme/app_theme.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔥 BU ŞART
  await Hive.initFlutter(); // Hive başlat
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
        return MaterialApp.router(
          title: 'Food Delivery App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(context),
          routerConfig: appRouter,
        );
      },
    );
  }
}
