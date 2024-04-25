import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  // final localStorage = InfoLocalStorage();
  // @override
  // void onInit() {
  //   localStorage.loadSavedData();
  //   super.onInit();
  // }

  final selectedValue = 'Assignment'.obs; // Initial value
  final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
  final selectedDepartmentValue = 'CSE'.obs; // Initial value
  final RxList<String> dropDownDepartmentItems = [
    'CSE',
    'EEE',
    'PHARMACY',
    'ENGLISH',
    'LLB',
    'BANGLA',
    'TEXTILE',
    'ARCHITECHTURE',
    'ECONOMICS',
    'BBA',
  ].obs;

  // Show Date and Time Piker Function..
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Future<void> showDatePicker(BuildContext context) async {
    final newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );

    if (newDateTime != null) {
      selectedDate.value = newDateTime;
    }
  }

  // var isDark = false;
  // void changeTheme(state) {
  //   if (state == true) {
  //     isDark = true;
  //     Get.changeTheme(ThemeData.dark());
  //   } else {
  //     isDark = false;
  //     Get.changeTheme(ThemeData.light());
  //   }
  //   update();
  // }
}
