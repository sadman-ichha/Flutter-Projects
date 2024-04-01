import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';

Future<Uint8List> generatePDF(final PdfPageFormat format) async {
  // Create a PDF document
  final pdf = pw.Document();

  // Add a page to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        // Add invoice content
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Invoice header
            pw.Text(
              'Invoice',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),

            // Invoice details
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Invoice Number:'),
                pw.Text('INV-2024001'),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Date:'),
                pw.Text(DateTime.now().toString()),
              ],
            ),
            pw.SizedBox(height: 20),

            // Invoice items
            pw.Text(
              'Items:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 10),
            pw.Table.fromTextArray(
              context: context,
              data: <List<String>>[
                <String>['Item', 'Quantity', 'Price'],
                <String>['Item 1', '2', '\$10'],
                <String>['Item 2', '1', '\$20'],
                <String>['Item 3', '3', '\$15'],
              ],
            ),

            pw.SizedBox(height: 20),

            // Total amount
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text('Total Amount: \$65'),
              ],
            ),
          ],
        );
      },
    ),
  );

  // Save the PDF document to a Uint8List
  return pdf.save();
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final path = '$appDocPath/assignment.pdf';
  final file = File(path);
  print("Frint as Pdf: ${file.path}...............");
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

showPrintedToast() {
  // Show the Snackbar
  Get.snackbar(
    'Snackbar',
    'Document Printed Successfully', // Message of the Snackbar
    // duration: Duration(
    //     seconds: 3),
    snackPosition: SnackPosition.BOTTOM, // Position of the Snackbar
    // backgroundColor: Colors.blue, // Background color of the Snackbar
    // colorText: Colors.white, // Text color of the Snackbar
    // borderRadius: 10, // Border radius of the Snackbar
    // margin: EdgeInsets.all(10), // Margin around the Snackbar
    // padding: EdgeInsets.all(20), // Padding inside the Snackbar
    // animationDuration:
    //     Duration(milliseconds: 500), // Duration of the animation
    // // animationCurve: Curves.easeInOut, // Animation curve
    // isDismissible:
    //     true, // Whether the Snackbar can be dismissed by tapping outside
    // //  dismissDirection: SnackDismissDirection.HORIZONTAL, // Direction to dismiss the Snackbar
    // forwardAnimationCurve:
    //     Curves.fastOutSlowIn, // Animation curve for forward direction
    // reverseAnimationCurve:
    //     Curves.easeOut, // Animation curve for reverse direction
    // overlayBlur: 5, // Blur amount of the overlay
    // overlayColor: Colors.black.withOpacity(0.5), // Color of the overlay
    // snackStyle: SnackStyle.FLOATING, // Style of the Snackbar
    // barBlur: 10, // Blur amount of the Snackbar
    // // barBlurRadius: 10, // Blur radius of the Snackbar
    // icon: Icon(Icons.info), // Icon of the Snackbar
    // shouldIconPulse: true, // Whether the icon should pulse
    // mainButton: TextButton(
    //   onPressed: () {
    //     Get.back(); // Dismiss the Snackbar when the main button is pressed
    //   },
    //   child: Text('Close'), // Label for the main button
    // ),
    // onTap: (_) {
    //   Get.back(); // Dismiss the Snackbar when tapped
    // },
  );
}

showSharedToast() {
  Get.snackbar("Shared", "Document Shared Successfully");
}

class CoverPageScreenController {
  // Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  //   final output = await getTemporaryDirectory();
  //   var filePath = "${output.path}/$fileName.pdf";
  //   final file = File(filePath);
  //   await file.writeAsBytes(byteList);
  //   await OpenFile.open(filePath);
  // }

  // void showPrintedToast(final BuildContext context) {
  //   Get.showSnackbar();
  // }
}
