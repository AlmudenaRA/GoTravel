import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/user_model.dart';
import 'package:gotravel/src/provider/user_provider.dart' as user_provider;
import 'package:gotravel/src/utils/utils.dart' as utils;

final googleSignIn = GoogleSignIn();
final _firebaseAuth = FirebaseAuth.instance;

signInWithGoogle(context) async {
  try {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    // Crea una nueva credencial
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential).then((value) {
      user_provider.addUserAuth(_firebaseAuth);
      Navigator.pushNamed(context, Constants.routesHome);
    });
  } catch (e) {
    debugPrint(e.toString());
  }
}

//Cerrar sesión Google
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
}

//Cerrar sesión auth
Future<void> signOut() async {
  await _firebaseAuth.signOut();
}

//Registrar usuario
createUserWithEmailAndPassword(context, UserModel user) async {
  user.password = utils.sha256Password(user.password!);
  //crea un alertDialog para darle feedback al usuario de que está trabajando internamente
  utils.showLoadingIndicator(context, 'Registrando');
  try {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
    User? us = result.user;
    await us!.updateDisplayName(user.userName);
    user.id =
        _firebaseAuth.currentUser!.uid; //se añade el id del auth al modelo
    await user_provider.addUser(user); //se añade a firestore
    if (user.avatar != null) {
      await _firebaseAuth.currentUser!.updatePhotoURL(user.avatar);
    }
    utils.hideLoadingIndicator(context);
    utils.showAlertDialog(context, Constants.textRegistration,
        Constants.textRegistered, () => Navigator.pop(context));
  } on FirebaseAuthException catch (e) {
    //error controlado de duplicidad de email
    if (e.code == Constants.emailRegistered) {
      _errorAlert(context, Constants.emailRegistered);
    } else {
      _errorAlert(context, e.message);
    }
  } catch (e) {
    utils.hideLoadingIndicator(context);
    _errorAlert(context, e);
  }
}

_errorAlert(context, val) {
  utils.hideLoadingIndicator(context);
  utils.showAlertDialog(context, Constants.error, val);
}

_closeCircAndNav(context, user) {
  user_provider.updateUser(_firebaseAuth, user.pass ?? user.pass);
  utils.hideLoadingIndicator(context);
  Navigator.of(context).pushReplacementNamed(Constants.routesHome);
}
