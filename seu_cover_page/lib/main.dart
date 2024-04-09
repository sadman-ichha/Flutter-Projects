import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';
import 'package:seu_cover_page/utils/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/screen_size.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
