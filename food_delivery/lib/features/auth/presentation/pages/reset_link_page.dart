import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/features/auth/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/countdown_timer.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:go_router/go_router.dart';

class ResetLinkPage extends StatelessWidget {
  const ResetLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  // back icon
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            AppPaths.backIcon,
                            width: 45.w,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  SectionTitle(text: 'check your email'),
                  SectionSubtitle(
                    text: 'We have just sent a instructionsemail to ',
                    clickableText: state.email,
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 15.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            print('Having a problem pressed');
                          },
                          child: Text(
                            'Having a problem ?',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // a 1min timer
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: CountdownTimer(seconds: 60),
                  ),
                  AuthButton(
                    text: 'RESEND LINK',
                    onPressed: () {
                      context.go('/sign-in');
                    },
                  ),

                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
