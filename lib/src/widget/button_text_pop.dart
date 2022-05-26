import 'package:flutter/material.dart';

class ButtonTextPop extends StatelessWidget {
  final String text;
  final Color color;
  final String navigation;
  const ButtonTextPop({
    Key? key,
    required this.text,
    required this.color,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context, navigation);
      },
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
