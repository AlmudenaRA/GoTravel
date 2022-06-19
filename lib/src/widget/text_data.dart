import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final Color color;
  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final FontWeight? fontWeight;
  final double fontSize;
  const TextData({
    Key? key,
    required this.color,
    required this.text,
    this.padding,
    this.margin,
    this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
