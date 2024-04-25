import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme lightCardTheme = const CardTheme(
    color: AppColors.softGrey,
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 20.0),
  );

  static CardTheme darkCardTheme = const CardTheme(
    color: AppColors.dark,
    // color: AppColors.buttonPrimary,
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 20.0),
  );
}
