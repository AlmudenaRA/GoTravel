import 'package:flutter/material.dart';
import 'package:gotravel/src/widget/rounded_button.dart';
import 'package:gotravel/src/widget/text_data.dart';

import '../theme/my_colors.dart';

class MinusPlusButtons extends StatelessWidget {
  const MinusPlusButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        RoundedButton(
          icon: Icons.remove,
          minus: true,
        ),
        SizedBox(
          width: 10,
        ),
        TextData(
          text: "1",
          color: MyColors.textWhite,
          fontSize: 15,
        ),
        SizedBox(
          width: 10,
        ),
        RoundedButton(
          icon: Icons.add,
          plus: true,
        ),
      ],
    );
  }
}
