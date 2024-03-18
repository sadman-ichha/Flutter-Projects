// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import DateFormat
import 'package:seu_cover_page/utils/screen_size.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  // TimeOfDay? selectedTime;

  // final selectedDate = DateTime.now().obs;
  // final Rx<TextEditingController> dateController =
  //     TextEditingController(text: selectedDate.value != null
  //                           ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate.value!)}'
  //                           : 'No date selected',).obs;

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: CustomTextField(
                        labelText: 'Semester',
                        hintText: 'Fall 2024',
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Obx(
                        () => TextField(
                          onTap: () => showDatePicker(context),
                          controller: TextEditingController(
                            text: selectedDate.value != null
                                ? DateFormat('dd-MM-yyyy')
                                    .format(selectedDate.value!)
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
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.0,
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
  CustomDropdownButton({Key? key}) : super(key: key);

  final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
  final selectedValue = 'Assignment'.obs; // Initial value

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
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
    );
  }
}
