import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seu_cover_page/controllers/cover_page_screen_controller.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class CoverPageScreen extends StatelessWidget {
  const CoverPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(() => CoverPageScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignment Cover Page',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await CoverPageScreenController().generateCoverPDF();
            CoverPageScreenController().savePdfFile("Sadman", data);
          },
          child: const Text('Generate and Save PDF'),
        ),
      ),
    );
  }
}
