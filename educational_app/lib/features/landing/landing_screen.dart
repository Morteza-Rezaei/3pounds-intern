import 'package:educational_app/app/widgets/back_button.dart';
import 'package:educational_app/app/widgets/next_button.dart';
import 'package:educational_app/core/constants/app_paths.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/features/landing/widgets/body_widgets.dart';
import 'package:educational_app/features/landing/widgets/landing_image.dart';
import 'package:educational_app/features/landing/widgets/page_indicator.dart';
import 'package:educational_app/features/landing/widgets/skip_button.dart';
import 'package:educational_app/providers/landing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(currentPageProvider);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              ref.read(currentPageProvider.notifier).state = index;
            },
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  LandingImageWidget(imagePath: AppPaths.landing1),
                  LandingTitleBodyButtonsWidget(
                    title: AppStrings.landingTitle1,
                    body: AppStrings.landingBody1,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButtonWidget(
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  LandingImageWidget(imagePath: AppPaths.landing2),
                  LandingTitleBodyButtonsWidget(
                    title: AppStrings.landingTitle2,
                    body: AppStrings.landingBody2,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButtonWidget(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        NextButtonWidget(
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  LandingImageWidget(imagePath: AppPaths.landing3),
                  LandingTitleBodyButtonsWidget(
                    title: AppStrings.landingTitle3,
                    body: AppStrings.landingBody3,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButtonWidget(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        NextButtonWidget(
                          onPressed: () {
                            context.go('/login');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SkipButtonWidget(
            onPressed: () {
              context.go('/login');
            },
          ),
          PageIndicatorWidget(currentPage: currentPage, totalPages: 3),
        ],
      ),
    );
  }
}
