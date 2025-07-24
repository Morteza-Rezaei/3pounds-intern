import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:go_router/go_router.dart';

enum OrderStatus { ongoing, completed, cancelled }

class OrderCard extends StatelessWidget {
  final String type;
  final String imageUrl;
  final String title;
  final String orderId;
  final double price;
  final int items;
  final OrderStatus status;
  final String? date;

  const OrderCard._({
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.orderId,
    required this.price,
    required this.items,
    required this.status,
    this.date,
  });

  factory OrderCard.ongoing({
    required String type,
    required String imageUrl,
    required String title,
    required double price,
    required int items,
    required String orderId,
  }) {
    return OrderCard._(
      type: type,
      imageUrl: imageUrl,
      title: title,
      price: price,
      items: items,
      orderId: orderId,
      status: OrderStatus.ongoing,
    );
  }

  factory OrderCard.history({
    required String type,
    required String imageUrl,
    required String title,
    required double price,
    required int items,
    required String orderId,
    required OrderStatus status,
    required String date,
  }) {
    return OrderCard._(
      type: type,
      imageUrl: imageUrl,
      title: title,
      price: price,
      items: items,
      orderId: orderId,
      status: status,
      date: date,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isHistory = status != OrderStatus.ongoing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // if its history, show compeleted text also
        Container(
          margin: EdgeInsets.only(bottom: 4.h, top: 8.h),
          child: Row(
            children: [
              Text(
                type,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              if (isHistory) ...[
                SizedBox(width: 40.w),
                Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.symmetric(vertical: 16.r),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade200, width: 1.5),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // rounded image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      imageUrl,
                      width: 64.w,
                      height: 64.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Row(
                            children: [
                              Text(
                                '\$$price',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              date != null
                                  ? Text(
                                      date!,
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.sp,
                                      ),
                                    )
                                  : Text(
                                      '$items Items',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(orderId, style: TextStyle(color: Colors.grey.shade500)),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (status == OrderStatus.ongoing) {
                          context.push('/track-order');
                        } else {
                          context.push('/track-order');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(isHistory ? 'Re-Order' : 'Track Order'),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primary),
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(isHistory ? 'Rate' : 'Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
