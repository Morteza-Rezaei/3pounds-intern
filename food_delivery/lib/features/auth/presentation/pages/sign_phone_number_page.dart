import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:go_router/go_router.dart';

class SignPhoneNumberPage extends StatelessWidget {
  const SignPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<SignUpBloc, SignUpState>(
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
                      text: 'Get started with\nHunger ',
                      highlightedText: 'Hub',
                    ),
                    SectionSubtitle(
                      text:
                          'Enter your phone number to use Hunger hub and enjoy',
                    ),
                    AuthTextField(
                      labelText: 'Phone Number',
                      fieldType: AuthFieldType.phone,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(PhoneNumberEvent(value));
                      },
                    ),

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

                          context.push('/verify-phone-number');
                        }
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
