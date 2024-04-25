import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/helpers/helper_functions.dart';
import 'date_controller.dart';

class FormController extends GetxController {
  static FormController get instance => Get.find();
  final date = DateController.instance;
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

  void clearTextFields() {
    courseTitleController.clear();
    courseCodeController.clear();
    assignmentTitleController.clear();
    teacherNameController.clear();
    nameController.clear();
    idController.clear();
    sectionController.clear();
    departmentController.clear();
    semesterController.clear();
    date.submissionDateController.clear();
  }

  // void isEmptyTextFieldsCheck() {
  //   if (courseTitleController.text.isEmpty ||
  //       courseCodeController.text.isEmpty ||
  //       assignmentTitleController.text.isEmpty ||
  //       teacherNameController.text.isEmpty ||
  //       nameController.text.isEmpty ||
  //       idController.text.isEmpty ||
  //       sectionController.text.isEmpty ||
  //       departmentController.text.isEmpty ||
  //       semesterController.text.isEmpty ||
  //       date.submissionDateController.text.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Your Information is empty",
  //       toastLength: Toast.LENGTH_LONG,
  //       fontSize: 16.0,
  //     );
  //   } else {
  //     FormController.instance.clearTextFields();
  //   }
  // }

  void isEmptyTextFieldsCheck() {
    final textControllers = [
      courseTitleController,
      courseCodeController,
      assignmentTitleController,
      teacherNameController,
      nameController,
      idController,
      sectionController,
      departmentController,
      semesterController,
      date.submissionDateController,
    ];

    final bool allFieldsFilled =
        textControllers.every((controller) => controller.text.isNotEmpty);

    if (allFieldsFilled) {
      FormController.instance.clearTextFields();
    } else {
      showEmptyFieldsToast();
    }
  }

  void showEmptyFieldsToast() {
    AppHelperFunctions.showToastMessage(
        "Your Information is Empty", Colors.black);
  }
}
