import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/utils/helpers/helper_functions.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class CustomDropdownButton extends StatelessWidget {
  final RxList<String> items;
  final RxString selectedItem;

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Obx(() => DropdownButtonFormField<String>(
          isExpanded: true,
          value: selectedItem.value,
          onChanged: (String? newValue) {
            selectedItem.value = newValue!;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          elevation: 16,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: isDark ? AppColors.softGrey : Colors.grey.shade800,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
