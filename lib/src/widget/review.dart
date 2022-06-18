import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/text_data.dart';

class Review extends StatelessWidget {
  const Review({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: MyColors.secundaryDark,
              width: 35,
              height: 35,
              margin: const EdgeInsets.only(left: 20),
              child: const Center(
                child: TextData(
                  text: "7.5",
                  color: MyColors.textButton,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TextData(
              padding: EdgeInsets.only(left: 20),
              text: "User name",
              color: MyColors.textButton,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                  child: SizedBox(
                width: 335,
                height: 80,
                child: TextData(
                  padding: EdgeInsets.only(left: 20),
                  text: Constants.description,
                  color: MyColors.textWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ))
            ]))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
