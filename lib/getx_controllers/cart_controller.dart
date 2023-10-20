import 'package:get/get.dart';
import 'package:heyflutter_challenge/models/plant_model.dart';
import 'package:heyflutter_challenge/repository/shared_preferences.dart';

class CartController extends GetxController {
  RxList<Plant> savedPlants = <Plant>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxBool isLoadingSavedPlants = false.obs;

  void getSavedPlants() async {
    isLoadingSavedPlants.value = true;
    savedPlants = await StorageUtil.getStoredPlants();
    isLoadingSavedPlants.value = false;
  }
}
