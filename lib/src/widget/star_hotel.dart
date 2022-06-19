import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class StarHotel extends StatelessWidget {
  final int index;
  final double size;
  const StarHotel({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stars(index);
  }

  stars(index) {
    switch (index) {
      case 0:
        return Row(
          children: [
            _starBlack(),
            _starBlack(),
            _starBlack(),
            _starBlack(),
            _starBlack(),
          ],
        );
      case 1:
        return Row(
          children: [
            _starWhite(),
            _starBlack(),
            _starBlack(),
            _starBlack(),
            _starBlack(),
          ],
        );
      case 2:
        return Row(
          children: [
            _starWhite(),
            _starWhite(),
            _starBlack(),
            _starBlack(),
            _starBlack(),
          ],
        );
      case 3:
        return Row(
          children: [
            _starWhite(),
            _starWhite(),
            _starWhite(),
            _starBlack(),
            _starBlack(),
          ],
        );
      case 4:
        return Row(
          children: [
            _starWhite(),
            _starWhite(),
            _starWhite(),
            _starWhite(),
            _starBlack(),
          ],
        );
      case 5:
        return Row(
          children: [
            _starWhite(),
            _starWhite(),
            _starWhite(),
            _starWhite(),
            _starWhite(),
          ],
        );
      default:
        return const Center();
    }
  }

  _starBlack() {
    return Icon(
      Icons.star,
      color: MyColors.starBlack,
      size: size + 2.0,
    );
  }

  _starWhite() {
    return Icon(
      Icons.star,
      color: MyColors.textWhite,
      size: size,
    );
  }
}
