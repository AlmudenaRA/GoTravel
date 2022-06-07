import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      //Navega a una pag u otra dependiendo de si hay una sesión activa
      final _auth = FirebaseAuth.instance;
      if (_auth.currentUser == null) {
        Navigator.of(context).pushReplacementNamed(Constants.routesLogin);
      } else {
        Navigator.of(context).pushReplacementNamed(Constants.routesHome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        body: SafeArea(
          child: Column(children: <Widget>[
            const Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: .6,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 300,
                ),
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.secundary),
            ),
            const Spacer(),
          ]),
        ));
  }
}
