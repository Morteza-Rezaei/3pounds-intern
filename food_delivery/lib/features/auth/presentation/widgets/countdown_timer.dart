import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownTimer extends StatelessWidget {
  final int seconds;

  const CountdownTimer({super.key, this.seconds = 60});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Stream.periodic(
        Duration(seconds: 1),
        (i) => seconds - i - 1,
      ).take(seconds).where((count) => count >= 0),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text(
            'Loading...',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          );
        }

        final remainingSeconds = snapshot.data!;
        final minutes = remainingSeconds ~/ 60;
        final seconds = remainingSeconds % 60;

        return Text(
          'Resend in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
