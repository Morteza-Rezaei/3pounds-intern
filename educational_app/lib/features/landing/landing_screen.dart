import 'package:educational_app/core/constants/app_paths.dart';
import 'package:educational_app/core/constants/app_strings.dart';
import 'package:educational_app/core/widgets/landing_widgets.dart';
import 'package:educational_app/providers/landing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          skipbutton(),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              ref.read(currentPageProvider.notifier).state = index;
            },
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  landingImage(imagePath: AppPaths.landing1),
                  landingTitleBodyButtons(
                    title: AppStrings.landingTitle1,
                    body: AppStrings.landingBody1,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        nextButton(
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
                  landingImage(imagePath: AppPaths.landing2),
                  landingTitleBodyButtons(
                    title: AppStrings.landingTitle2,
                    body: AppStrings.landingBody2,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        backButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        nextButton(
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
                  landingImage(imagePath: AppPaths.landing3),
                  landingTitleBodyButtons(
                    title: AppStrings.landingTitle3,
                    body: AppStrings.landingBody3,
                    buttonsRow: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        backButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        nextButton(
                          onPressed: () {
                            // todo: navigate to sign up or login page
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          pageIndicator(currentPage: currentPage, totalPages: 3),
        ],
      ),
    );
  }
}
