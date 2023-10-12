import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  Center(
                    child: SizedBox(
                      height: Get.size.height / 2,
                      width: Get.size.width / 2,
                      child: Image.asset('assets/onboarding_plant1.png'),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: Get.size.height / 2,
                      width: Get.size.width / 2,
                      child: Image.asset('assets/onboarding_plant2.png'),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: Get.size.height / 2,
                      width: Get.size.width / 2,
                      child: Image.asset('assets/onboarding_plant3.png'),
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.green,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4,
              ),
            ),
            Text(
              'Enjoy your life with plants',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
