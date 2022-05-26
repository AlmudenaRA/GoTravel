import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/home_page.dart';
import 'package:gotravel/src/pages/login_page.dart';
import 'package:gotravel/src/pages/sing_up.dart';
import 'package:gotravel/src/pages/splash_screen.dart';
import 'package:gotravel/src/theme/my_colors.dart';

void main() async {
  //Inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      debugShowCheckedModeBanner: false, //quitar etiqueta debug

      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.background,
        primaryColor: MyColors.background,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: Constants.routesSplash,

      routes: {
        Constants.routesSplash: (_) => const SplashScreen(),
        Constants.routesLogin: (_) => const LoginPage(),
        Constants.routesSingUp: (_) => const SingUp(),
        Constants.routesHome: (_) => const MyHomePage(),
      },
    );
  }
}
