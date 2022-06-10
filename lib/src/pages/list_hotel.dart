import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/card_hotel.dart';

class ListHotel extends StatefulWidget {
  const ListHotel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListHotelState();
}

class ListHotelState extends State<ListHotel> {
  final CollectionReference collectRef =
      FirebaseFirestore.instance.collection(Constants.collectionHotel);
  HotelModel hotel = HotelModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: collectRef.get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.secundary,
          ));
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: 3, //TODO snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            //TODO HotelModel hotel = HotelModel.fromJson(snapshot.data.docs[index].data());
            return const CardHotel(
                //hotelModel: hotel,
                );
          },
        );
      },
    );
  }
}
