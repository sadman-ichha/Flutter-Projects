import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:seu_cover_page/components/coverpage_all_component.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class CoverPageScreen extends StatelessWidget {
  const CoverPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(() => CoverPageScreenController());
    final actions = <PdfPreviewAction>[
      if (kIsWeb)
        const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile),
    ];
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
      body: PdfPreview(
        maxPageWidth: 700.0,
        actions: actions,
        onPrinted: showPrintedToast(),
        onShared: showSharedToast(),
        build: generatePDF,
      ),
    );
  }
}
