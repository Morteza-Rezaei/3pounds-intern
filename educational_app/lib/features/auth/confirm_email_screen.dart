import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:educational_app/features/auth/widgets/auth_navigation_text.dart';
import 'package:educational_app/features/auth/widgets/pin_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  String _pin = '';

  void _navigateToLogin() {
    print('Pin entered: $_pin');
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            AuthHeaderWidget(
              title: AppStrings.confirmEmailTitle,
              subtitle: AppStrings.confirmEmailSubtitle,
            ),
            SizedBox(height: 28.h),

            PinCodeWidget(
              onCompleted: (value) {
                _pin = value;
              },
            ),

            SizedBox(height: 16.h),

            CustomButton(
              text: AppStrings.resetPassword,
              onPressed: _navigateToLogin,
            ),

            SizedBox(height: 16.h),

            AuthNavigationText(
              questionText: AppStrings.didntgetCode,
              actionText: AppStrings.resendCode,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
