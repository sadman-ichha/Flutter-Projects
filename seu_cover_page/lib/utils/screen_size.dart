import 'package:flutter/material.dart';

class ScreenSize {
  static late Size screenSize;

  static void init(BuildContext context) {
    screenSize = MediaQuery.sizeOf(context);
  }
}
