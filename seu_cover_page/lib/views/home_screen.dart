import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seu_cover_page/components/app_drawer.dart';
import 'package:seu_cover_page/components/custom_dropdown.dart';
import 'package:seu_cover_page/components/custom_textfield.dart';
import 'package:seu_cover_page/components/section_divider.dart';
import 'package:seu_cover_page/controllers/form/date_controller.dart';
import 'package:seu_cover_page/controllers/form/form_controller.dart';
import 'package:seu_cover_page/controllers/home_sereen_controller.dart';
import 'package:seu_cover_page/controllers/theme_controller.dart';
import 'package:seu_cover_page/routes/app_routes.dart';
import 'package:seu_cover_page/utils/screen_size.dart';
import '../services/info_local_storage.dart';
import '../utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localStorage = GetStorage();
  final form = FormController.instance;
  final date = DateController.instance;
  final themeController = Get.put(ThemeController());
  final homeController = Get.put(HomeScreenController());
  final infoLocalStorage = InfoLocalStorage();

  @override
  void initState() {
    infoLocalStorage.loadSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cover Page Generator',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => Row(
              children: [
                IconButton(
                  icon: themeController.isDark.value
                      ? const Icon(Icons.light_mode_outlined)
                      : const Icon(CupertinoIcons.moon_stars),
                  onPressed: () {
                    themeController.changeTheme();
                  },
                ),
                // Conditionally show the delete icon

                IconButton(
                  tooltip: "Erase Information",
                  onPressed: () {
                    AppHelperFunctions.showAlert(
                      "Warning",
                      "Are you sure to erase all the information ?",
                      context,
                    );
                  },
                  icon: const Icon(CupertinoIcons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: ScreenSize.screenSize.height * 0.03),
                // const AppSectionDivider(dividerText: 'Cover Page Information'),
                CustomDropdownButton(
                  items: homeController.dropDownItems,
                  selectedItem: homeController.selectedValue,
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: form.courseTitleController,
                        labelText: 'Course Title',
                        hintText: 'Computer Fundamentals',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: form.courseCodeController,
                        labelText: 'Course Code',
                        hintText: 'CSE141',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomTextField(
                  controller: form.assignmentTitleController,
                  labelText: 'Assignment Title',
                  hintText: 'Assignment Title',
                ),
                const AppSectionDivider(dividerText: 'Faculty Information'),
                CustomTextField(
                  controller: form.teacherNameController,
                  labelText: 'Faculty name',
                  hintText: 'e.g: Anawer Parves',
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomDropdownButton(
                  items: homeController.dropDownDepartmentItems,
                  selectedItem: homeController.selectedDepartmentValue,
                ),
                const AppSectionDivider(dividerText: 'Strudent Information'),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: form.nameController,
                        labelText: 'Student Name',
                        hintText: 'Sadman Esha',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: form.idController,
                        labelText: 'ID',
                        hintText: '2022200010017',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: form.sectionController,
                        labelText: 'Section',
                        hintText: '5',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: form.departmentController,
                        labelText: 'Department',
                        hintText: 'CSE',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: form.semesterController,
                        labelText: 'Semester',
                        hintText: 'Fall 2024',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    // Expanded(
                    //   child: Obx(
                    //     () => TextField(
                    //       onTap: () => homeController.showDatePicker(context),
                    //       controller: TextEditingController(
                    //         text: homeController.selectedDate.value != null
                    //             ? DateFormat('dd/MM/yyyy')
                    //                 .format(homeController.selectedDate.value!)
                    //             : '',
                    //       ),
                    //       readOnly: true,
                    //       decoration: const InputDecoration(
                    //         border: OutlineInputBorder(),
                    //         labelText: "Date",
                    //         prefixIcon: Icon(Icons.calendar_month),
                    //         prefixIconConstraints: BoxConstraints(minWidth: 40),
                    //         suffixIcon: Icon(Icons.info),
                    //         suffixIconConstraints: BoxConstraints(minWidth: 40),
                    //         contentPadding:
                    //             EdgeInsets.symmetric(horizontal: 12),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Expanded(
                      child: TextFormField(
                        onTap: () => date.datePicker(context),
                        controller: date.submissionDateController,
                        decoration: const InputDecoration(
                          counterText: '',
                          label: Text("Date"),
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                        readOnly: true,
                      ),
                    )
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.05),
                InkWell(
                  onTap: () {
                    infoLocalStorage
                        .saveFormData(); // Save form data to local storage
                    Get.toNamed(Routes.COVER);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'PDF Generate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
