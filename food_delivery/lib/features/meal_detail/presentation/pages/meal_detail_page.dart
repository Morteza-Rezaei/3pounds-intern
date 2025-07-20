import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/features/meal_detail/presentation/widgets/ingredient_item.dart';
import 'package:food_delivery/shared/models/meal_entity.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:food_delivery/shared/widgets/detail_pages_description.dart';
import 'package:food_delivery/shared/widgets/detail_pages_inf_row.dart';
import 'package:food_delivery/shared/widgets/detail_pages_title.dart';
import 'package:food_delivery/shared/widgets/favorite_button.dart';

class MealDetailPage extends StatelessWidget {
  final MealEntity meal;

  const MealDetailPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    bool isLiked = true;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 80.h,
              //pinned: true, // scroll edince app bar sabit kalsın
              expandedHeight: 260.h,
              leading: BackBtn(isWhite: true),
              actions: [
                FavoriteButton(
                  isLiked: isLiked,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('beğenme butonuna tıklandı!')),
                    );
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(meal.imageUrl, fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MealTitle(title: meal.name),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Image.asset(
                          AppPaths.restaurantIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          meal.restaurantName,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    MealInfoRow(
                      rating: meal.rating.toString(),
                      delivery: meal.delivery,
                      deliveryTime: meal.deliveryTime,
                    ),
                    SizedBox(height: 16.h),
                    MealDescription(description: meal.description),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                          'Size: ',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.lightGray,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          child: Text(
                            meal.size,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text('INGREDIENTS', style: TextStyle(fontSize: 16.sp)),
                    Wrap(
                      children: meal.ingredients
                          .map(
                            (ingredient) => IngredientItem(
                              imagePath: AppPaths
                                  .ingredientIcon, // ingredient modelinizde imagePath olmalı
                              name: ingredient,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${meal.price.toString()}',
                  style: TextStyle(fontSize: 28.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.r),
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text('1', style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.r),
                        margin: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('ADD TO CART'),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
