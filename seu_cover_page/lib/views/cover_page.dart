import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:seu_cover_page/components/coverpage_all_component.dart';
import 'package:seu_cover_page/utils/helpers/helper_functions.dart';
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
              const PdfPageFormat pageFormat = PdfPageFormat.standard;
              final Uint8List pdfBytes = await generatePDF(pageFormat);

              // Save the PDF to a temporary file
              final tempDir = await getTemporaryDirectory();
              final tempFilePath = '${tempDir.path}/Cover Page.pdf';
              final tempFile = File(tempFilePath);
              await tempFile.writeAsBytes(pdfBytes);

              // Open the PDF file
              OpenFile.open(tempFilePath);
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
        //foregroundColor: AppColors.primaryColor,
        //backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: PdfPreview(
          maxPageWidth: double.infinity,
          actions: actions,
          build: generatePDF,
          canChangePageFormat: false,
          canChangeOrientation: false,
          canDebug: false,
          loadingWidget: CircularProgressIndicator(
            color: AppHelperFunctions.isDarkMode(context)
                ? Colors.teal
                : AppColors.buttonSecondary,
          ),
          previewPageMargin: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
        ),
      ),
    );
  }
}
