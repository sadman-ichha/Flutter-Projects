import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
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
        actions: [
          // Add download button to the AppBar
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {
              final PdfPageFormat pageFormat = PdfPageFormat.standard;
              await saveAsFile(
                  context, (format) => generatePDF(format), pageFormat);
              print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
            },
          ),
        ],
        title: Text(
          '${homeController.selectedValue.value.toString()} Cover Page',
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
