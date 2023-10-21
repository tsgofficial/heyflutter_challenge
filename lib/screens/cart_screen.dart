import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/components/plant_tile.dart';
import 'package:heyflutter_challenge/getx_controllers/home_controller.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/screens/detail_screen.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: backgroundColor,
      ),
      body: Obx(
        () => _homeController.isLoadingSavedPlants.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _homeController.savedPlants.isEmpty
                ? const Center(
                    child: Text('No plants are added to the cart'),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SingleChildScrollView(
                      child: Obx(
                        () => StaggeredGrid.extent(
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          maxCrossAxisExtent: 300,
                          children: List.generate(
                            _homeController.savedPlants.length,
                            (index) => InkWell(
                              onTap: () => Get.to(
                                () => DetailScreen(
                                  plant: _homeController.plants[int.parse(
                                      _homeController.savedPlants[index])],
                                  isFromHome: false,
                                ),
                              ),
                              child: PlantTile(
                                plant: _homeController.plants[int.parse(
                                    _homeController.savedPlants[index])],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
