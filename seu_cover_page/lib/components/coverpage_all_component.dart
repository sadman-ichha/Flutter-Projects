import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';
import 'package:seu_cover_page/components/rich_text_cover_page.dart';
import 'package:seu_cover_page/controllers/home_sereen_controller.dart';
import 'package:seu_cover_page/utils/themes/app_images.dart';

HomeScreenController homeController = Get.put(HomeScreenController());

Future<Uint8List> generatePDF(final PdfPageFormat format) async {
  // Create a PDF document
  final pdf = pw.Document();
  // Load image from asset
  final ByteData seuLogoData = await rootBundle.load(AppImages.seuLogo);
  final Uint8List bytes = seuLogoData.buffer.asUint8List();
  //final homeController.selectedDate.value! homeController.selectedDate.value! = homeController.selectedDate.value!;

  // Add a page to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        // Add invoice content
        return pw.Container(
          decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 2.0, color: PdfColors.amber)),
          child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 20.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Center(
                  child: pw.Container(
                    height: 128.0,
                    alignment: pw.Alignment.center,
                    child: pw.Image(pw.MemoryImage(bytes)),
                  ),
                ),
                pw.SizedBox(height: 5.0),
                // Versity header
                pw.Center(
                  child: pw.Text(
                    'Southeast University',
                    style: pw.TextStyle(
                      fontSize: 38,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 15),
                pw.Text(
                  // 'Assignment',
                  homeController.selectedValue.value.toString(),
                  style: pw.TextStyle(
                    fontSize: 30,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 5.0),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 60.0),
                  child: pw.Divider(thickness: 1.5),
                ),

                pw.SizedBox(height: 10.0),
                PdfRichText(
                  title: "Title: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "Assignment 1",
                  dynamicText:
                      homeController.assignmentTitleController.text.toString(),
                  textStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                ),
                // Course title
                pw.SizedBox(height: 15.0),
                PdfRichText(
                  title: "Course Title: ",
                  //  dynamicText: "Algorithm",
                  dynamicText:
                      homeController.courseTitleController.text.toString(),
                  textStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  titleTextStyle: const pw.TextStyle(fontSize: 22.0),
                ),

                PdfRichText(
                  title: "Course Code: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "CSE 161",
                  dynamicText:
                      homeController.courseCodeController.text.toString(),
                  textStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                ),

                // ********Submitted Too********
                pw.SizedBox(height: 15.0),
                pw.Text(
                  'Submitted To',
                  style: pw.TextStyle(
                    fontSize: 25.0,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 3.0),
                pw.Text(
                  // 'Anawer Perves',
                  homeController.teacherNameController.text.toString(),
                  style: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                ),
                pw.Text(
                  // 'Lecturer, SEU',
                  "Lecturer, SEU, ${homeController.selectedDepartmentValue.contains("CSE") ? "" : homeController.selectedDepartmentValue.toString()}",
                  style: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                ),
                pw.SizedBox(height: 20),
                // ******Submitted by******
                pw.Text(
                  'Submitted By',
                  style: pw.TextStyle(
                    fontSize: 25,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 5.0),
                PdfRichText(
                  title: "Name: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  // dynamicText: "Md. Safi Sadman Esha",
                  dynamicText: homeController.nameController.text.toString(),
                  textStyle: pw.TextStyle(
                    fontSize: 22.0,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
                PdfRichText(
                  title: "ID: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "2022200010017",
                  dynamicText: homeController.idController.text.toString(),
                  textStyle: const pw.TextStyle(fontSize: 22.0),
                ),
                PdfRichText(
                  title: "Section: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "16",
                  dynamicText: homeController.sectionController.text.toString(),
                  textStyle: const pw.TextStyle(fontSize: 22.0),
                ),
                PdfRichText(
                  title: "Semester: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "FALL 2024",
                  dynamicText:
                      homeController.semesterController.text.toString(),
                  textStyle: const pw.TextStyle(fontSize: 22.0),
                ),
                PdfRichText(
                  title: "Department: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  //dynamicText: "CSE",
                  dynamicText:
                      homeController.departmentController.text.toString(),
                  textStyle: const pw.TextStyle(fontSize: 22.0),
                ),

                pw.Spacer(),

                // Submitted by
                PdfRichText(
                  title: "Submission Date: ",
                  titleTextStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                  // dynamicText: "26/04/2024",
                  dynamicText: homeController.selectedDate.value == null
                      ? ""
                      : "${homeController.selectedDate.value!.day.toString()}/${homeController.selectedDate.value!.month.toString()}/${homeController.selectedDate.value!.year.toString()}",
                  textStyle: pw.TextStyle(
                    fontSize: 22.0,
                    font: pw.Font.helveticaBold(),
                  ),
                ),
              ],
            ),
          ),
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
  print("Print as Pdf:.... ${file.path}...............");
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
  print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
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
