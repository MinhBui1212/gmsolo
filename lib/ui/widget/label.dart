import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(
      {super.key,
      required this.label,
      required this.textStyle,
      this.textAlign = TextAlign.start});
  final String label;
  final TextAlign textAlign;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: textStyle,
    );
  }
}
