import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/controllers/theme_controller.dart';
import 'package:seu_cover_page/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';
import 'utils/screen_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeController themeController = Get.put(ThemeController());

    // Initialize screen size
    ScreenSize.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('bn', 'BD'), // Bangla
      ],
      title: 'SEU Cover Page',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
        //primaryColor: AppColors.primaryColor,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //theme: ThemeData.light(),
      //darkTheme: ThemeData.dark(),
      // themeMode: themeController.themeMode == ThemeModeType.dark
      //     ? ThemeMode.dark
      //     : ThemeMode.light,

      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
