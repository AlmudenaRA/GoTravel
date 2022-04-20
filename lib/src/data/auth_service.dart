import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotravel/constants.dart';

final googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle(context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Crea una nueva credencial
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  if (googleAuth != null) {
    Navigator.pushNamed(context, Constants.routesHome);
  }

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
}
