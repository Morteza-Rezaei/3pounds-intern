import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_state.dart';
import 'package:food_delivery/shared/dummy/dummy_categories.dart';
import 'package:food_delivery/shared/models/restaurant_entity.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:food_delivery/shared/widgets/detail_pages_description.dart';
import 'package:food_delivery/shared/widgets/detail_pages_inf_row.dart';
import 'package:food_delivery/shared/widgets/detail_pages_title.dart';
import 'package:food_delivery/shared/widgets/meal_card.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetailPage extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> selectedCategory = ValueNotifier(null);
    final ValueNotifier<String?> selectedKeyword = ValueNotifier(null);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80.h,
            expandedHeight: 280.h,
            leading: BackBtn(isWhite: true),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('more butonuna tıklandı!')),
                      );
                    },
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(restaurant.imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MealInfoRow(
                    rating: restaurant.rating.toString(),
                    delivery: restaurant.deliveryType,
                    deliveryTime: restaurant.deliveryTime,
                  ),
                  SizedBox(height: 8.h),
                  MealTitle(title: restaurant.name),
                  SizedBox(height: 8.h),
                  MealDescription(description: restaurant.description),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                ValueListenableBuilder<String?>(
                  valueListenable: selectedKeyword,
                  builder: (context, selected, _) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: dummyCategories.map((category) {
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
                ),
                BlocBuilder<MealsBloc, MealsState>(
                  builder: (context, state) {
                    if (state is MealsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MealsLoaded) {
                      final meals = state.meals;

                      return ValueListenableBuilder<String?>(
                        valueListenable: selectedCategory,
                        builder: (context, selected, _) {
                          final filteredMeals = selected == null
                              ? meals
                              : meals
                                    .where(
                                      (meal) => meal.name
                                          .toLowerCase()
                                          .contains(selected.toLowerCase()),
                                    )
                                    .toList();

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(16.r),
                            itemCount: filteredMeals.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                      );
                    } else if (state is MealsError) {
                      return Center(child: Text('Hata: ${state.message}'));
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 64.h)), // Bottom padding
        ],
      ),
    );
  }
}
