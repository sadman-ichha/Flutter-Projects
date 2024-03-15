import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SEU Cover Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
