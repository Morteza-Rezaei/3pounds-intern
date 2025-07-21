import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/features/foods/presentation/widgets/category_bottom_sheet.dart';
import 'package:food_delivery/features/foods/presentation/widgets/category_filter_button.dart';
import 'package:food_delivery/features/foods/presentation/widgets/icon_action_button.dart';
import 'package:food_delivery/shared/dummy/dummy_restaurants.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:food_delivery/shared/widgets/meal_card.dart';
import 'package:food_delivery/shared/widgets/restaurant_card.dart';
import 'package:go_router/go_router.dart';

class FoodsPage extends StatelessWidget {
  final String? initialCategory;
  const FoodsPage({super.key, this.initialCategory});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> selectedCategory = ValueNotifier(
      initialCategory,
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        title: ValueListenableBuilder<String?>(
          valueListenable: selectedCategory,
          builder: (context, value, _) {
            return CategoryFilterButton(
              label: value ?? 'All',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  builder: (context) {
                    return CategoryBottomSheet(
                      selectedCategory: value,
                      onCategorySelected: (selected) {
                        selectedCategory.value = selected;
                      },
                    );
                  },
                );
              },
            );
          },
        ),

        actions: [
          IconActionButton(iconPath: AppPaths.searchIcon, onPressed: () {}),
          IconActionButton(iconPath: AppPaths.filterIcon, onPressed: () {}),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ValueListenableBuilder<String?>(
                valueListenable: selectedCategory,
                builder: (context, selected, _) {
                  final label = selected ?? 'All';
                  return Text(
                    '$label Meals',
                    style: TextStyle(fontSize: 20.sp),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            ValueListenableBuilder<String?>(
              valueListenable: selectedCategory,
              builder: (context, selected, _) {
                final allMeals = dummyRestaurants.expand((r) => r.meals);
                final filteredMeals = selected == null
                    ? allMeals.toList()
                    : allMeals
                          .where((meal) => meal.category == selected)
                          .toList();

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16.r),
                  itemCount: filteredMeals.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return MealCard(
                      meal: filteredMeals[index],
                      addToCartVisible: true,
                      mealDetailCallback: () {
                        context.push(
                          '/meal-detail',
                          extra: filteredMeals[index],
                        );
                      },
                    );
                  },
                );
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Open Restaurants',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            ...dummyRestaurants.map(
              (e) => RestaurantCard(
                restaurant: e,
                restaurantDetailCallback: () {
                  context.push('/restaurant-detail', extra: e);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
