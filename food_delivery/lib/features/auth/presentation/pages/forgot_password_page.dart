import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
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
                    SectionTitle(text: 'Reset link'),
                    SectionSubtitle(
                      text:
                          'Enter your email address and we will send you the reset link',
                    ),
                    AuthTextField(
                      labelText: 'Email address',
                      fieldType: AuthFieldType.email,
                      onChanged: (value) {
                        context.read<ForgotPasswordBloc>().add(
                          EmailEvent(value),
                        );
                      },
                    ),

                    AuthButton(
                      text: 'RESET PASSWORD',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final email = state.email;
                          print('Reset password for email: $email');
                          context.push('/reset-link');
                        }
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
