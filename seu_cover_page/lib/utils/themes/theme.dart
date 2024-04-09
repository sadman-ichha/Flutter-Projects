import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';
import 'package:seu_cover_page/utils/themes/app_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.purple,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.purple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
