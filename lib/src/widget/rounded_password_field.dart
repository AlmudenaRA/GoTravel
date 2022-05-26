import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/widget/text_field_container.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: MyColors.textWhite),
        obscureText: true,
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: Constants.textPass,
          hintStyle: TextStyle(color: MyColors.textWhite),
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: MyColors.textWhite,
          ),
          suffixIcon: Icon(
            Icons.visibility_outlined,
            color: MyColors.textWhite,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
