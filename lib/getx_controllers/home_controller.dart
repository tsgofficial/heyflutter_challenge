import 'dart:math';

import 'package:get/get.dart';
import 'package:heyflutter_challenge/models/plant_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    searchedPlants.value = plants;
  }

  static const List<String> plantNames = [
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

  static const List<String> plantTypes = [
    'Super Greens',
    "Spinach",
    "Swiss Chard",
    "Collard Greens",
    "Arugula",
    "Watercress",
    '',
  ];

  static const List<String> plantDescriptions = [
    "Beautiful fern with delicate fronds, providing a lush, green ambiance",
    "Tall and elegant palm tree swaying gracefully in the breeze on a tropical island",
    "Colorful orchids in full bloom, showcasing their vibrant and exotic petals",
    "Succulent with thick, fleshy leaves, perfect for arid desert landscapes",
    "Dwarf bonsai with intricate branches, a masterpiece of miniature horticulture",
    "Majestic oak tree in a lush forest, a symbol of strength and endurance",
    "Vibrant wildflowers in the meadow, attracting butterflies and bees",
    "Exotic cactus with sharp spines, thriving in harsh desert conditions",
    "Aromatic herbs for your garden, adding fragrance and flavor to your dishes",
    "Tropical paradise with lush foliage, a haven for diverse plant species",
    "Graceful weeping willow by the pond, its branches gracefully trailing in the water",
    "Charming daisies in a field, spreading cheer with their white and yellow blossoms",
    "Mysterious moss-covered rocks, creating an enchanting forest landscape",
    "Spiky agave in the desert, a resilient succulent with striking architectural appeal",
    "Fragrant roses in a rose garden, with a myriad of colors and intoxicating scents",
  ];

  static const List<String> potTypes = [
    "Terra Cotta Pot",
    "Ceramic Planter",
    "Hanging Basket",
    "Self-Watering Pot",
    "Wooden Planter Box",
  ];

  static int randomHeight = Random().nextInt(100);
  static int randomTemperature = Random().nextInt(30);

  RxList<Plant> searchedPlants = <Plant>[].obs;

  List<Plant> plants = List.generate(
    15,
    (index) => Plant(
      id: index,
      name: plantNames[index],
      type: plantTypes[Random().nextInt(plantTypes.length)],
      image: List.generate(
          3, (index) => 'assets/plant${Random().nextInt(12) + index + 1}.png'),
      price: '\$${Random().nextInt(100) + 1}.${Random().nextInt(max(99, 1))}',
      description: plantDescriptions[index],
      minHeight: randomHeight,
      maxHeight: randomHeight + Random().nextInt(50) + 1,
      minTemperature: randomTemperature,
      maxTemperature: randomTemperature + Random().nextInt(25),
      potType: potTypes[Random().nextInt(potTypes.length)],
    ),
  );
}
