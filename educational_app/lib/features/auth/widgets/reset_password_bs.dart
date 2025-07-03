import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      ResetPasswordBottomSheetState();
}

class ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
              title: AppStrings.resetPasswordSuccessTitle,
              subtitle: AppStrings.resetPasswordSuccessSubtitle,
            ),

            SizedBox(height: 20.h),
            CustomButton(
              text: AppStrings.proceedToLogin,
              onPressed: () {
                context.go('/login');
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
