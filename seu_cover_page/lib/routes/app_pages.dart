import 'package:get/get.dart';
import 'package:seu_cover_page/routes/app_routes.dart';
import 'package:seu_cover_page/views/cover_page.dart';
import 'package:seu_cover_page/views/home_screen.dart';
import 'package:seu_cover_page/views/splash_screen.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.COVER,
      page: () => const CoverPageScreen(),
    ),
  ];
}
