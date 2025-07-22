import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool hasCard = false;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _tab(iconPath: AppPaths.cash, label: 'Cash'),
                  _tab(iconPath: AppPaths.visa, label: 'Visa'),
                  _tab(
                    iconPath: AppPaths.mastercard,
                    label: 'Mastercard',
                    selected: true,
                  ),
                  _tab(iconPath: AppPaths.paypal, label: 'PayPal'),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            hasCard ? _buildSelectedCard() : _buildEmptyCard(),

            SizedBox(height: 16.h),
            _addNewButton(() {
              // go to AddCardPage
              context.push('/add-card');
            }),

            const Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('TOTAL:', style: TextStyle(fontSize: 14.sp)),
                    SizedBox(width: 16.w),
                    Text(
                      '\$90.00',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle payment confirmation
                      context.push('/success-message');
                    },

                    child: const Text('PAY & CONFIRM'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab({
    required String iconPath,
    required String label,
    bool selected = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 90.w,
              height: 75.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: selected ? AppColors.primary : Colors.grey.shade300,
                  width: selected ? 2 : 1,
                ),
                color: selected ? Colors.white : AppColors.backgroundwhite,
              ),
              child: Center(child: Image.asset(iconPath, height: 28.h)),
            ),
            if (selected)
              Positioned(
                right: 10.r,
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Icon(Icons.check, size: 16.r, color: Colors.white),
                ),
              ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: selected ? AppColors.primary : AppColors.lightGray,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 20.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundwhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mastercard',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Image.asset(AppPaths.mastercard, height: 20.h),
                  SizedBox(width: 8.w),
                  Text(
                    '**** **** **** 4367',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Icon(Icons.arrow_drop_down, color: Colors.orange, size: 32.r),
        ],
      ),
    );
  }

  Widget _buildEmptyCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundwhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Image.asset(AppPaths.card, height: 120.h, fit: BoxFit.fitHeight),
          SizedBox(height: 20.h),
          Text(
            'No master card added',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'You can add a mastercard and save it for later',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.lightGray, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Widget _addNewButton(VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(Icons.add, color: AppColors.primary, size: 32.r),
        label: const Text(
          'ADD NEW',
          style: TextStyle(color: AppColors.primary),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
