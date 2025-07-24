import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key});

  final int currentStep = 1; // 0: first active, diğerleri pasif

  @override
  Widget build(BuildContext context) {
    final steps = [
      "Your order has been received",
      "The restaurant is preparing your food",
      "Your order has been picked up for delivery",
      "Order arriving soon!",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        final isLast = index == steps.length - 1;
        final isCurrent = index == currentStep;
        final isCompleted = index < currentStep;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? Colors.orange
                        : isCompleted
                        ? Colors.orange
                        : Colors.grey,
                    border: Border.all(
                      color: isCurrent || isCompleted
                          ? Colors.transparent
                          : Colors.grey.shade400,
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: isCurrent
                      ? const Icon(Icons.refresh, color: Colors.white, size: 14)
                      : isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : const Icon(Icons.check, color: Colors.white, size: 14),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 28.h,
                    color: isCurrent
                        ? Colors.orange
                        : isCompleted
                        ? Colors.orange
                        : Colors.grey.shade400,
                  ),
              ],
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                steps[index],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: isCurrent
                      ? Colors.orange
                      : isCompleted
                      ? Colors.orange
                      : Colors.grey,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
