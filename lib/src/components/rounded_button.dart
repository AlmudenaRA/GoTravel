import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    this.color = MyColors.secundary,
    this.textColor = MyColors.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
          ),
          onPressed: () {},
          child: Text(text),
        ),
      ),
    );
  }
}
