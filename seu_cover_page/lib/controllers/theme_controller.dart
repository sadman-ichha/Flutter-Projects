import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeType { light, dark }

class ThemeController extends GetxController {
  final Rx<ThemeModeType> _themeMode = ThemeModeType.light.obs;

  ThemeModeType get themeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _setThemeMode(isDarkMode ? ThemeModeType.dark : ThemeModeType.light);
  }

  void _setThemeMode(ThemeModeType mode) {
    _themeMode.value = mode;
    updateStorage(mode);
  }

  void toggleTheme() {
    if (_themeMode.value == ThemeModeType.light) {
      _setThemeMode(ThemeModeType.dark);
    } else {
      _setThemeMode(ThemeModeType.light);
    }
  }

  void updateStorage(ThemeModeType mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', mode == ThemeModeType.dark);
  }
}
