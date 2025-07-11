import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final HiveUserService _hive = HiveUserService();
  final firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 1));

    final isFirst = await _hive.isFirstOpen();
    final uid = await _hive.getUserId();

    if (!mounted) return;

    if (isFirst) {
      context.go('/welcome');
    } else if (firebaseUser != null && uid != null && uid.isNotEmpty) {
      context.go('/home');
    } else {
      context.go('/sign-in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppPaths.splash, width: 260.r, height: 260.r),
          Text(
            'Welcome to \nFood Delivery App',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
          ),
          SizedBox(height: 20.h),
          SpinKitThreeBounce(color: AppColors.primary, size: 24.r),
        ],
      ),
    );
  }
}
