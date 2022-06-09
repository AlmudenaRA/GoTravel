import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/text_data.dart';

class ButtonStar extends StatelessWidget {
  final String text;

  const ButtonStar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: MyColors.secundary,
            onTap: () => const Icon(Icons.star, color: MyColors.secundary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.star, color: MyColors.textButton),
                TextData(
                  text: text,
                  color: MyColors.textWhite,
                  fontSize: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
