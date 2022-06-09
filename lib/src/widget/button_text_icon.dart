import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class ButtonTextIcon extends StatelessWidget {
  final String text;
  final Color color;
  final String navigation;
  const ButtonTextIcon({
    Key? key,
    required this.text,
    required this.color,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, navigation);
      },
      label: const Icon(
        Icons.chevron_right,
        color: MyColors.textButton,
      ),
      icon: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
