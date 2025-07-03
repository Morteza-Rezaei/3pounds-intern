import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const PinCodeWidget({super.key, this.length = 4, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      obscureText: false,
      animationType: AnimationType.fade,
      mainAxisAlignment: MainAxisAlignment.center,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8.w),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.grey.shade100,
        selectedFillColor: Colors.white,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey.shade300,
        selectedColor: Theme.of(context).primaryColor,
      ),
      cursorColor: Theme.of(context).primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(offset: Offset(0, 1), color: Colors.black12, blurRadius: 10),
      ],
      beforeTextPaste: (text) {
        return true;
      },
      onCompleted: onCompleted,
    );
  }
}
