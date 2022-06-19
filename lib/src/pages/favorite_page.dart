import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/favorite_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/card_fav.dart';
import 'package:gotravel/src/widget/text_data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final CollectionReference favRef =
      FirebaseFirestore.instance.collection(Constants.collectionFavorite);
  FavoriteModel favorite = FavoriteModel();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return _listFav();
  }

  _listFav() {
    return FutureBuilder(
      future: favRef
          .where("idUser", isEqualTo: _auth.currentUser!.uid)
          .orderBy("location")
          .get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.secundary,
          ));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            favorite = FavoriteModel.fromJson(snapshot.data.docs[index].data());
            return CardFav(favModel: favorite);
          },
        );
      },
    );
  }
}
