import 'package:flutter/material.dart';
import 'package:gotravel/constants.dart';
import 'package:gotravel/src/components/button_text.dart';
import 'package:gotravel/src/components/rounded_button.dart';
import 'package:gotravel/src/components/rounded_input_fiel.dart';
import 'package:gotravel/src/components/rounded_password_field.dart';
import 'package:gotravel/src/data/auth_service.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: FractionallySizedBox(
                widthFactor: .4,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
              ),
            ),
            RoundedInputField(
              hintText: Constants.textEmail,
              icon: Icons.email_outlined,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            const RoundedButton(
              text: Constants.buttonLogin,
              //onPressed: () => _onPressed(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  Constants.textCuenta,
                  style: TextStyle(color: MyColors.textWhite),
                ),
                ButtonText(
                  text: Constants.buttonSingUp,
                  color: MyColors.secundaryLig,
                  navigation: Constants.routesSingUp,
                ),
              ],
            ),
            const Text(
              Constants.textOr,
              style: TextStyle(color: MyColors.textWhite),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Constants.textSingIn,
              style: TextStyle(
                color: MyColors.secundaryLig,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () => signInWithGoogle(context),
              iconSize: 50,
              icon: Image.asset(
                'assets/icons/google.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
