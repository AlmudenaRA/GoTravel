import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotravel/constants.dart';
import 'package:gotravel/pages/login_page.dart';
import 'package:gotravel/pages/sing_up.dart';
import 'package:gotravel/pages/splash_screen.dart';
import 'package:gotravel/theme/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Forzar la pantalla en vertical
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'GoTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.background,
        primaryColor: MyColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Constants.routesSplash,
      routes: {
        Constants.routesSplash: (_) => const SplashScreen(),
        Constants.routesLogin: (_) => const LoginPage(),
        Constants.routesSingUp: (_) => const SingUp(),
      },
    );
  }
}
