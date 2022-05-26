import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/utils/utils.dart' as utils;

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final Function onSaved;
  final bool pass;
  final bool email;
  final String? initialValue;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.name,
    required this.onSaved,
    this.pass = false,
    this.email = false,
    this.initialValue,
  }) : super(key: key);

  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<RoundedInputField> {
  bool _passVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
          initialValue: widget.initialValue ?? widget.initialValue,
          style: const TextStyle(color: MyColors.textWhite),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: MyColors.textWhite),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                widget.icon,
                color: MyColors.textWhite,
              ),
            ),
            filled: true,
            fillColor: MyColors.pLight,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: MyColors.secundary, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: MyColors.pLight),
            ),
            suffixIcon: widget.pass
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      color: MyColors.textWhite,
                      icon: _passVisibility
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        _passVisibility = !_passVisibility;
                        setState(() {});
                      },
                    ),
                  )
                : null,
          ),
          cursorColor: MyColors.secundary,
          obscureText: widget.pass ? _passVisibility : false,
          onSaved: (val) => widget.onSaved(val),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return Constants.strEmpty;
            } else if (widget.email) {
              if (!utils.validEmail(val)) {
                return Constants.errorFormatEmail;
              }
            } else if (widget.pass) {
              if (val.length < 8) {
                return Constants.errorLenghtPass;
              }
            }
            return null;
          }),
    );
  }
}
