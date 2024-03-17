import 'package:get/get.dart';
import 'package:seu_cover_page/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.HOME);
    });
    super.onReady();
  }
}
