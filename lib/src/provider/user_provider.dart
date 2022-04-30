import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gotravel/src/models/user.dart';

class UserProvider {
  FirebaseStorage get storage => FirebaseStorage.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  //Obtener el usuario actual
  User get currentUser {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) throw Exception('Error en la autenticación');

    return user;
  }

  //Leer un usuario
  // Future<Users> getUsers() async {
  //   final snapshot = await firestore.doc()
  // }
}
