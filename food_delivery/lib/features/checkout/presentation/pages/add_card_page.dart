import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/checkout/presentation/widgets/card_text_field.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final expireController = TextEditingController();
    final cvcController = TextEditingController();

    return Scaffold(
      appBar: AppBar(leading: BackBtn(), title: const Text('Add Card')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardTextField(
              label: 'Card Holder Name',
              controller: nameController,
              hint: 'Your full name',
            ),
            CardTextField(
              label: 'Card Number',
              controller: numberController,
              inputType: TextInputType.number,
              hint: '1234 5678 9012 3456',
              inputFormatters: [CardNumberInputFormatter()],
            ),
            Row(
              children: [
                Expanded(
                  child: CardTextField(
                    label: 'Expire Date',
                    controller: expireController,
                    hint: 'mm/yyyy',
                    inputType: TextInputType.datetime,
                    inputFormatters: [ExpiryDateFormatter()],
                  ),
                ),
                SizedBox(width: 32.w),
                Expanded(
                  child: CardTextField(
                    label: 'CVC',
                    controller: cvcController,
                    hint: '***',
                    inputType: TextInputType.number,
                    obscureText: true,
                    inputFormatters: [CvcInputFormatter()],
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                onPressed: () {
                  // Handle add card action
                  // For now, just pop the page
                  Navigator.pop(context);
                },
                child: const Text('ADD & MAKE PAYMENT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
