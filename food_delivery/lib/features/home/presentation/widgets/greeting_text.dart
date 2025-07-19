import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: const Text.rich(
        textAlign: TextAlign.start,
        TextSpan(
          children: [
            TextSpan(text: 'Hey Septa, '),
            TextSpan(
              text: 'Good Afternoon!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
