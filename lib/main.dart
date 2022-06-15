import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/data/share_prefs.dart';
import 'package:gotravel/src/pages/details_hotel_page.dart';
import 'package:gotravel/src/pages/favorite_page.dart';
import 'package:gotravel/src/pages/filter_page.dart';
import 'package:gotravel/src/pages/home_page.dart';
import 'package:gotravel/src/pages/login_page.dart';
import 'package:gotravel/src/pages/profile_page.dart';
import 'package:gotravel/src/pages/room_page.dart';
import 'package:gotravel/src/pages/sing_up_page.dart';
import 'package:gotravel/src/pages/splash_screen.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/pages/edit_profile_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //Inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //iniciar preferencias de la app
  final prefs = SharePrefs();
  prefs.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        Constants.routesSingUp: (_) => const SingUpPage(),
        Constants.routesHome: (_) => const MyHomePage(),
        Constants.routesProfile: (_) => const ProfilePage(),
        Constants.routesFavorite: (_) => const FavoritePage(),
        Constants.routesEditProfile: (_) => const EditProfilePage(),
        Constants.routesFilter: (_) => const FilterPage(),
        Constants.routesRoom: (_) => const RoomsPage(),
      },

      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('es', 'ES'),
      ],
    );
  }
}
