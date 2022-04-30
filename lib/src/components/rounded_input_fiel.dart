import 'package:flutter/material.dart';
import 'package:gotravel/src/components/text_field_container.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.keyboardType = TextInputType.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: MyColors.textWhite),
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: MyColors.textWhite),
          prefixIcon: Icon(
            icon,
            color: MyColors.textWhite,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
