import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Prfs {
  // ignore: unused_field
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
}

class UserPrefs {
  Future<void> writeCache({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setString(key, value);
    log(isSaved.toString());
  }

  Future<String> readCache(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);

    if (value != null) {
      log(value.toString());
    }

    return value ?? '';
  }

  Future<void> clearCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
