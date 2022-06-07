import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final Color color;
  final String text;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  final double fontSize;
  const TextData({
    Key? key,
    required this.color,
    required this.text,
    this.padding,
    this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
