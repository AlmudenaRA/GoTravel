import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double width;
  final double height;
  final double margin;
  final double paddingHoriz;
  final double paddingVert;
  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.margin,
    required this.paddingHoriz,
    required this.paddingVert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      padding:
          EdgeInsets.symmetric(horizontal: paddingHoriz, vertical: paddingVert),
      width: size.width * width,
      height: height,
      decoration: BoxDecoration(
        color: MyColors.pLight,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
