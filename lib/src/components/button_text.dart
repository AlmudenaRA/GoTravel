import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final String navigation;
  const ButtonText({
    Key? key,
    required this.text,
    required this.color,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, navigation);
      },
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
