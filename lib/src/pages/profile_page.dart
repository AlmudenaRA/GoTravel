import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/points_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/data/share_prefs.dart';
import 'package:gotravel/src/widget/separator_profile.dart';
import 'package:gotravel/src/data/auth_service.dart' as auth_service;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
              radius: 70,
              backgroundColor: MyColors.secundary,
              child: CircleAvatar(
                backgroundColor: MyColors.background,
                backgroundImage: _auth.currentUser!.photoURL != null
                    ? NetworkImage('${_auth.currentUser!.photoURL}')
                    : const NetworkImage(Constants.defaultImage),
                radius: 68,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${_auth.currentUser!.displayName}',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: MyColors.textWhite,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${_auth.currentUser!.email}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyColors.textWhite,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SharePrefs.instance.provider != Constants.provEmail
              ? const SizedBox(
                  height: 0,
                )
              : SeparatorProfile(
                  text: Constants.textEditProfile,
                  icon: Icons.edit,
                  onPressed: () =>
                      Navigator.pushNamed(context, Constants.routesEditProfile),
                ),
          // SeparatorProfile(
          //   text: Constants.textFavorite,
          //   icon: Icons.favorite,
          //   onPressed: () =>
          //       Navigator.pushNamed(context, Constants.routesFavorite),
          // ),
          // SeparatorProfile(
          //     text: Constants.textPoint,
          //     icon: Icons.app_shortcut,
          //     size: 25.0,
          //     onPressed: () => showDialogPoint(context)),
          SeparatorProfile(
              text: Constants.textLogOut,
              icon: Icons.logout,
              size: 25.0,
              onPressed: () => auth_service.logOut(context)),
        ],
      ),
    );
  }
}
