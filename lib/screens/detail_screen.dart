import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/models/plant_mdoel.dart';
import 'package:heyflutter_challenge/repository/const.dart';

class DetailScreen extends StatelessWidget {
  final Plant plant;
  const DetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatusBlock() => Column(
        children: [],
      );
}
