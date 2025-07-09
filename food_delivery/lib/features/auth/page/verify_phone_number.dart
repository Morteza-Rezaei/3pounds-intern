import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/features/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_delivery/features/auth/widget/auth_button.dart';
import 'package:food_delivery/features/auth/widget/countdown_timer.dart';
import 'package:food_delivery/features/auth/widget/section_sub_title.dart';
import 'package:food_delivery/features/auth/widget/section_title.dart';
import 'package:food_delivery/features/auth/widget/term_conditions_texts.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    SectionTitle(text: 'Verify phone number'),
                    SectionSubtitle(
                      text: 'Enter the 4-Digit code sent to you on \n',
                      clickableText: state.phoneNumber,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(text: 'Didn’t receive ?'),
                            TextSpan(
                              text: ' Resend',
                              style: TextStyle(
                                color: AppColors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle resend code action
                                  print('Resend code tapped');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    CountdownTimer(seconds: 60),

                    // ...existing code...
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      color: Colors.transparent,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.center,
                        backgroundColor: Colors.transparent,
                        pinTheme: PinTheme(
                          fieldOuterPadding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                          ),
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: 60.h,
                          fieldWidth: 60.w,
                          activeFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          activeColor: Theme.of(context).primaryColor,
                          inactiveColor: Colors.grey.shade300,
                          selectedColor: Theme.of(context).primaryColor,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    // ...existing code...
                    AuthButton(
                      text: "SIGN UP",
                      onPressed: () {
                        context.go('/sign-in');
                      },
                    ),

                    TermsAndConditionsText(
                      onTermsTap: () {
                        print('Terms and Conditions tapped');
                      },
                      onPrivacyTap: () {
                        print('Privacy Policy tapped');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
