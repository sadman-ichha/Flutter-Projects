import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seu_cover_page/controllers/form/form_controller.dart';
import 'package:seu_cover_page/controllers/home_sereen_controller.dart';
import 'theme_controller.dart';

class LocalStorageController extends GetxController {
  final localStorage = GetStorage();
  final form = FormController.instance;
  final themeController = Get.put(ThemeController());
  final homeController = Get.put(HomeScreenController());

  // Function to save form data to local storage
  void saveFormData() {
    final Map<String, String> data = {
      'courseTitle': form.courseTitleController.text,
      'courseCode': form.courseCodeController.text,
      'assignmentTitle': form.assignmentTitleController.text,
      'teacherName': form.teacherNameController.text,
      'studentName': form.nameController.text,
      'studentID': form.idController.text,
      'section': form.sectionController.text,
      'department': form.departmentController.text,
      'semester': form.semesterController.text,
      'selectedDate':
          homeController.selectedDate.value?.toIso8601String() ?? '',
    };

    localStorage.write('studentInfo', data);
  }

  // Function to load saved data from local storage
  void loadSavedData() {
    final savedData = localStorage.read('studentInfo');

    if (savedData != null) {
      form.courseTitleController.text = savedData['courseTitle'] ?? '';
      form.courseCodeController.text = savedData['courseCode'] ?? '';
      form.assignmentTitleController.text = savedData['assignmentTitle'] ?? '';
      form.teacherNameController.text = savedData['teacherName'] ?? '';
      form.nameController.text = savedData['studentName'] ?? '';
      form.idController.text = savedData['studentID'] ?? '';
      form.sectionController.text = savedData['section'] ?? '';
      form.departmentController.text = savedData['department'] ?? '';
      form.semesterController.text = savedData['semester'] ?? '';
      final selectedDate = savedData['selectedDate'] != null
          ? DateTime.parse(savedData['selectedDate'])
          : null;
      homeController.selectedDate(selectedDate);
    }
  }

  // Function to delete saved data from local storage
  void deleteSavedData() {
    localStorage.remove('studentInfo');
    // Clear text fields after deleting data
    form.clearTextFields();
  }
}
