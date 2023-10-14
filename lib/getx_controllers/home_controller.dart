import 'dart:math';

import 'package:get/get.dart';
import 'package:heyflutter_challenge/models/plant_mdoel.dart';

class HomeController extends GetxController {
  static List<String> plantNames = [
    'Lucky Jade Plant',
    'Snake Plant',
    'Money Tree',
    'Peace Lily',
    'Pothos',
    'Rubber Plant',
    'ZZ Plant',
    'Monstera',
    'Fiddle Leaf Fig',
    'Bird of Paradise',
    'Peperomia',
    'Peruvian Apple',
    "Philodendron",
    "Aloe Vera",
    'African Violet',
  ];

  static List<String> plantTypes = [
    'Super Greens',
    "Spinach",
    "Swiss Chard",
    "Collard Greens",
    "Arugula",
    "Watercress",
    '',
  ];

  List<Plant> plants = List.generate(
    15,
    (index) => Plant(
      name: plantNames[index],
      type: plantTypes[Random().nextInt(plantTypes.length)],
      image: 'assets/plant${index + 1}.png',
      price: '\$${Random().nextInt(100) + 1}.99',
    ),
  );

  RxList<Plant> searchedPlants = List.generate(
    15,
    (index) => Plant(
      name: plantNames[index],
      type: plantTypes[Random().nextInt(plantTypes.length)],
      image: 'assets/plant${index + 1}.png',
      price: '\$${Random().nextInt(100) + 1}.99',
    ),
  ).obs;
}
