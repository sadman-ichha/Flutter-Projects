import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(color: Colors.black),
    headlineMedium: const TextStyle().copyWith(color: Colors.black),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(color: Colors.white),
    headlineMedium: const TextStyle().copyWith(color: Colors.white),
  );
}
