import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/models/plant_model.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/repository/shared_preferences.dart';
import 'package:heyflutter_challenge/screens/cart_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen extends StatelessWidget {
  final Plant plant;
  DetailScreen({super.key, required this.plant});
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => CartScreen());
                        },
                        icon: Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.size.height / 4 * 2,
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
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: controller,
                          count: plant.image.length,
                          axisDirection: Axis.vertical,
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: primaryColor,
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(plant.name.split(' ').join('-'), style: getFontBold(20)),
                  Text(plant.description, style: getFont(12)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Get.size.height / 3,
              decoration: BoxDecoration(
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
                            onTap: () => addCart(plant.id),
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Add to cart',
                                  style: getFontBold(14, color: Colors.white),
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
            ),
          ),
        ],
      ),
    );
  }

  void addCart(int id) async {
    await StorageUtil.saveToStorage(id.toString());
    Get.snackbar('Successful', 'Plant is successfully added to the cart!');
  }

  Widget buildStatusBlock(int type) {
    switch (type) {
      case 0:
        return SizedBox(
          width: Get.size.width / 4,
          child: Column(
            children: [
              Icon(
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
                      text: plant.minHeight.toString() + "cm",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: " - ",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: plant.maxHeight.toString() + "cm",
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
              Icon(
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
                      text: plant.minTemperature.toString() + "°C",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: " to ",
                      style: getFont(10, color: Colors.white),
                    ),
                    TextSpan(
                      text: plant.maxTemperature.toString() + "°C",
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
