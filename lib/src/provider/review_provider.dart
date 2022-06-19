import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/review_model.dart';

CollectionReference hotelRef =
    FirebaseFirestore.instance.collection(Constants.collectionHotel);
CollectionReference reviewRef =
    FirebaseFirestore.instance.collection(Constants.collectionReview);

addReview(ReviewModel review) async {
  return reviewRef
      .doc(review.idReview)
      .set(review.toJson(), SetOptions(merge: true))
      .onError(
          (error, stackTrace) => debugPrint("Error writing document: $error"));
}
