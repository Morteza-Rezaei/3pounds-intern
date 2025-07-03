import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/core/constants/app_paths.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:educational_app/features/auth/widgets/auth_navigation_text.dart';
import 'package:educational_app/features/auth/widgets/custom_textfield.dart';
import 'package:educational_app/features/auth/widgets/forgot_password_btn.dart';
import 'package:educational_app/features/auth/widgets/forgot_password_bs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signIn() {
    context.go('/home');
    // if (_formKey.currentState!.validate()) {
    //   // Form geçerli, giriş işlemi yapılabilir
    //   final email = _emailController.text;
    //   final password = _passwordController.text;

    //   print('Email: $email, Password: $password');
    // }
  }

  void _navigateToSignUp() {
    context.go('/signup');
  }

  void _showForgotPasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ForgotPasswordBottomSheet(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeaderWidget(
                  imagePath: AppPaths.logo2,
                  title: AppStrings.loginTitle,
                  subtitle: AppStrings.loginSubtitle,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: AppStrings.emailLabel,
                  hint: AppStrings.emailHint,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: AppStrings.passwordLabel,
                  hint: AppStrings.passwordHint,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                ForgotPasswordLink(
                  text: AppStrings.forgotPassword,
                  onTap: _showForgotPasswordBottomSheet,
                ),
                CustomButton(
                  text: AppStrings.loginButton,
                  onPressed: _signIn,
                  width: 320.w,
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),

                SizedBox(height: 10.h),

                AuthNavigationText(
                  questionText: AppStrings.dontHaveAccount,
                  actionText: AppStrings.signUp,
                  onTap: _navigateToSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
