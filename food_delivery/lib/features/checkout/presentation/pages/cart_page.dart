import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      {
        'image': AppPaths.buffaloPizza,
        'name': 'Pizza Calzone European',
        'price': 64,
        'quantity': 2,
      },
      {
        'image': AppPaths.pizzaKing,
        'name': 'Pizza Calzone European',
        'price': 32,
        'quantity': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(leading: BackBtn(), title: const Text('Cart')),
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemCount: cartItems.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.asset(
                  '${item['image']}',
                  width: 130.w,
                  height: 120.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${item['name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Icon(Icons.close, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              '\$${item['price']}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          iconSize: 20.sp,
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          '${item['quantity']}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          iconSize: 20.sp,
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _CartBottomSection(),
    );
  }
}

class _CartBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundwhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DELIVERY ADDRESS',
                style: TextStyle(fontSize: 14.sp, color: AppColors.lightGray),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'EDIT',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              '2118 Thornridge Cir. Syracuse',
              style: TextStyle(fontSize: 14.sp, color: AppColors.lightGray),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TOTAL:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightGray,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text('\$96', style: TextStyle(fontSize: 30.sp)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8.w),
                  Text(
                    'Breakdown',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push('/payment-method');
              },
              child: const Text('PLACE ORDER'),
            ),
          ),
        ],
      ),
    );
  }
}
