// import 'package:flutter/material.dart';
// import 'package:seu_cover_page/utils/themes/app_colors.dart';
// import 'package:seu_cover_page/utils/themes/app_text_theme.dart';

// class AppTheme {
//   AppTheme._();
//   static ThemeData lightTheme = ThemeData(
//     useMaterial3: true,
//     colorScheme: const ColorScheme.light(),
//     primaryColor: Colors.blue,
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: AppTextTheme.lightTextTheme,
//     focusColor: Colors.black,
//     appBarTheme: AppBarTheme(
//       color: AppColors.primaryColor,
//     ),
//   );
//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     colorScheme: const ColorScheme.dark(),
//     primaryColor: Colors.blue,
//     brightness: Brightness.dark,
//     focusColor: Colors.white,
//     scaffoldBackgroundColor: Colors.black,
//     textTheme: AppTextTheme.darkTextTheme,

//     // dropdownMenuTheme: const DropdownMenuThemeData(
//     //   inputDecorationTheme: InputDecorationTheme(fillColor: Colors.white),
//     //   textStyle: TextStyle(color: Colors.white),
//     // ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';
import 'package:seu_cover_page/utils/themes/app_text_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/appbar_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/card_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/chip_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/drawer_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/elevation_button_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/outlined_button_theme.dart';
import 'package:seu_cover_page/utils/themes/custom_themes/text_field_theme.dart';

class AppTheme {
  AppTheme._(); // making the constructor private

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.buttonSecondary,

    fontFamily: 'Poppins',
    useMaterial3: true,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: AppBarThemes.lightAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    cardTheme: AppCardTheme.lightCardTheme,
    drawerTheme: AppDrawerTheme.lightDrawerTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark,
    primaryColor: AppColors.buttonPrimary,
    fontFamily: 'Poppins',
    useMaterial3: true,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    appBarTheme: AppBarThemes.darkAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    cardTheme: AppCardTheme.darkCardTheme,
    drawerTheme: AppDrawerTheme.darkDrawerTheme,
  );
}
