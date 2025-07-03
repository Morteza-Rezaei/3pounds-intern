import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:educational_app/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  final _resetEmailController = TextEditingController();

  @override
  void dispose() {
    _resetEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            AuthHeaderWidget(
              title: AppStrings.forgotPasswordTitle,
              subtitle: AppStrings.forgotPasswordSubtitle,
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              label: AppStrings.emailLabel,
              hint: AppStrings.emailHint,
              controller: _resetEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: AppStrings.resetPassword,
              onPressed: () {
                Navigator.of(context).pop();
                context.push(
                  '/reset-password',
                  extra: _resetEmailController.text,
                );
                _resetEmailController.clear();
              },
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
