import 'package:qalam_app/core/constants/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();
  late SharedPreferences _prefs;

  SharedPrefsHelper._internal();

  factory SharedPrefsHelper() => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setOnboardingSeen(bool value) async {
    await _prefs.setBool(LocalStorageConstants.keyOnboardingSeen, value);
  }
  
  bool getOnboardingSeen() {
    return _prefs.getBool(LocalStorageConstants.keyOnboardingSeen) ?? false;
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
