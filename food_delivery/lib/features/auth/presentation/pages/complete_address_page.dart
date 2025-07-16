import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';
import 'package:food_delivery/features/auth/presentation/blocs/complete_address_bloc/complete_address_bloc.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:go_router/go_router.dart';

class CompleteAddressPage extends StatelessWidget {
  const CompleteAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final fullAddress = TextEditingController();
    final street = TextEditingController();
    final postCode = TextEditingController();
    final appartment = TextEditingController();

    final ValueNotifier<String> label = ValueNotifier('Home');

    return Scaffold(
      body: BlocConsumer<CompleteAddressBloc, CompleteAddressState>(
        listener: (context, state) {
          if (state is CompleteAddressSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Address completed successfully!')),
            );
            context.go('/home');
          } else if (state is CompleteAddressFailure) {
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
                    Image.asset(
                      AppPaths.completeAddress,
                      width: double.infinity,
                      height: 250.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20.h),
                    AuthTextField(
                      labelText: 'Full Address',
                      fieldType: AuthFieldType.address,
                      controller: fullAddress,
                      hintText: '123 Main St, City, Country',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextField(
                            labelText: 'Street',
                            fieldType: AuthFieldType.text,
                            controller: street,
                            hintText: 'Main Street',
                          ),
                        ),
                        Expanded(
                          child: AuthTextField(
                            labelText: 'Post Code',
                            fieldType: AuthFieldType.number,
                            controller: postCode,
                            hintText: '00000',
                          ),
                        ),
                      ],
                    ),
                    AuthTextField(
                      labelText: 'Apartment/Unit',
                      fieldType: AuthFieldType.text,
                      controller: appartment,
                      hintText: 'Apt 4B',
                    ),

                    SizedBox(height: 20.h),
                    ValueListenableBuilder(
                      valueListenable: label,
                      builder: (context, selected, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ['Home', 'Work', 'Other'].map((value) {
                            final isSelected = value == selected;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isSelected
                                      ? AppColors.red
                                      : Colors.grey.shade200,
                                  foregroundColor: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 14.h,
                                  ),
                                ),
                                onPressed: () => label.value = value,
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),

                    AuthButton(
                      text: "SUBMIT",
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          final addressMap = {
                            'fullAddress': fullAddress.text.trim(),
                            'street': street.text.trim(),
                            'postCode': postCode.text.trim(),
                            'appartment': appartment.text.trim(),
                            'label': label.value,
                          };

                          context.read<CompleteAddressBloc>().add(
                            AddressSubmitted(addressMap),
                          );
                          context.go('/home');
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
