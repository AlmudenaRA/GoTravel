import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/user_model.dart';

CollectionReference userRef =
    FirebaseFirestore.instance.collection(Constants.userColl);

//Añadir usuario a firestore.
Future<void> addUser(UserModel user) async {
  userRef.doc(user.id).set(user.toJson());
}

//Añadir un usuario de google a firestore.
Future<void> addUserAuth(FirebaseAuth auth) async {
  userRef.doc(auth.currentUser!.uid).get().then((doc) => {
        if (!doc.exists)
          {
            userRef.doc(auth.currentUser!.uid).set({
              Constants.userId: auth.currentUser!.uid,
              Constants.userUserName: auth.currentUser!.displayName,
              Constants.userEmail: auth.currentUser!.email,
              Constants.userAvatar: auth.currentUser?.photoURL,
              Constants.userPoint: int,
              Constants.userFav: [],
            }),
          }
      });
}

//Modificar un usuario registrado
Future<void> updateUser(FirebaseAuth auth, [String? pass]) async {
  if (pass == null) {
    userRef.doc(auth.currentUser!.uid).update({
      Constants.userEmail: auth.currentUser!.email,
      Constants.userAvatar: auth.currentUser?.photoURL,
      Constants.userUserName: auth.currentUser!.displayName
    });
  } else {
    userRef.doc(auth.currentUser!.uid).update({
      Constants.userEmail: auth.currentUser!.email,
      Constants.userAvatar: auth.currentUser?.photoURL,
      Constants.userUserName: auth.currentUser!.displayName,
      Constants.userPass: pass,
    });
  }
}
