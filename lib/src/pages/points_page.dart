import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button.dart';
import 'package:gotravel/src/widget/text_data.dart';

void showDialogPoint(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (buildcontext) {
      return SimpleDialog(
        backgroundColor: MyColors.pLight,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextData(
                padding: EdgeInsets.only(left: 25),
                color: MyColors.textWhite,
                text: Constants.point,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              TextData(
                padding: EdgeInsets.only(right: 25),
                color: MyColors.secundary,
                text: Constants.point,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextData(
                padding: EdgeInsets.only(left: 25),
                color: MyColors.textWhite,
                text: Constants.discount,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              TextData(
                padding: EdgeInsets.only(right: 25),
                color: MyColors.secundary,
                text: Constants.point,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextData(
                padding: EdgeInsets.only(left: 25),
                color: MyColors.textWhite,
                text: Constants.code,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              TextData(
                padding: EdgeInsets.only(right: 25),
                color: MyColors.secundary,
                text: Constants.point,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                width: 0.38,
                heigth: 50,
                color: MyColors.red,
                text: Constants.buttonCancel,
                onPressed: () => Navigator.pop(context),
              ),
              Button(
                width: 0.38,
                heigth: 50,
                color: MyColors.secundary,
                text: Constants.buttonApply,
                onPressed: () => _onPressed(),
              ),
            ],
          ),
        ],
      );
    },
  );
}

_onPressed() async {
  return null;
}
