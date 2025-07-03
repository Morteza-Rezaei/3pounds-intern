import 'package:educational_app/app/widgets/custom_button.dart';
import 'package:educational_app/features/auth/widgets/auth_header.dart';
import 'package:educational_app/features/auth/widgets/custom_textfield.dart';
import 'package:educational_app/features/auth/widgets/reset_password_bs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_strings.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _showResetSuccessBs() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ResetPasswordBottomSheet(),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              AuthHeaderWidget(title: AppStrings.resetPasswordTitle),
              SizedBox(height: 28.h),
              CustomTextField(
                controller: _newPasswordController,
                label: AppStrings.resetPasswordPasswordLabel,
                hint: AppStrings.resetPasswordPasswordHint,
                isPassword: true,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a new password';
                //   }
                //   if (value.length < 6) {
                //     return 'Password must be at least 6 characters';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                controller: _confirmPasswordController,
                label: AppStrings.resetPasswordConfirmLabel,
                hint: AppStrings.resetPasswordConfirmHint,
                isPassword: true,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please confirm your password';
                //   }
                //   if (value != _newPasswordController.text) {
                //     return 'Passwords do not match';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 28.h),
              CustomButton(
                text: AppStrings.resetPassword,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showResetSuccessBs();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
