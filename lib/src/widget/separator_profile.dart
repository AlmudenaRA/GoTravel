import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class SeparatorProfile extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final String? navigateTo;
  final IconData icon;
  final double size;

  const SeparatorProfile(
      {Key? key,
      required this.text,
      this.onPressed,
      this.navigateTo,
      required this.icon,
      this.size = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(right: 30, left: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            primary: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () => onPressed!(),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    icon,
                    size: size == 0.0 ? 19 : size,
                    color: MyColors.textWhite,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.textWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 10,
              color: MyColors.textWhite,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
