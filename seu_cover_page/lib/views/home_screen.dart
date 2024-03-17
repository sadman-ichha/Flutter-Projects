import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/utils/screen_size.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: ScreenSize.screenSize.height * 0.03),
                CustomDropdownButton(),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Course Title',
                        hintText: 'Computer Fundamentals',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Course Code',
                        hintText: 'CSE141',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const CustomTextField(
                  labelText: 'Assignment Title',
                  hintText: 'Assignment Title',
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                CustomDropdownButton(),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Divider(
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Student Name',
                        hintText: 'Sadman Esha',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        labelText: 'ID',
                        hintText: '2022200010017',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Section',
                        hintText: '5',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Department',
                        hintText: 'CSE',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenSize.height * 0.02),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Semester',
                        hintText: 'Fall 2024',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    // Expanded(
                    //   child:
                    // ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      DateTime? newDateTime = await showRoundedDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          borderRadius: 16);
                    },
                    child: Text("data")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({
    Key? key,
  }) : super(key: key);

  final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
  final selectedValue = 'Assignment'.obs; // Initial value

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedValue.value,
        onChanged: (String? newValue) {
          selectedValue.value = newValue!;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        elevation: 16,
        items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
