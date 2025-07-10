import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/social_signin_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/term_conditions_texts.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // for the hiding or showing of the password
    // true means the password is hidden
    // false means the password is visible
    final obscurePasswordNotifier = ValueNotifier<bool>(true);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    SectionTitle(
                      text: 'Get started with\nHunger ',
                      highlightedText: 'Hub',
                    ),

                    SectionSubtitle(
                      text: 'If you already have an account,\nplease ',
                      clickableText: 'Sign in here',
                      onTap: () {
                        // Navigate to sign in page
                        context.go('/sign-in');
                      },
                    ),

                    AuthTextField(
                      labelText: 'Full Name',
                      fieldType: AuthFieldType.username,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(EmailEvent(value));
                      },
                    ),

                    AuthTextField(
                      labelText: 'Email',
                      fieldType: AuthFieldType.email,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(EmailEvent(value));
                      },
                    ),

                    AuthTextField(
                      labelText: 'Password',
                      fieldType: AuthFieldType.password,
                      obscurePasswordNotifier: obscurePasswordNotifier,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(PasswordEvent(value));
                      },
                    ),

                    // just a test button
                    AuthButton(
                      text: "SIGN UP",
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // for now just print the email and password form the bloc
                          final name = state.username;
                          final email = state.email;
                          final password = state.password;
                          print('Email: $email');
                          print('Password: $password');
                          print('Name: $name');

                          context.push('/sign-phone-number');
                        }
                      },
                    ),

                    TermsAndConditionsText(
                      onTermsTap: () {
                        // Navigate to terms and conditions page
                        print('Terms and conditions clicked');
                      },
                      onPrivacyTap: () {
                        // Navigate to privacy policy page
                        print('Privacy policy clicked');
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Or connect with",
                        style: TextStyle(
                          color: AppColors.lightGray,
                          fontSize: 14.sp,
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
