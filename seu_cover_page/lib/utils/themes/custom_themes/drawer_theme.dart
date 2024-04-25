import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class AppDrawerTheme {
  AppDrawerTheme._();

  static DrawerThemeData lightDrawerTheme =
      const DrawerThemeData(backgroundColor: AppColors.softGrey);

  static DrawerThemeData darkDrawerTheme =
      const DrawerThemeData(backgroundColor: AppColors.dark);
}
