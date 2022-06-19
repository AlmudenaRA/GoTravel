import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class ButtonTextIcon extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final IconData icon;
  final double? fontsize;

  const ButtonTextIcon(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.icon,
      this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onPressed(),
      label: Icon(
        icon,
        color: MyColors.textButton,
      ),
      icon: Text(
        text,
        style: TextStyle(color: color, fontSize: fontsize),
      ),
    );
  }
}
