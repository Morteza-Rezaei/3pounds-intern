import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_state.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_state.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:food_delivery/shared/widgets/meal_card.dart';
import 'package:food_delivery/features/search/presentation/widgets/restaurant_mini_card.dart';
import 'package:food_delivery/shared/dummy/dummy_categories.dart';
import 'package:food_delivery/shared/dummy/dummy_restaurants.dart';
import 'package:food_delivery/shared/widgets/app_bar_cart.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  final String searchTerm;

  const SearchPage({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: searchTerm);

    final ValueNotifier<String?> selectedKeyword = ValueNotifier(null);

    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        title: const Text('Search'),
        actions: [AppBarCart()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text('Recent Keywords', style: TextStyle(fontSize: 20.sp)),
            ),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const SizedBox(
                    height: 48,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is CategoriesLoaded) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: selectedKeyword,
                    builder: (context, selected, _) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: state.categories.map((category) {
                            final isSelected = category.name == selected;

                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: ChoiceChip(
                                checkmarkColor: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                label: Text(
                                  category.name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (_) {
                                  selectedKeyword.value = isSelected
                                      ? null
                                      : category.name;
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45.r),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                                backgroundColor: Colors.white,
                                selectedColor: AppColors.primary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.h,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),

            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'Suggested Restaurants',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),

            SizedBox(
              height: 220.h,
              child: ListView.builder(
                itemCount: dummyRestaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantMiniCard(
                    restaurant: dummyRestaurants[index],
                  );
                },
              ),
            ),

            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Popular Fast Food',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 12.h),

            BlocBuilder<MealsBloc, MealsState>(
              builder: (context, state) {
                if (state is MealsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MealsLoaded) {
                  final meals = state.meals;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: meals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 1 / 1,
                    ),
                    itemBuilder: (context, index) {
                      return MealCard(
                        meal: meals[index],
                        mealDetailCallback: () {
                          context.push('/meal-detail', extra: meals[index]);
                        },
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
