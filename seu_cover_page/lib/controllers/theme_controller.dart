import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  // Function to toggle between light and dark mode
  void toggleTheme(bool isDarkMode) {
    themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode(); // Save theme mode
  }

  // Function to load theme mode from shared preferences
  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeMode savedThemeMode = ThemeMode.values[prefs.getInt('theme_mode') ?? 0];
    themeMode.value = savedThemeMode;
  }

  // Function to save theme mode to shared preferences
  Future<void> _saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.value.index);
  }

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode(); // Load theme mode on initialization
  }
}
