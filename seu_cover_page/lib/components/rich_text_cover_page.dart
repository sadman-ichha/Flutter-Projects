import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfRichText extends pw.StatelessWidget {
  final String title;
  final String dynamicText;
  final pw.TextStyle? titleTextStyle;
  final pw.TextStyle? textStyle;

  PdfRichText({
    Key? key,
    required this.title,
    required this.dynamicText,
    required this.titleTextStyle,
    required this.textStyle,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.RichText(
      text: pw.TextSpan(
        style: textStyle,
        children: [
          pw.TextSpan(
            text: '$title ',
            style: titleTextStyle!.copyWith(color: PdfColors.black),
          ),
          pw.TextSpan(
            text: dynamicText,
            style: textStyle!.copyWith(color: PdfColors.black),
          ),
        ],
      ),
    );
  }
}
