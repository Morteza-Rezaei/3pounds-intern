import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/home/presentation/widgets/category_card.dart';
import 'package:food_delivery/features/home/presentation/widgets/greeting_text.dart';
import 'package:food_delivery/shared/dummy/dummy_categories.dart';
import 'package:food_delivery/shared/dummy/dummy_restaurants.dart';
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
            SizedBox(
              height: 180.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: dummyCategories[index],
                    onTap: () {
                      // Handle category selection
                      print(
                        'Selected category: ${dummyCategories[index].name}',
                      );
                      context.push(
                        '/foods',
                        extra: dummyCategories[index].name,
                      );
                    },
                  );
                },
              ),
            ),

            SectionHeader(title: 'Open Restaurants'),
            SizedBox(height: 8.h),
            ...dummyRestaurants.map((e) => RestaurantCard(restaurant: e)),
          ],
        ),
      ),
    );
  }
}
