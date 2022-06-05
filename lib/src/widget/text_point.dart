import 'package:flutter/material.dart';

class TextPoints extends StatelessWidget {
  final Color color;
  final String texto;
  final EdgeInsets padding;
  const TextPoints({
    Key? key,
    required this.color,
    required this.texto,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
