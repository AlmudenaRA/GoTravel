import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class TxtComment extends StatefulWidget {
  final TextInputType keyboardType;
  final Function onSaved;

  const TxtComment({
    Key? key,
    this.keyboardType = TextInputType.name,
    required this.onSaved,
  }) : super(key: key);

  @override
  _TxtCommentState createState() => _TxtCommentState();
}

class _TxtCommentState extends State<TxtComment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        style: const TextStyle(color: MyColors.textWhite, fontSize: 14),
        keyboardType: widget.keyboardType,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: Constants.textComment,
          hintStyle: const TextStyle(color: MyColors.textWhite),
          filled: true,
          fillColor: MyColors.pLight,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: MyColors.secundary, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: MyColors.pLight),
          ),
        ),
        cursorColor: MyColors.secundary,
        onSaved: (val) {
          widget.onSaved(val);
        },
        //validator: (val) => val == null ? Constants.strEmpty : null
      ),
    );
  }
}
