import 'package:flutter/material.dart';
import 'package:gotravel/page/splash_screen.dart';
import 'package:gotravel/theme/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: MyColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
