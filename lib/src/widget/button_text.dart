import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  const ButtonText({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
