import 'package:shared_preferences/shared_preferences.dart';
import 'package:ener_personalcare/Controllers/user.dart';
import 'package:flutter/material.dart';

class UserPreferences {
  static const String _keyUsername = 'username';
  static const String _keyIsLoggedIn = 'isLoggedIn';

  static Future<void> saveUserData(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyUsername, username);
    prefs.setBool(_keyIsLoggedIn, true);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  static Future<bool?> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn);
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyUsername);
    prefs.remove(_keyIsLoggedIn);
  }

  static Future checklogin() async {
    bool? signin = await User.getsignin();
    print(signin);
    if (signin == false) {
      // Navigator.pushNamed(context, 'login');
    } else {
      // Navigator.pushNamed(context, 'home');
    }
  }

}
