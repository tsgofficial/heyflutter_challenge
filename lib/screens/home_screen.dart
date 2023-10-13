import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:heyflutter_challenge/models/plant_mdoel.dart';
import 'package:heyflutter_challenge/repository/const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
      price: '\$12.99',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      'Search Products',
                      style: getFont(14),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/girl_image.jpg'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: TextField(
                            decoration: InputDecoration(
                              icon: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset('assets/search.png'),
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/equalizer.png',
                          scale: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: StaggeredGrid.extent(
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  maxCrossAxisExtent: 300,
                  children: List.generate(
                    plants.length,
                    (index) => Container(
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
                                plants[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plants[index].name,
                                    style: getFontBold(12),
                                  ),
                                  if (plants[index].type != '')
                                    Text(
                                      plants[index].type,
                                      style: getFont(10, color: Colors.grey),
                                    ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        plants[index].price,
                                        style: getFontBold(14),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.white,
                                            size: 18,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
