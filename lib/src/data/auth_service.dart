import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/user_model.dart';
import 'package:gotravel/src/provider/user_provider.dart' as user_provider;
import 'package:gotravel/src/utils/utils.dart' as utils;
import 'package:gotravel/src/data/share_prefs.dart';

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
      SharePrefs.instance.provider = Constants.provGoogle;
      utils.hideLoadingIndicator(context);
      Navigator.of(context).pushReplacementNamed(Constants.routesHome);
    });
  } catch (e) {
    debugPrint(e.toString());
  }
}

logOut(context) async {
  if (SharePrefs.instance.provider == Constants.provGoogle) {
    await googleSignIn.signOut();
  }
  await _firebaseAuth.signOut().then((value) {
    Navigator.of(context).pushReplacementNamed(Constants.routesLogin);
  });
}

//Registrar usuario
createUserWithEmailAndPassword(context, UserModel user) async {
  user.password = utils.sha256Password(user.password!);
  utils.showLoadingIndicator(context, Constants.loadSingUp);

  try {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
    User us = result.user!;
    await us.updateDisplayName(user.userName);
    user.id =
        _firebaseAuth.currentUser!.uid; //se añade el id del auth al modelo

    await user_provider.addUser(user); //se añade a firestore

    // if (user.avatar != null) {
    //   await _firebaseAuth.currentUser!.updatePhotoURL(user.avatar);
    // }

    utils.hideLoadingIndicator(context);
    utils.showAlertDialog(context, Constants.textRegistration,
        Constants.textRegistered, () => Navigator.pop(context));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'auth/email-already-exists') {
      _errorAlert(context, Constants.emailRegistered);
    } else {
      _errorAlert(context, e.message);
    }
  } catch (e) {
    utils.hideLoadingIndicator(context);
    _errorAlert(context, e);
  }
}

//autentica un usuario con email y contraseña
singInWithEmailAndPass(context, UserModel user) async {
  utils.showLoadingIndicator(context, Constants.loadLogin);
  try {
    await _firebaseAuth
        .signInWithEmailAndPassword(
            email: user.email!, password: utils.sha256Password(user.password!))
        .then((value) {
      utils.hideLoadingIndicator(context);
      SharePrefs.instance.provider = (Constants.provEmail);
      Navigator.of(context).pushReplacementNamed(Constants.routesHome);
    }); //added this line
  } on FirebaseAuthException catch (e) {
    //error controlado de email o contraseñas no correctas
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      _errorAlert(context, Constants.wrongUserOrPass);
    } else {
      _errorAlert(context, e.message);
    }
  } catch (e) {
    _errorAlert(context, e);
  }
}

Future<void> updateProfile(context, UserModel user) async {
  try {
    if (user.password!.isNotEmpty) {
      user.password = utils.sha256Password(user.password!);
      _firebaseAuth.currentUser!.updatePassword(user.password!);
    }
    if (_firebaseAuth.currentUser!.email != user.email) {
      await _firebaseAuth.currentUser!.updateEmail(user.email!);
    }
    if (user.avatar != null) {
      await _firebaseAuth.currentUser!.updatePhotoURL(user.avatar);
    }
    if (_firebaseAuth.currentUser!.displayName != user.userName) {
      await _firebaseAuth.currentUser!.updateDisplayName(user.userName);
    }
    user_provider.updateUser(
        _firebaseAuth, user.password!.isNotEmpty ? user.password : null);
    _closeLoadingAndNav(context, user);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'auth/id-token-expired') {
      _errorAlert(context, Constants.recentLogin);
    } else if (e.code == 'auth/email-already-exists') {
      _errorAlert(context, Constants.emailInUse);
    } else {
      _errorAlert(context, e.code);
    }
  } catch (ex) {
    _errorAlert(context, ex);
  }
}

_errorAlert(context, val) {
  utils.hideLoadingIndicator(context);
  utils.showAlertDialog(context, Constants.error, val);
}

_closeLoadingAndNav(context, user) {
  utils.hideLoadingIndicator(context);
  Navigator.of(context).pushReplacementNamed(Constants.routesHome);
}
