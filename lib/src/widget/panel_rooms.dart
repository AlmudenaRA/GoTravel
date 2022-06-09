import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/buttons_minus_plus.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/widget/text_field_container.dart';

class PanelRooms extends StatelessWidget {
  const PanelRooms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        borderRadius: 15,
        margin: 20,
        paddingVert: 5,
        paddingHoriz: 20,
        width: 0.7,
        height: 150,
        child: Column(
          children: [
            const TextData(
              text: Constants.room,
              color: MyColors.textWhite,
              fontSize: 18,
              padding: EdgeInsets.all(10),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextData(
                  text: Constants.adult,
                  color: MyColors.textWhite,
                  fontSize: 15,
                ),
                MinusPlusButtons(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextData(
                  text: Constants.children,
                  color: MyColors.textWhite,
                  fontSize: 15,
                ),
                MinusPlusButtons(),
              ],
            ),
          ],
        ));
  }
}
