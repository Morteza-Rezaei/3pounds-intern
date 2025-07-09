import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_delivery/features/auth/widget/auth_button.dart';
import 'package:food_delivery/features/auth/widget/auth_textfield.dart';
import 'package:food_delivery/features/auth/widget/section_sub_title.dart';
import 'package:food_delivery/features/auth/widget/section_title.dart';
import 'package:food_delivery/features/auth/widget/social_signin_button.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // for the hiding or showing of the password
    // true means the password is hidden
    // false means the password is visible
    final obscurePasswordNotifier = ValueNotifier<bool>(true);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    SectionTitle(
                      text: 'Just ',
                      highlightedText: 'Sign in, ',
                      endText: "we'll\n prepare your order",
                    ),
                    SectionSubtitle(
                      text: 'If you don\'t have an account\nplease ',
                      clickableText: 'Sign up here',
                      onTap: () {
                        // Navigate to sign up page
                        print('Navigate to sign up page');
                      },
                    ),

                    AuthTextField(
                      labelText: 'Email',
                      fieldType: AuthFieldType.email,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      },
                    ),

                    AuthTextField(
                      labelText: 'Password',
                      fieldType: AuthFieldType.password,
                      obscurePasswordNotifier: obscurePasswordNotifier,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextButton(
                            onPressed: () {
                              context.push('/forgot-password');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.lightGray,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // just a test button
                    AuthButton(
                      text: "SIGN IN",
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // for now just print the email and password form the bloc
                          final email = state.email;
                          final password = state.password;
                          print('Email: $email');
                          print('Password: $password');
                        }
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: AppColors.lightGray,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SocialSignInButton(
                      text: 'Connect with Facebook',
                      iconPath: AppPaths.facebookIcon,
                      onPressed: () {
                        // Handle Facebook sign-in
                        print('Facebook sign-in clicked');
                      },
                    ),

                    SocialSignInButton(
                      text: 'Connect with Google',
                      iconPath: AppPaths.googleIcon,
                      onPressed: () {
                        // Handle Google sign-in
                        print('Google sign-in clicked');
                      },
                    ),

                    SizedBox(height: 10.h),
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
