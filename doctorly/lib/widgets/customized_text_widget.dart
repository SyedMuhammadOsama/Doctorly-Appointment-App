import 'package:flutter/material.dart';

class CustomizedTextWidget extends StatelessWidget {
  String text;

  final double height;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final double wordSpacing;
  final TextAlign alignment;

  CustomizedTextWidget(this.text,
      {this.height = 1,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.fontSize = 14,
      this.wordSpacing = 1,
      this.alignment = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
        wordSpacing: wordSpacing,
        color: color,
      ),
    );
  }
}
