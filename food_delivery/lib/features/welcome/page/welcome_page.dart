import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';
import 'package:food_delivery/features/welcome/bloc/welcome_bloc.dart';
import 'package:food_delivery/features/welcome/widget/page_indicator.dart';
import 'package:food_delivery/features/welcome/widget/page_items.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: _WelcomePageContent(),
    );
  }
}

class _WelcomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);

    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  context.read<WelcomeBloc>().add(PageChangedEvent(index));
                },
                children: [
                  WelcomePageItem(
                    imagePath: AppPaths.welcome1,
                    title: 'All your favorites',
                    description:
                        "Get all your loved foods in one once place, you just place the orer we do the rest",
                  ),
                  WelcomePageItem(
                    imagePath: AppPaths.welcome2,
                    title: 'Order from choosen chef',
                    description:
                        "Get all your loved foods in one once place, you just place the orer we do the rest",
                  ),
                  WelcomePageItem(
                    imagePath: AppPaths.welcome3,
                    title: 'Free delivery offers',
                    description:
                        "Get all your loved foods in one once place, you just place the orer we do the rest",
                  ),
                ],
              ),
              Positioned(
                top: 570.h,
                child: Column(
                  children: [
                    PageIndicatorWidget(
                      currentPage: state.pageIndex,
                      totalPages: 3,
                    ),
                    SizedBox(height: 50.h),
                    SizedBox(
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: () {
                          if (state.pageIndex < 2) {
                            // If not on the last page, go to the next page
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // If on the last page, navigate to the login page
                            // ! for now we will navigate to the splash page
                            context.go('/splash');
                          }
                        },

                        child: Text('Get Started'),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    TextButton(
                      onPressed: () {
                        // Todo: Implement skip functionality and navigate to the login page
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
