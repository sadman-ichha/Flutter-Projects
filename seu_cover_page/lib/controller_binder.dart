import 'package:get/get.dart';
import 'package:seu_cover_page/controllers/form/date_controller.dart';
import 'package:seu_cover_page/controllers/form/form_controller.dart';
import 'package:seu_cover_page/controllers/home_sereen_controller.dart';
import 'package:seu_cover_page/controllers/splash_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
    Get.put(FormController());
    Get.put(SplashScreenController());
    Get.put(HomeScreenController());
  }
}
