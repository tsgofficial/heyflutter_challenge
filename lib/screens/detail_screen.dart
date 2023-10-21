import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/getx_controllers/home_controller.dart';
import 'package:heyflutter_challenge/models/plant_model.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/repository/shared_preferences.dart';
import 'package:heyflutter_challenge/screens/cart_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen extends StatelessWidget {
  final Plant plant;
  final bool isFromHome;
  DetailScreen({
    super.key,
    required this.plant,
    required this.isFromHome,
  });

  final controller = PageController();

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      if (isFromHome)
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(() => CartScreen());
                              },
                              icon: const Icon(Icons.shopping_cart_outlined),
                            ),
                            Obx(
                              () => _homeController.savedPlants.isEmpty
                                  ? const SizedBox()
                                  : Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Obx(
                                            () => Text(
                                              _homeController.savedPlants.length
                                                  .toString(),
                                              style: getFont(12,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: PageView(
                                  scrollDirection: Axis.vertical,
                                  controller: controller,
                                  children: [
                                    for (var image in plant.image)
                                      SizedBox(
                                        height: Get.size.height / 10,
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SmoothPageIndicator(
                                controller: controller,
                                count: plant.image.length,
                                axisDirection: Axis.vertical,
                                effect: const ExpandingDotsEffect(
                                  dotColor: Colors.grey,
                                  activeDotColor: primaryColor,
                                  dotHeight: 5,
                                  dotWidth: 5,
                                  spacing: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(plant.name.split(' ').join('-'),
                            style: getFontBold(20)),
                        Text(plant.description, style: getFont(12)),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.size.height / 3),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: Get.size.height / 3,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(45),
                  right: Radius.circular(45),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildStatusBlock(0),
                      buildStatusBlock(1),
                      buildStatusBlock(2),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: getFont(14, color: Colors.white),
                              ),
                              Text(
                                plant.price,
                                style: getFontBold(16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () => addRemoveCart(plant.id),
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Obx(() => Text(
                                      _homeController.savedPlants
                                              .contains(plant.id.toString())
                                          ? 'Remove from cart'
                                          : 'Add to cart',
                                      style:
                                          getFontBold(14, color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addRemoveCart(int id) async {
    if (_homeController.savedPlants.contains(plant.id.toString())) {
      _homeController.savedPlants.remove(plant.id.toString());
      await StorageUtil.removeFromStorage(id.toString());
    } else {
      _homeController.savedPlants.add(plant.id.toString());
      await StorageUtil.saveToStorage(id.toString());
    }
  }

  Widget buildStatusBlock(int type) {
    switch (type) {
      case 0:
        return SizedBox(
          width: Get.size.width / 4,
          child: Column(
            children: [
              const Icon(
                Icons.height_rounded,
                color: Colors.white,
              ),
              Text(
                "Height",
                style: getFontBold(12, color: Colors.white),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${plant.minHeight.toString()} cm",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: " - ",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: "${plant.maxHeight.toString()} cm",
                      style: getFont(10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 1:
        return SizedBox(
          width: Get.size.width / 4,
          child: Column(
            children: [
              const Icon(
                Icons.thermostat_rounded,
                color: Colors.white,
              ),
              Text(
                "Temperature",
                style: getFontBold(12, color: Colors.white),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${plant.minTemperature.toString()} °C',
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: " to ",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: '${plant.maxTemperature.toString()} °C',
                      style: getFont(10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 2:
        return SizedBox(
          width: Get.size.width / 4,
          child: Column(
            children: [
              SizedBox(
                height: 25,
                child: Image.asset(
                  'assets/botanical.png',
                  color: Colors.white,
                ),
              ),
              Text(
                "Pot",
                style: getFontBold(12, color: Colors.white),
              ),
              Text(
                plant.potType,
                style: getFont(10, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
