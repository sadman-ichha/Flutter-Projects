// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomDropdownButton extends StatelessWidget {
//   CustomDropdownButton({Key? key}) : super(key: key);

//   final RxList<String> dropDownItems = ['Assignment', 'Lab Report'].obs;
//   final selectedValue = 'Assignment'.obs; // Initial value

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       isExpanded: true,
//       value: selectedValue.value,
//       onChanged: (String? newValue) {
//         selectedValue.value = newValue!;
//       },
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//       ),
//       style: const TextStyle(
//         color: Colors.black,
//         fontSize: 16,
//       ),
//       elevation: 16,
//       items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(value),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Obx(() => DropdownButtonFormField<String>(
          isExpanded: true,
          value: selectedItem.value,
          onChanged: (String? newValue) {
            selectedItem.value = newValue!;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
            color: Theme.of(context).focusColor,
            //color: MediaQuery.of(context).platformBrightness == ThemeMode.dark ? Colors.white : Colors.black,
            fontSize: 16,
          ),
          elevation: 16,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
