import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/favorite_model.dart';

CollectionReference hotelRef =
    FirebaseFirestore.instance.collection(Constants.collectionHotel);
CollectionReference favRef =
    FirebaseFirestore.instance.collection(Constants.collectionFavorite);

addFav(FavoriteModel fav) async {
  return favRef
      .doc(fav.idFav)
      .set(fav.toJson(), SetOptions(merge: true))
      .onError(
          (error, stackTrace) => debugPrint("Error writing document: $error"));
}

deleteFav(FavoriteModel fav) async {
  return favRef.doc(fav.idFav).delete().onError(
      (error, stackTrace) => debugPrint("Error update document: $error"));
}
