import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/complete_phone_bloc/complete_phone_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_sub_title.dart';
import 'package:food_delivery/features/auth/presentation/widgets/section_title.dart';
import 'package:go_router/go_router.dart';

class CompletePhonePage extends StatelessWidget {
  const CompletePhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<CompletePhoneBloc, CompletePhoneState>(
        listener: (context, state) {
          if (state is CompletePhoneSuccess) {
            context.go('/complete-address');
          } else if (state is CompletePhoneFailure) {
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
                      controller: phoneController,
                      hintText: "5**-****-****",
                    ),

                    AuthButton(
                      text: "SIGN UP",
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          final phone = phoneController.text.trim();
                          context.read<CompletePhoneBloc>().add(
                            PhoneSubmitted(phone),
                          );
                          context.push('/complete-address');
                        }
                      },
                    ),
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
