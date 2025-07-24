import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_state.dart';
import 'package:food_delivery/features/home/presentation/widgets/category_card.dart';
import 'package:food_delivery/features/home/presentation/widgets/greeting_text.dart';

import 'package:food_delivery/shared/dummy/dummy_restaurants.dart';
import 'package:food_delivery/shared/models/category_model.dart';
import 'package:food_delivery/shared/widgets/restaurant_card.dart';
import 'package:food_delivery/features/home/presentation/widgets/search_textfield.dart';
import 'package:food_delivery/features/home/presentation/widgets/section_header.dart';
import 'package:food_delivery/shared/widgets/app_bar_address_title.dart';
import 'package:food_delivery/shared/widgets/app_bar_cart.dart';
import 'package:food_delivery/shared/widgets/app_bar_menu.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarMenu(),
        title: AppBarAddressTitle(),
        actions: [AppBarCart()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GreetingText(),
            SearchTextField(),

            SectionHeader(
              title: 'All Categories',
              onSeeAllTapped: () {
                context.push('/foods', extra: null);
              },
            ),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoriesLoaded) {
                  final categories = state.categories;

                  return SizedBox(
                    height: 180.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          category: CategoryModel(
                            name: category.name,
                            imageUrl: category.thumbnail,
                          ),
                          onTap: () {
                            context.push('/foods', extra: category.name);
                          },
                        );
                      },
                    ),
                  );
                } else if (state is CategoriesError) {
                  return Center(child: Text('Hata: ${state.message}'));
                }

                return const SizedBox.shrink();
              },
            ),

            SectionHeader(title: 'Open Restaurants'),
            SizedBox(height: 8.h),
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
