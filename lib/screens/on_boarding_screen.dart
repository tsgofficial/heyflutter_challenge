import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => HomeScreen());
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: List.generate(
                  3,
                  (index) => Row(
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                          child: Image.asset(
                              'assets/onboarding_plant${index + 1}.png')),
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: primaryColor,
                dotHeight: 5,
                dotWidth: 5,
                spacing: 5,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enjoy your',
                          style: getFont(32),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Life with',
                                style: getFont(32),
                              ),
                              TextSpan(
                                text: ' Plants',
                                style: getFontBold(32),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      if (pageController.page == 2) {
                        Get.to(() => HomeScreen());
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
