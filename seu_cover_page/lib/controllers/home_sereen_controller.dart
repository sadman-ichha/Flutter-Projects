import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  final selectedValue = 'Assignment'.obs; // Initial value
  final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
}
