import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  // ignore: unused_field
  static late SharedPreferences _preferences;

  static Future getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future saveToStorage(String id) async {
    final savedPlants = _preferences.getStringList('storedPlants') ?? [];
    savedPlants.add(id);
    _preferences.setStringList('storedPlants', savedPlants);
  }

  static Future removeFromStorage(String id) async {
    final savedPlants = _preferences.getStringList('storedPlants') ?? [];
    savedPlants.remove(id);
    _preferences.setStringList('storedPlants', savedPlants);
  }

  static Future<List<String>> getStoredPlants() async {
    return _preferences.getStringList('storedPlants') ?? [];
  }
}
