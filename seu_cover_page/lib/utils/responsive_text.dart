import 'package:flutter/material.dart';
import 'screen_size.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? scale;

  const ResponsiveText({
    super.key,
    required this.text,
    this.style,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = scale != null
        ? ScreenSize.screenSize.width * scale!
        : Theme.of(context).textTheme.bodyLarge!.fontSize!;

    return Text(
      text,
      style:
          style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
    );
  }
}
