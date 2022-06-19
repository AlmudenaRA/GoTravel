import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/favorite_page.dart';
import 'package:gotravel/src/pages/profile_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/pages/main_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const MainPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.pDark,
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
                backgroundColor: MyColors.background,
                radius: 15,
                backgroundImage: _auth.currentUser!.photoURL != null
                    ? NetworkImage('${_auth.currentUser!.photoURL}')
                    : const NetworkImage(Constants.defaultImage),
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
