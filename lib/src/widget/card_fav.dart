import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/models/favorite_model.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/pages/details_hotel_page.dart';
import 'package:gotravel/src/provider/fav_provider.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/favorite_button.dart';
import 'package:gotravel/src/widget/star_hotel.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:uuid/uuid.dart';

class CardFav extends StatelessWidget {
  final FavoriteModel favModel;

  const CardFav({
    Key? key,
    required this.favModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference hotelRef =
        FirebaseFirestore.instance.collection(Constants.collectionHotel);
    return StreamBuilder(
        stream:
            hotelRef.where("idHotel", isEqualTo: favModel.idHotel).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var docs = snapshot.data.docs;
            final hotel = docs[0].data()!;
            return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailHotel(hotelModel: hotelModel)));
                },
                child: Stack(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: const BoxDecoration(
                        color: MyColors.pDark,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        // Container(
                        //   width: 320,
                        //   decoration: const BoxDecoration(
                        //     color: MyColors.pLight,
                        //     shape: BoxShape.circle,
                        //     //borderRadius: BorderRadius.all(Radius.circular(10)
                        //   ),
                        //   child: hotel["photo"[0]].isEmpty
                        //       ? Image.network(Constants.hotelImageUnavailable)
                        //       : Image.network(hotel["photo"[0]].toString()),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextData(
                                    padding: const EdgeInsets.only(top: 10),
                                    text: hotel["hotelName"],
                                    color: MyColors.textWhite,
                                    fontSize: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      StarHotel(
                                        index: hotel["star"],
                                        size: 10,
                                      ),
                                      TextData(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        text: hotel["location"],
                                        color: MyColors.textWhite,
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ]),
                            ButtonFavorite(
                                isFavorite: true,
                                color: MyColors.secundary,
                                onPressed: () => deleteFav(favModel)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]));
          }
          return Container();
        });
  }
}
