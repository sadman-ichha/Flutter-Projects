import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class CoverPageScreenController {
  Future<Uint8List> generateInvoice() async {
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

  Future<void> saveAndOpenInvoice() async {
    final Uint8List pdfBytes = await generateInvoice();
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/invoice.pdf';
    final file = File(path);
    await file.writeAsBytes(pdfBytes);
    OpenFile.open(path);
  }

  // Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  //   final output = await getTemporaryDirectory();
  //   var filePath = "${output.path}/$fileName.pdf";
  //   final file = File(filePath);
  //   await file.writeAsBytes(byteList);
  //   await OpenFile.open(filePath);
  // }
}
