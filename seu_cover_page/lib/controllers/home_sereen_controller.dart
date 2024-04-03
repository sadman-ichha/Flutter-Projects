import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final selectedValue = 'Assignment'.obs; // Initial value
  final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
  final selectedDepartmentValue = 'CSE'.obs; // Initial value
  final RxList<String> dropDownDepartmentItems = [
    'CSE',
    'EEE',
    'PHARMACY',
    'ENGLISH',
    'LAW',
    'BANGLA',
    'TEXTILE',
    'ARCHITECHTURE',
    'ECONOMICS',
    'BBA',
  ].obs;
  
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

  final TextEditingController courseTitleController = TextEditingController();

  final TextEditingController courseCodeController = TextEditingController();
  final TextEditingController assignmentTitleController =
      TextEditingController();
  final TextEditingController teacherNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
}
