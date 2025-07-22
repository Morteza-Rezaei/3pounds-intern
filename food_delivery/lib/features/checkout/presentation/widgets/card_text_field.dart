import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:flutter/services.dart';

class CardTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CardTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.inputAction,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(fontSize: 14.sp, color: AppColors.lightGray),
          ),
          SizedBox(height: 6.h),
          TextFormField(
            inputFormatters: inputFormatters,
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType,
            textInputAction: inputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 16.w,
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              filled: true,
              fillColor: AppColors.backgroundwhite,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Kart numarası için 16 hane, 4'erli gruplar
class CardNumberInputFormatter extends TextInputFormatter {
  static const int maxDigits = 16;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Rakam olmayanları temizle
    var digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Maksimum 16 rakam
    if (digitsOnly.length > maxDigits) {
      digitsOnly = digitsOnly.substring(0, maxDigits);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != digitsOnly.length) {
        buffer.write(' ');
      }
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Tarih için MM/YY formatı
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length > 6) {
      text = text.substring(0, 6);
    }

    if (text.length >= 3) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

/// CVC için sadece 3 hane
class CvcInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length > 3) {
      text = text.substring(0, 3);
    }
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
