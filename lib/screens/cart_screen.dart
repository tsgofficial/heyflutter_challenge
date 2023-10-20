import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/components/plant_tile.dart';
import 'package:heyflutter_challenge/getx_controllers/cart_controller.dart';
import 'package:heyflutter_challenge/getx_controllers/home_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _homeController = Get.put(HomeController());
  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: GridView.builder(
          itemCount: _cartController.savedPlants.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return PlantTile(
              plant: _homeController.plants[index],
            );
          }),
    );
  }
}
