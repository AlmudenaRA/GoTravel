//import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class ButtonFavorite extends StatelessWidget {
  final bool isFavorite;
  final Function onPressed;
  final Color color;

  const ButtonFavorite({
    Key? key,
    required this.isFavorite,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed(),
        icon: Icon(
          Icons.favorite,
          color: color,
          size: 30,
        ),
        tooltip: Constants.tooltipFav);

    // return FavoriteButton(
    //   isFavorite: isFavorite,
    //   iconSize: 40,
    //   iconDisabledColor: MyColors.textWhite,
    //   iconColor: MyColors.secundary,
    //   valueChanged: () => valueChanged(),
    // );
  }
}
