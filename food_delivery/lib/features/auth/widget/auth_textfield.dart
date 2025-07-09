import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/enums/auth_field_type.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final AuthFieldType fieldType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? customValidator;
  final TextInputAction? textInputAction;
  final ValueNotifier<bool>? obscurePasswordNotifier;
  final bool enableValidation;

  const AuthTextField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.fieldType,
    this.controller,
    this.onChanged,
    this.customValidator,
    this.textInputAction,
    this.obscurePasswordNotifier,
    this.enableValidation = true,
  });

  String? _getValidator(String? value) {
    if (!enableValidation) return null;

    if (customValidator != null) {
      return customValidator!(value);
    }

    switch (fieldType) {
      case AuthFieldType.email:
        if (value == null || value.isEmpty) return 'Please enter your email';
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        break;
      case AuthFieldType.password:
        if (value == null || value.isEmpty) return 'Please enter your password';
        if (value.length < 6) return 'Password must be at least 6 characters';

        List<String> errors = [];
        if (!RegExp(r"[a-z]").hasMatch(value)) {
          errors.add('• At least one lowercase letter');
        }
        if (!RegExp(r"[A-Z]").hasMatch(value)) {
          errors.add('• At least one uppercase letter');
        }
        if (!RegExp(r"[0-9]").hasMatch(value)) {
          errors.add('• At least one number');
        }

        if (errors.isNotEmpty) {
          return 'Password must contain:\n${errors.join("\n")}';
        }
        break;
      case AuthFieldType.username:
        if (value == null || value.isEmpty) return 'Please enter your username';
        if (value.length < 3) return 'Username must be at least 3 characters';
        if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
          return 'Username can only contain letters, numbers and underscore';
        }
        break;
      case AuthFieldType.phone:
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = fieldType == AuthFieldType.password;
    final keyboardType = fieldType == AuthFieldType.email
        ? TextInputType.emailAddress
        : fieldType == AuthFieldType.phone
        ? TextInputType.phone
        : TextInputType.text;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5.h),
          isPassword && obscurePasswordNotifier != null
              ? ValueListenableBuilder<bool>(
                  valueListenable: obscurePasswordNotifier!,
                  builder: (context, obscurePassword, child) {
                    return TextFormField(
                      controller: controller,
                      obscureText: obscurePassword,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction ?? TextInputAction.next,
                      decoration: InputDecoration(
                        hintText:
                            hintText ?? 'Enter your ${labelText.toLowerCase()}',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            obscurePasswordNotifier!.value =
                                !obscurePasswordNotifier!.value;
                          },
                        ),
                      ),
                      validator: _getValidator,
                      onChanged: onChanged,
                    );
                  },
                )
              : TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction ?? TextInputAction.next,
                  decoration: InputDecoration(
                    hintText:
                        hintText ?? 'Enter your ${labelText.toLowerCase()}',
                  ),
                  validator: _getValidator,
                  onChanged: onChanged,
                ),
        ],
      ),
    );
  }
}
