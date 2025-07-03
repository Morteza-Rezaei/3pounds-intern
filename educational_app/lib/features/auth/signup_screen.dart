import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/core/constants/app_paths.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:educational_app/features/auth/widgets/auth_navigation_text.dart';
import 'package:educational_app/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signUp() {
    _navigateToConfirmEmail();
    // if (_formKey.currentState!.validate()) {
    //   // Form geçerli, kayıt işlemi yapılabilir
    //   final userName = _userNameController.text;
    //   final email = _emailController.text;
    //   final password = _passwordController.text;

    //   print('Username: $userName, Email: $email, Password: $password');
    // }
  }

  void _navigateToLogin() {
    context.go('/login');
  }

  void _navigateToConfirmEmail() {
    context.push('/confirm-email');
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                SizedBox(height: 20.h),

                AuthHeaderWidget(
                  imagePath: AppPaths.logo2,
                  title: AppStrings.signUpTitle,
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  label: AppStrings.userNameLabel,
                  hint: AppStrings.userNameHint,
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
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
                CustomTextField(
                  label: AppStrings.confirmpasswordLabel,
                  hint: AppStrings.confirmpasswordHint,
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                CustomButton(
                  text: AppStrings.signUp,
                  onPressed: _signUp,
                  width: 320.w,
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),

                SizedBox(height: 10.h),

                AuthNavigationText(
                  questionText: AppStrings.haveAccount,
                  actionText: AppStrings.login,
                  onTap: _navigateToLogin,
                ),

                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
