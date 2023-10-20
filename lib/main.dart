import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_challenge/repository/shared_preferences.dart';
import 'package:heyflutter_challenge/screens/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
  StorageUtil.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingScreen(),
    );
  }
}
