import 'package:flutter/material.dart';
import 'package:gotravel/constants.dart';
import 'package:gotravel/src/components/text_field_container.dart';
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
        obscureText: true,
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: Constants.textPass,
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
