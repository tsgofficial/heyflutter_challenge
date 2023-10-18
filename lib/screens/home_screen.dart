import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/getx_controllers/home_controller.dart';
import 'package:heyflutter_challenge/repository/const.dart';
import 'package:heyflutter_challenge/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(15 + 50 + 15 + 30 + 20 + 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Search Products',
                    style: getFont(16, color: Colors.black54),
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/girl_image.jpg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black54,
                      cursorHeight: 15,
                      onChanged: (value) {
                        _homeController.searchedPlants.value = _homeController
                            .plants
                            .where((element) => (element.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()) ||
                                element.image
                                    .toLowerCase()
                                    .contains(value.toLowerCase()) ||
                                element.price
                                    .toLowerCase()
                                    .contains(value.toLowerCase()) ||
                                element.type
                                    .toLowerCase()
                                    .contains(value.toLowerCase())))
                            .toList();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Image.asset(
                          'assets/search.png',
                          scale: 30,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/equalizer.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Obx(
                  () => StaggeredGrid.extent(
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    maxCrossAxisExtent: 300,
                    children: [
                      Text(
                        'Found ${_homeController.searchedPlants.length} Results',
                        style: getFontBold(32),
                      ),
                      ...List.generate(
                        _homeController.searchedPlants.length,
                        (index) => InkWell(
                          onTap: () => Get.to(
                            () => DetailScreen(
                              plant: _homeController.searchedPlants[index],
                            ),
                          ),
                          child: Container(
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
                                      _homeController
                                          .searchedPlants[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _homeController
                                              .searchedPlants[index].name,
                                          style: getFontBold(12),
                                        ),
                                        if (_homeController
                                                .searchedPlants[index].type !=
                                            '')
                                          Text(
                                            _homeController
                                                .searchedPlants[index].type,
                                            style:
                                                getFont(10, color: Colors.grey),
                                          ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _homeController
                                                  .searchedPlants[index].price,
                                              style: getFontBold(14),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(3.0),
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
                    ],
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
