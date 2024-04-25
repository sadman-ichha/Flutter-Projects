import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seu_cover_page/controller_binder.dart';
import 'package:seu_cover_page/routes/app_pages.dart';
import 'package:seu_cover_page/utils/screen_size.dart';
import 'package:seu_cover_page/utils/themes/app_theme.dart';
import 'package:seu_cover_page/utils/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialBinding: ControllerBinder(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: AppThemes().getThemeMode(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
