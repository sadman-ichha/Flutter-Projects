// ignore_for_file: unnecessary_null_comparison, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:seu_cover_page/components/app_drawer.dart';
import 'package:seu_cover_page/components/custom_dropdown.dart';
import 'package:seu_cover_page/components/custom_textfield.dart';
import 'package:seu_cover_page/controllers/home_sereen_controller.dart';
import 'package:seu_cover_page/routes/app_routes.dart';
import 'package:seu_cover_page/utils/screen_size.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final selectedValue = 'Assignment'.obs; // Initial value
  // final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeController = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cover Page Generator',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: ScreenSize.screenSize.height * 0.03),
                CustomDropdownButton(
                  items: homeController.dropDownItems,
                  selectedItem: homeController.selectedValue,
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: homeController.courseTitleController,
                        labelText: 'Course Title',
                        hintText: 'Computer Fundamentals',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: homeController.courseCodeController,
                        labelText: 'Course Code',
                        hintText: 'CSE141',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomTextField(
                  controller: homeController.assignmentTitleController,
                  labelText: 'Assignment Title',
                  hintText: 'Assignment Title',
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomTextField(
                  controller: homeController.teacherNameController,
                  labelText: 'Faculty name',
                  hintText: 'e.g: Anawer Parves',
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomDropdownButton(
                  items: homeController.dropDownDepartmentItems,
                  selectedItem: homeController.selectedDepartmentValue,
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Divider(
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: homeController.nameController,
                        labelText: 'Student Name',
                        hintText: 'Sadman Esha',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: homeController.idController,
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
                        controller: homeController.sectionController,
                        labelText: 'Section',
                        hintText: '5',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        controller: homeController.departmentController,
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
                        controller: homeController.semesterController,
                        labelText: 'Semester',
                        hintText: 'Fall 2024',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Obx(
                        () => TextField(
                          onTap: () => homeController.showDatePicker(context),
                          controller: TextEditingController(
                            text: homeController.selectedDate.value != null
                                ? DateFormat('dd-MM-yyyy')
                                    .format(homeController.selectedDate.value!)
                                : '', // Set the text based on selected date
                          ),
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Date",
                            prefixIcon: Icon(Icons.calendar_month),
                            prefixIconConstraints: BoxConstraints(minWidth: 40),
                            suffixIcon: Icon(Icons.info),
                            suffixIconConstraints: BoxConstraints(minWidth: 40),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.05),
                InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                    Get.toNamed(Routes.COVER);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 3.0,
                      ),
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'PDF Generate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
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
