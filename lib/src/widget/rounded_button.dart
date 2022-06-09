import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final bool plus;
  final bool minus;
  final String? text;
  final Function? onTap;

  const RoundedButton({
    Key? key,
    this.plus = false,
    this.minus = false,
    required this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: ClipOval(
        child: Material(
          color: MyColors.secundary,
          child: InkWell(
            splashColor: MyColors.secundaryLig,
            onTap: () => onTap!(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, color: MyColors.textButton),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
