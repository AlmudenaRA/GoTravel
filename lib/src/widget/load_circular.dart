import 'package:flutter/material.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class LoadCircular extends StatelessWidget {
  final String textTitle;
  final String textSubtitle;
  const LoadCircular(
      {Key? key, required this.textTitle, this.textSubtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _getLoadingIndicator(),
            _getHeading(textTitle),
            _getText(textSubtitle)
          ],
        ));
  }

  Widget _getLoadingIndicator() {
    return const Padding(
        child: SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.secundary),
            ),
            width: 40,
            height: 40),
        padding: EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(String textTitle) {
    return Padding(
        child: Text(
          textTitle,
          style: const TextStyle(
              color: MyColors.textButton,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.only(bottom: 4));
  }

  Widget _getText(String textSubtitle) {
    return Text(
      textSubtitle,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}
