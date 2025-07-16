import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/social_signin_button.dart';
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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome back, ${state.user.uid}')),
            );
            context.go('/home');
          } else if (state is SignInNeedsProfileCompletion) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please complete your profile')),
            );
            context.go('/complete-phone');
          } else if (state is SignInError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Form(
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
                        context.go('/sign-up');
                      },
                    ),

                    AuthTextField(
                      labelText: 'Email',
                      fieldType: AuthFieldType.email,
                      controller: emailController,
                    ),

                    AuthTextField(
                      labelText: 'Password',
                      fieldType: AuthFieldType.password,
                      obscurePasswordNotifier: obscurePasswordNotifier,
                      controller: passwordController,
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
                          context.read<SignInBloc>().add(
                            SignInRequested(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
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
                        context.read<SignInBloc>().add(
                          SignInWithGooglePressed(),
                        );
                      },
                    ),

                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
