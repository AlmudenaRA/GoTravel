import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';

//comprobar vacios
isTxtEmpty(String str) {
  if (str.isEmpty) {
    return Constants.strEmpty;
  }
  return;
}

//comprueba si el formato del email es válido
bool validEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

//valida el email
// validateEmail(String email) {
//   if (!_validEmail(email)) {
//     return Constants.errorFormatEmail;
//   }
//   return;
// }

// String validateEmail(String email) {
//   String msj;
//   msj = isTxtEmpty(email);

//   if (msj.isEmpty) {
//     if (!_validEmail(email)) {
//       msj = Constants.errorFormatEmail;
//     }
//   }

//   return msj;
// }

//comprueba la longitud de la contrasenia
validatePass(String pass) {
  if (pass.length < 8) {
    return Constants.errorLenghtPass;
  }
  return;
}
// String validatePass(String pass) {
//   String msj;
//   msj = isTxtEmpty(pass);

//   if (msj.isEmpty) {
//     if (pass.length < 8) {
//       return Constants.errorLenghtPass;
//     }
//   }

//   return msj;
// }

//cifrar contraseña
String sha256Password(String pass) {
  var bytes = utf8.encode(pass);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

//muestra un alertDialog para avisar al usuario
void showAlertDialog(BuildContext context, String title, String content,
    [onPressed]) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(Constants.buttonOk),
              onPressed: () {
                Navigator.of(context).pop(); //cierra la alerta
              },
            ),
          ],
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      });
}

void hideLoadingIndicator(context) => Navigator.pop(context);

void showLoadingIndicator(context, [String? text]) {
  showDialog(
    context: context,
    barrierDismissible: false, //impide que el usuario cierre pulsando fuera
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async =>
            false, // impide que el usuario cierre cuando pulse atrás
        child: AlertDialog(
          content: loadingIndicator(
              indicatorType: const CircularProgressIndicator(),
              colors: [MyColors.secundaryLig],
              strokeWidth: 2,
              text: Text(text!)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    },
  );
}

loadingIndicator(
    {indicatorType,
    required List<Color> colors,
    required int strokeWidth,
    Color? backgroundColor,
    Color? pathBackgroundColor,
    Text? text}) {}
