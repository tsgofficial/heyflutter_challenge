import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/getx_controllers/home_controller.dart';
import 'package:heyflutter_challenge/models/plant_model.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/repository/shared_preferences.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;
  PlantTile({super.key, required this.plant});

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width / 2 - 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(
                plant.image[Random().nextInt(3)],
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    style: getFontBold(12),
                  ),
                  if (plant.type != '')
                    Text(
                      plant.type,
                      style: getFont(10, color: Colors.grey),
                    ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plant.price,
                        style: getFontBold(14),
                      ),
                      InkWell(
                        onTap: () => addRemoveCart(),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Obx(
                              () => Icon(
                                _homeController.savedPlants
                                        .contains(plant.id.toString())
                                    ? Icons.delete_outline_rounded
                                    : Icons.favorite_rounded,
                                color: Colors.white,
                                size: 18,
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
          ],
        ),
      ),
    );
  }

  void addRemoveCart() async {
    if (_homeController.savedPlants.contains(plant.id.toString())) {
      _homeController.savedPlants.remove(plant.id.toString());
      await StorageUtil.removeFromStorage(plant.id.toString());
      Get.closeAllSnackbars();
      Get.snackbar('Successful', 'Plant is removed from the cart!');
    } else {
      _homeController.savedPlants.add(plant.id.toString());
      await StorageUtil.saveToStorage(plant.id.toString());
      Get.closeAllSnackbars();
      Get.snackbar('Successful', 'Plant is added to the cart!');
    }
  }
}
