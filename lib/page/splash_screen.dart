import 'package:flutter/material.dart';
import 'package:gotravel/page/home_page.dart';
import 'package:gotravel/theme/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(
            title: "",
          ),
        ),
      ),
    );
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
