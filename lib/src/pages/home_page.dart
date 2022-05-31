import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/favorite_page.dart';
import 'package:gotravel/src/pages/profile_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/utils/utils.dart' as utils;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.pLight,
        selectedItemColor: MyColors.secundary,
        unselectedItemColor: MyColors.textWhite,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Constants.bAppBarHome,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: Constants.bAppBarFav,
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: utils.pickImage(_auth),
                radius: 13,
              ),
              label: '${_auth.currentUser!.displayName}'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
