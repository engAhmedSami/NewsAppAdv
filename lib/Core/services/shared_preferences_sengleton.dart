import 'dart:developer';

import 'package:logger/logger.dart';
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
  static final UserPrefs _instance = UserPrefs._internal();
  factory UserPrefs() => _instance;
  UserPrefs._internal();

  final Logger _logger = Logger();

  Future<void> writeCache({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(key, value);
    if (success) {
      _logger.i('Saved $key: $value');
      log('Saved $key: $value');
    } else {
      _logger.e('Failed to save $key: $value');
      log('Failed to save $key: $value');
    }
  }

  Future<String> readCache(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? '';
    _logger.i('Read $key: $value');
    log('Read $key: $value');
    return value;
  }

  Future<void> clearLoginState({required bool rememberMe}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedInRemoved = await prefs.setBool('isLoggedIn', false);

    if (isLoggedInRemoved) {
      _logger.i('Cleared isLoggedIn');
      log('Cleared isLoggedIn');
    } else {
      _logger.e('Failed to clear isLoggedIn');
      log('Failed to clear isLoggedIn');
    }

    if (!rememberMe) {
      bool emailRemoved = await prefs.remove('email');
      bool passwordRemoved = await prefs.remove('password');

      if (emailRemoved) {
        _logger.i('Cleared email');
        log('Cleared email');
      } else {
        _logger.e('Failed to clear email');
        log('Failed to clear email');
      }

      if (passwordRemoved) {
        _logger.i('Cleared password');
        log('Cleared password');
      } else {
        _logger.e('Failed to clear password');
        log('Failed to clear password');
      }
    }
  }

  Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value);
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> setRememberMe(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<bool> isRememberMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }
}
